(function () {
  "use strict";

  function slugify(value) {
    return String(value || "")
      .trim()
      .toLowerCase()
      .replace(/&/g, "and")
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-+|-+$/g, "");
  }

  function parseTags(raw) {
    if (!raw) return [];
    return raw
      .split(",")
      .map(function (t) {
        return t.trim();
      })
      .filter(Boolean);
  }

  document.addEventListener("DOMContentLoaded", function () {
    var controls = document.getElementById("pub-controls");
    var toggleBtn = document.getElementById("pub-filter-toggle");
    var filterBar = document.getElementById("pub-filter-bar");
    var statusEl = document.getElementById("pub-filter-status");
    var searchInput = document.getElementById("pub-search-input");
    if (!filterBar) return;

    var items = Array.from(document.querySelectorAll(".jumbotron ol.bibliography > li"));
    if (!items.length) return;

    var records = items.map(function (li) {
      var card = li.querySelector(".bib-entry[data-venue], .bib-entry[data-tags]");
      var venue = card ? (card.getAttribute("data-venue") || "").trim() : "";
      var tags = card ? parseTags(card.getAttribute("data-tags") || "") : [];
      var searchText = (
        (li.textContent || "") +
        " " +
        venue +
        " " +
        tags.join(" ")
      ).toLowerCase();
      return { li: li, tags: tags, searchText: searchText };
    });

    var tagCounts = new Map();
    records.forEach(function (rec) {
      rec.tags.forEach(function (tag) {
        tagCounts.set(tag, (tagCounts.get(tag) || 0) + 1);
      });
    });

    var sortedTags = Array.from(tagCounts.entries()).sort(function (a, b) {
      return b[1] - a[1] || a[0].localeCompare(b[0]);
    });

    var state = { tag: "", query: "" };

    function matchParam(candidates, paramValue) {
      if (!paramValue) return "";
      var target = paramValue.trim().toLowerCase();
      var targetSlug = slugify(paramValue);
      for (var i = 0; i < candidates.length; i++) {
        var name = candidates[i][0];
        if (name.toLowerCase() === target || slugify(name) === targetSlug) {
          return name;
        }
      }
      return "";
    }

    var params = new URLSearchParams(window.location.search);
    state.tag = matchParam(sortedTags, params.get("tag"));

    function setMenuOpen(open) {
      filterBar.hidden = !open;
      if (toggleBtn) {
        toggleBtn.setAttribute("aria-expanded", open ? "true" : "false");
      }
    }

    if (toggleBtn) {
      toggleBtn.addEventListener("click", function () {
        setMenuOpen(filterBar.hidden);
      });
    }

    document.addEventListener("click", function (event) {
      if (!filterBar.hidden && controls && !controls.contains(event.target)) {
        setMenuOpen(false);
      }
    });

    document.addEventListener("keydown", function (event) {
      if (event.key === "Escape" && !filterBar.hidden) {
        setMenuOpen(false);
        if (toggleBtn) toggleBtn.focus();
      }
    });

    if (sortedTags.length) {
      var chips = document.createElement("div");
      chips.className = "pub-filter-chips";

      sortedTags.forEach(function (pair) {
        var name = pair[0];
        var count = pair[1];
        var btn = document.createElement("button");
        btn.type = "button";
        btn.className = "pub-filter-chip";
        btn.setAttribute("data-filter-value", name);
        btn.setAttribute("aria-pressed", "false");

        var textSpan = document.createElement("span");
        textSpan.textContent = name;
        var countSpan = document.createElement("span");
        countSpan.className = "pub-filter-count";
        countSpan.textContent = String(count);

        btn.appendChild(textSpan);
        btn.appendChild(countSpan);
        btn.addEventListener("click", function () {
          state.tag = state.tag === name ? "" : name;
          applyFilters(true);
          setMenuOpen(false);
        });
        chips.appendChild(btn);
      });

      filterBar.innerHTML = "";
      filterBar.appendChild(chips);
    } else if (toggleBtn) {
      toggleBtn.hidden = true;
    }

    document.querySelectorAll(".pub-tag-pill[data-pub-tag]").forEach(function (pill) {
      pill.addEventListener("click", function () {
        var tagName = (pill.getAttribute("data-pub-tag") || "").trim();
        if (!tagName) return;
        state.tag = state.tag === tagName ? "" : tagName;
        applyFilters(true);
        setMenuOpen(false);
      });
    });

    function syncSectionVisibility() {
      document.querySelectorAll(".jumbotron").forEach(function (section) {
        var sectionItems = Array.from(section.querySelectorAll("ol.bibliography > li"));
        if (!sectionItems.length) return;
        var hasVisible = sectionItems.some(function (li) {
          return !li.classList.contains("pub-filter-hidden");
        });
        section.classList.toggle("pub-section-hidden", !hasVisible);
      });
    }

    function updateUrl() {
      if (!window.history || !window.history.replaceState) return;
      var url = new URL(window.location.href);
      if (state.tag) {
        url.searchParams.set("tag", slugify(state.tag));
      } else {
        url.searchParams.delete("tag");
      }
      window.history.replaceState(null, "", url.pathname + url.search + url.hash);
    }

    function updateStatus(visibleCount) {
      if (!statusEl) return;
      var active = Boolean(state.tag || state.query);
      if (!active) {
        statusEl.hidden = true;
        statusEl.innerHTML = "";
        return;
      }
      statusEl.hidden = false;
      statusEl.innerHTML = "";

      var summary = document.createElement("span");
      var parts = [];
      if (state.tag) parts.push(state.tag);
      if (state.query) parts.push('"' + state.query + '"');
      summary.textContent =
        parts.join(" · ") + " (" + visibleCount + " of " + records.length + ")";

      var clearBtn = document.createElement("button");
      clearBtn.type = "button";
      clearBtn.className = "pub-filter-clear";
      clearBtn.textContent = "Clear";
      clearBtn.addEventListener("click", function () {
        state.tag = "";
        state.query = "";
        if (searchInput) searchInput.value = "";
        applyFilters(true);
        setMenuOpen(false);
      });

      statusEl.appendChild(summary);
      statusEl.appendChild(clearBtn);
    }

    function applyFilters(syncUrl) {
      var q = state.query.trim().toLowerCase();
      var visibleCount = 0;
      records.forEach(function (rec) {
        var matchesTag = !state.tag || rec.tags.indexOf(state.tag) !== -1;
        var matchesQuery = !q || rec.searchText.indexOf(q) !== -1;
        var visible = matchesTag && matchesQuery;
        rec.li.classList.toggle("pub-filter-hidden", !visible);
        if (visible) visibleCount += 1;
      });

      filterBar.querySelectorAll(".pub-filter-chip").forEach(function (chip) {
        var val = chip.getAttribute("data-filter-value");
        var isActive = state.tag === val;
        chip.classList.toggle("is-active", isActive);
        chip.setAttribute("aria-pressed", isActive ? "true" : "false");
      });

      document.querySelectorAll(".pub-tag-pill[data-pub-tag]").forEach(function (pill) {
        var isActive = state.tag === pill.getAttribute("data-pub-tag");
        pill.classList.toggle("is-active", isActive);
        pill.setAttribute("aria-pressed", isActive ? "true" : "false");
      });

      syncSectionVisibility();
      updateStatus(visibleCount);
      if (syncUrl) updateUrl();
    }

    if (searchInput) {
      searchInput.addEventListener("input", function (e) {
        state.query = e.target.value || "";
        applyFilters(false);
      });
    }

    setMenuOpen(false);
    applyFilters(false);
  });
})();
