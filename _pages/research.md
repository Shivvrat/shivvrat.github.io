---
title: "Research"
layout: research_lay
sitemap: false
permalink: /research/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

My research investigates the foundations and practical applications of machine learning, probabilistic modeling, symbolic reasoning, and mathematical optimization. I am driven by a fundamental question: **how can we build AI systems that reason reliably under uncertainty, adhere to hard combinatorial and domain constraints, and scale efficiently in structured environments?**

Modern deep learning achieves remarkable perceptual performance, yet often struggles when tasks demand rigorous logical consistency, combinatorial search, hard constraint satisfaction, or principled uncertainty quantification. Conversely, classical symbolic and probabilistic algorithms offer formal guarantees and interpretability but lack the scalability and flexibility of learned representations. My research bridges this divide by developing hybrid, learning-augmented paradigms that integrate continuous representation learning with discrete and probabilistic reasoning.

<div class="alert alert-info" style="border-radius: 10px; margin-top: 1.25rem; margin-bottom: 1.75rem;">
  🔬 <strong>Looking for current lab projects?</strong> For active student research, benchmark datasets, open-source code repositories, and detailed project breakdowns, please visit the <a href="https://aria-research-lab.github.io/research/" target="_blank" rel="noopener"><strong>ARIA Lab Research</strong></a> page.
</div>

My research agenda is organized around four synergistic pillars:

1. **[Neuro-Symbolic Reasoning and Probabilistic Inference](#neuro-symbolic-reasoning-and-probabilistic-inference)**
2. **[Neural Combinatorial Optimization](#neural-combinatorial-optimization)**
3. **[Structured and Multimodal Intelligence](#structured-and-multimodal-intelligence)**
4. **[AI for Scientific Discovery](#ai-for-scientific-discovery)**

---

## Neuro-Symbolic Reasoning and Probabilistic Inference

Many exact inference tasks in structured probabilistic models, including MPE, constrained MPE, and marginal MAP, are computationally intractable in general. Traditional solvers rely on exponential-time search or relaxation heuristics that struggle to meet the latency demands of real-time intelligent systems. My research explores how learned models can transform the efficiency of probabilistic inference without abandoning mathematical rigor.

Rather than committing to a single computational paradigm, my work develops hybrid architectures across the inference hierarchy:

- **Amortized Neural Approximators:** We design neural networks that directly learn the mapping from graphical model structures and observed evidence to high-quality query solutions in one or a few forward passes. By combining structural and parameter-aware graph embeddings with inference-time self-supervised optimization, our models answer complex queries in milliseconds or microseconds.
- **Neural Augmentation of Algorithmic Solvers:** To maintain rigorous bounding certificates and solution guarantees, we integrate neural guidance directly into classical algorithmic frameworks. Learned components predict valid-by-construction dual warm-starts for linear programming relaxations, learn branching and variable-conditioning heuristics from solver search traces, and guide stochastic local search over high-treewidth models.
- **Optimization-Based Structured Inference & Historical Trajectory:** A foundational thread of my research explores mathematical programming and discrete optimization for structured prediction. In earlier work on multi-label classification across images and videos, I investigated how complex output correlations can be captured via deep dependency networks (DDNs) and resolved using integer linear programming (ILP) and local search. Folding label correlations into explicit dependency structures rather than assuming conditional independence established a key conceptual bridge between discriminative representation learning and combinatorial inference that continues to inform my current work.

<details class="interactive-demo-wrapper" markdown="0">
  <summary class="interactive-demo-summary">
    <span class="interactive-demo-summary-title">
      <span class="interactive-demo-summary-badge">Interactive Demo</span>
      <span>Neural Inference Latency &amp; Speedup Benchmark (SSMP, ITSELF vs. Baseline)</span>
    </span>
    <span class="interactive-demo-summary-chevron">&#9654;</span>
  </summary>
  <div class="interactive-demo-card" id="neural-inference-demo">
  <div class="demo-card-header">
    <div class="demo-title-group">
      <h4>Interactive Benchmark: Neural Inference Latency & Speedup</h4>
      <p>Empirical latency and throughput comparison of our methods (<strong>SSMP</strong>, <strong>ITSELF</strong>) against traditional combinatorial baselines.</p>
    </div>
    <div class="demo-badges">
      <span class="demo-badge demo-badge-oral">AAAI Oral</span>
      <span class="demo-badge demo-badge-spotlight">NeurIPS Spotlight</span>
      <span class="demo-badge demo-badge-sim">Interactive Demo</span>
    </div>
  </div>

  <div class="demo-video-wrapper">
    <video id="benchmark-video" controls playsinline autoplay muted loop preload="metadata">
      <source src="{{ '/assets/video/itself_comparison.mp4' | relative_url }}" type="video/mp4">
      Your browser does not support the video tag.
    </video>
  </div>
  <p class="demo-video-caption">
    <strong>Benchmark Visualization:</strong> One Left&rarr;Right traverse represents 1 inference query. In the time the classical baseline completes a fraction of a query (2.703 s/inf), <strong>ITSELF</strong> completes an iterative test-time optimization pass (784 ms/inf, 3.4&times; faster), while <strong>SSMP</strong> processes over 111,000 queries via amortized continuous relaxation (9.87 &micro;s/inf, &gt;273,000&times; faster).
  </p>

  <div class="demo-metrics-grid">
    <div class="demo-metric-card highlight-green">
      <div class="metric-name">
        <span>SSMP</span>
        <span class="badge badge-success" style="font-size: 0.72rem;">AAAI Oral</span>
      </div>
      <div class="metric-speedup speedup-ssmp">&times;273,860.2</div>
      <div class="metric-stats">
        <strong>1 inference:</strong> 9.870 &micro;s<br>
        <strong>Throughput:</strong> 101,317.12 /s<br>
        <strong>Traverses:</strong> 111,448 one-way
      </div>
    </div>

    <div class="demo-metric-card highlight-blue">
      <div class="metric-name">
        <span>ITSELF</span>
        <span class="badge badge-info" style="font-size: 0.72rem;">NeurIPS Spotlight</span>
      </div>
      <div class="metric-speedup speedup-itself">&times;3.4</div>
      <div class="metric-stats">
        <strong>1 inference:</strong> 784.000 ms<br>
        <strong>Throughput:</strong> 1.28 /s<br>
        <strong>Traverses:</strong> 1 one-way pass
      </div>
    </div>

    <div class="demo-metric-card highlight-gray">
      <div class="metric-name">
        <span>Traditional Baseline</span>
        <span class="badge badge-secondary" style="font-size: 0.72rem;">Exact Solver</span>
      </div>
      <div class="metric-speedup speedup-baseline">&times;1.0</div>
      <div class="metric-stats">
        <strong>1 inference:</strong> 2.703 s<br>
        <strong>Throughput:</strong> 0.37 /s<br>
        <strong>Traverses:</strong> 0 completed in window
      </div>
    </div>

  </div>

  <div class="demo-workload-box">
    <div class="workload-header">
      <h5>Interactive Workload Simulator</h5>
      <div class="workload-controls" role="group" aria-label="Query workload selector">
        <button type="button" class="workload-btn" data-count="1000">1,000 queries</button>
        <button type="button" class="workload-btn active" data-count="10000">10,000 queries</button>
        <button type="button" class="workload-btn" data-count="100000">100,000 queries</button>
        <button type="button" class="workload-btn" data-count="1000000">1,000,000 queries</button>
      </div>
    </div>
    <div class="workload-results-grid">
      <div class="workload-result-item">
        <div class="item-label">SSMP Execution Time</div>
        <div class="item-val speedup-ssmp" id="time-ssmp">98.7 ms</div>
      </div>
      <div class="workload-result-item">
        <div class="item-label">ITSELF Execution Time</div>
        <div class="item-val speedup-itself" id="time-itself">2.18 hours</div>
      </div>
      <div class="workload-result-item">
        <div class="item-label">Baseline Execution Time</div>
        <div class="item-val speedup-baseline" id="time-baseline">7.51 hours</div>
      </div>
    </div>
    <p class="demo-video-caption" id="calc-speedup-highlight" style="margin-top: 0.65rem; margin-bottom: 0;">
      <strong>Key Takeaway:</strong> For 10,000 queries, SSMP finishes in <strong>98.7 ms</strong>, whereas the traditional baseline stalls for <strong>7.51 hours</strong> (over 273,000&times; speedup), unlocking real-time probabilistic reasoning.
    </p>
  </div>
</div>
</details>

<script>
(function() {
  function initBenchmarkCalculator() {
    var buttons = document.querySelectorAll(".workload-btn");
    var resSSMP = document.getElementById("time-ssmp");
    var resITSELF = document.getElementById("time-itself");
    var resBase = document.getElementById("time-baseline");
    var resSpeedup = document.getElementById("calc-speedup-highlight");

    if (!buttons.length || !resSSMP || !resITSELF || !resBase) return;

    var latencies = {
      ssmp: 0.00000987,
      itself: 0.784,
      baseline: 2.703
    };

    function formatTime(seconds) {
      if (seconds < 0.001) return (seconds * 1000000).toFixed(1) + " µs";
      if (seconds < 1) return (seconds * 1000).toFixed(1) + " ms";
      if (seconds < 60) return seconds.toFixed(2) + " sec";
      if (seconds < 3600) return (seconds / 60).toFixed(1) + " min";
      var hours = seconds / 3600;
      if (hours < 24) return hours.toFixed(2) + " hours";
      return (hours / 24).toFixed(1) + " days";
    }

    buttons.forEach(function(btn) {
      btn.addEventListener("click", function() {
        buttons.forEach(function(b) { b.classList.remove("active"); });
        btn.classList.add("active");
        var count = parseInt(btn.getAttribute("data-count"), 10);
        if (isNaN(count)) return;

        var tSSMP = count * latencies.ssmp;
        var tITSELF = count * latencies.itself;
        var tBase = count * latencies.baseline;

        resSSMP.textContent = formatTime(tSSMP);
        resITSELF.textContent = formatTime(tITSELF);
        resBase.textContent = formatTime(tBase);

        if (resSpeedup) {
          if (count >= 10000) {
            resSpeedup.innerHTML = "<strong>Key Takeaway:</strong> For " + count.toLocaleString() + " queries, SSMP finishes in <strong>" + formatTime(tSSMP) + "</strong>, whereas the traditional baseline stalls for <strong>" + formatTime(tBase) + "</strong> (" + (tBase / tSSMP).toFixed(0).toLocaleString() + "&times; speedup), unlocking real-time probabilistic reasoning.";
          } else {
            resSpeedup.innerHTML = "<strong>Key Takeaway:</strong> SSMP processes queries in real time (&lt;10 &micro;s per query), delivering over 273,000&times; speedup over the combinatorial baseline.";
          }
        }
      });
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initBenchmarkCalculator);
  } else {
    initBenchmarkCalculator();
  }
})();
</script>

<details class="interactive-demo-wrapper" markdown="0">
  <summary class="interactive-demo-summary">
    <span class="interactive-demo-summary-title">
      <span class="interactive-demo-summary-badge">Interactive Demo</span>
      <span>Valid-by-Construction Dual Bounds &amp; Search Guidance Simulation (Neural Dual Bounds &amp; L2C)</span>
    </span>
    <span class="interactive-demo-summary-chevron">&#9654;</span>
  </summary>
  <div class="interactive-demo-card" id="dual-bounds-demo">
    <div class="demo-card-header">
      <div class="demo-title-group">
        <h4>Dual Bounding Guarantees &amp; Neural Search Pruning</h4>
        <p>Interactive simulation demonstrating how antisymmetric neural messages guarantee 100% valid upper bounds to warm-start JGLP, while learned conditioning policies (L2C) prune branch-and-bound search trees.</p>
      </div>
      <div class="demo-badges">
        <span class="demo-badge demo-badge-spotlight">NeurIPS Spotlight</span>
        <span class="demo-badge demo-badge-oral">NeurIPS 2025</span>
        <span class="demo-badge demo-badge-sim">Interactive Simulation</span>
      </div>
    </div>

    <!-- Live Simulation Instrument -->
    <div class="demo-workload-box" style="margin-top: 0.5rem;">
      <div class="workload-header">
        <h5>Bound Validity Simulation</h5>
        <div class="workload-controls">
          <button type="button" class="workload-btn active" id="btn-sample-bounds">Sample 25 Predictions</button>
          <button type="button" class="workload-btn" id="btn-reset-bounds">Reset</button>
        </div>
      </div>
      <p class="demo-video-caption" style="margin-top: 0.2rem; margin-bottom: 0.75rem;">
        Each dot represents a predicted dual solution. In exact solvers like branch-and-bound, predicted bounds that fall below the true optimum prune optimal branches. <strong>Antisymmetric messages</strong> guarantee every prediction remains a valid upper bound by construction, whereas unconstrained predictors frequently violate the bounding guarantee.
      </p>

      <div class="sim-strip">
        <div class="sim-strip-row">
          <div class="sim-strip-meta">
            <span class="sim-strip-name">Antisymmetric Messages (Neural Dual Bounds)</span>
            <span class="sim-strip-count" id="count-anti"><strong>25</strong> of 25 valid (100%)</span>
          </div>
          <div class="sim-track" id="track-anti" aria-label="Valid by construction track"></div>
        </div>

        <div class="sim-strip-row">
          <div class="sim-strip-meta">
            <span class="sim-strip-name">Unconstrained Neural Predictors</span>
            <span class="sim-strip-count" id="count-free"><strong>17</strong> of 25 valid (68%)</span>
          </div>
          <div class="sim-track" id="track-free" aria-label="Unconstrained predictors track"></div>
        </div>
      </div>

      <div class="sim-legend">
        <span class="sim-legend-item"><i class="sim-legend-line"></i> True Optimum (MAP*)</span>
        <span class="sim-legend-item"><i class="sim-legend-dot"></i> Valid Upper Bound</span>
        <span class="sim-legend-item"><i class="sim-legend-bad"></i> Invalid (Below Optimum)</span>
      </div>
    </div>

    <!-- Metric Cards Grid -->
    <div class="demo-metrics-grid">
      <div class="demo-metric-card highlight-green">
        <div class="metric-name">
          <span>Neural Dual Bounds</span>
          <span class="badge badge-info" style="font-size: 0.72rem;">NeurIPS Spotlight</span>
        </div>
        <div class="metric-speedup speedup-ssmp">0 Violations</div>
        <div class="metric-stats">
          <strong>Validity:</strong> 100% by construction<br>
          <strong>Dual Gap:</strong> Up to 10<sup>6</sup>&times; reduction in 100 iters<br>
          <strong>Solvers:</strong> JGLP &amp; Constrained MAP
        </div>
      </div>

      <div class="demo-metric-card highlight-blue">
        <div class="metric-name">
          <span>Learning to Condition (L2C)</span>
          <span class="badge badge-success" style="font-size: 0.72rem;">NeurIPS 2025</span>
        </div>
        <div class="metric-speedup speedup-itself">5&times;–10&times;</div>
        <div class="metric-stats">
          <strong>Search tree:</strong> Up to 90% node reduction<br>
          <strong>Policy:</strong> Learned from solver traces<br>
          <strong>Solvers:</strong> AND/OR Branch-and-Bound
        </div>
      </div>

      <div class="demo-metric-card highlight-gray">
        <div class="metric-name">
          <span>Standard Exact Solvers</span>
          <span class="badge badge-secondary" style="font-size: 0.72rem;">Baseline</span>
        </div>
        <div class="metric-speedup speedup-baseline">&times;1.0</div>
        <div class="metric-stats">
          <strong>Scaling:</strong> Exponential in treewidth <em>w</em><br>
          <strong>Search:</strong> Full combinatorial tree expansion<br>
          <strong>Initialization:</strong> Zero or uniform warm-starts
        </div>
      </div>
    </div>

  </div>
</details>

<script>
(function() {
  function initDualBoundsSimulation() {
    var btnSample = document.getElementById("btn-sample-bounds");
    var btnReset = document.getElementById("btn-reset-bounds");
    var trackAnti = document.getElementById("track-anti");
    var trackFree = document.getElementById("track-free");
    var countAnti = document.getElementById("count-anti");
    var countFree = document.getElementById("count-free");

    if (!btnSample || !btnReset || !trackAnti || !trackFree) return;

    var totalSamples = 0;
    var validAnti = 0;
    var validFree = 0;

    function renderDots(num) {
      for (var i = 0; i < num; i++) {
        totalSamples++;

        var posAnti = 40 + Math.random() * 56;
        validAnti++;
        var dotA = document.createElement("div");
        dotA.className = "sim-dot";
        dotA.style.left = posAnti + "%";
        dotA.style.top = (15 + Math.random() * 70) + "%";
        trackAnti.appendChild(dotA);

        var posFree = 8 + Math.random() * 84;
        var dotF = document.createElement("div");
        if (posFree < 40) {
          dotF.className = "sim-dot bad";
        } else {
          validFree++;
          dotF.className = "sim-dot";
        }
        dotF.style.left = posFree + "%";
        dotF.style.top = (15 + Math.random() * 70) + "%";
        trackFree.appendChild(dotF);
      }

      countAnti.innerHTML = "<strong>" + validAnti + "</strong> of " + totalSamples + " valid (100%)";
      var pctFree = Math.round((validFree / totalSamples) * 100);
      countFree.innerHTML = "<strong>" + validFree + "</strong> of " + totalSamples + " valid (" + pctFree + "%)";
    }

    btnSample.addEventListener("click", function() {
      renderDots(25);
    });

    btnReset.addEventListener("click", function() {
      totalSamples = 0;
      validAnti = 0;
      validFree = 0;
      trackAnti.innerHTML = "";
      trackFree.innerHTML = "";
      renderDots(25);
    });

    renderDots(25);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initDualBoundsSimulation);
  } else {
    initDualBoundsSimulation();
  }
})();
</script>

**Representative Contributions & Software:**

- **Neural Dual Bounds** (NeurIPS 2026 Spotlight): Architectures providing valid-by-construction dual warm-starts for Join Graph Linear Programming (JGLP), accelerating MAP and constrained MAP inference while guaranteeing bounding certificates.
- **Learning to Condition (L2C)** (NeurIPS 2025): Neural search policies learned from solver traces that guide variable conditioning and branch-and-bound node selection ([Code](https://github.com/brijml/L2C)).
- **SINE** (AISTATS 2025): Structural and parameter-aware neural embeddings for real-time MPE inference in probabilistic graphical models.
- **BEACON** (arXiv 2026): Amortized neural guidance that steers local-search transitions in repeated MPE queries.
- Foundational inference frameworks: **ITSELF** for neural MPE with test-time self-improvement (NeurIPS 2024 Spotlight; UAI TPM 2024 Best Paper Award; 3.4&times; speedup), **SSMP** continuous multilinear relaxations for marginal MAP in probabilistic circuits (AAAI 2024 Oral; &gt;273,000&times; speedup), self-supervised constrained MPE (AISTATS 2024), and deep dependency networks with ILP inference (AISTATS 2024).
- **[NeuPI](https://neupi.readthedocs.io/en/latest/)**: We have unified these neural inference methods into NeuPI, an open-source library that makes our algorithms accessible through a common interface.

### Optimization-Based Structured Inference

We develop optimization-based structured inference methods that explicitly reason over structured dependencies and combinatorial constraints.

- **Deep Dependency Networks and Advanced Inference Schemes for Multi-Label Classification** ([AISTATS 2024](https://proceedings.mlr.press/v238/arya24a.html))
  - Formulates multi-label prediction in images and videos by coupling deep dependency networks with local search and integer linear programming (ILP) inference, capturing complex label dependencies without sacrificing training simplicity.

<!-- Interactive Demo: DDN-ILP Structured Inference vs Neural Baselines -->
<details class="interactive-demo-wrapper" markdown="0">
  <summary class="interactive-demo-summary">
    <span class="interactive-demo-summary-title">
      <span>Interactive Benchmark: DDN-ILP Structured Inference vs. Neural Baselines</span>
      <span class="interactive-demo-summary-badge">AISTATS 2024</span>
    </span>
    <span class="interactive-demo-summary-chevron">&#9656;</span>
  </summary>

  <div class="interactive-demo-card" id="demo-ddn-card">
    <!-- Header with title, brief description, and badges -->
    <div class="demo-card-header">
      <div class="demo-title-group">
        <h4>Deep Dependency Networks &amp; Advanced MPE Inference (DDN-ILP)</h4>
        <p>Empirical benchmark results from AISTATS 2024 (Tables 1 &amp; 2) comparing combinatorial MILP inference against baseline neural models</p>
      </div>
      <div class="demo-badges">
        <span class="demo-badge demo-badge-oral">AISTATS 2024</span>
        <span class="demo-badge demo-badge-sim">Neurosymbolic AI</span>
      </div>
    </div>

    <!-- Metric Cards Grid -->
    <div class="demo-metrics-grid">
      <div class="demo-metric-card highlight-green">
        <div class="metric-name">
          <span>Subset Accuracy (SA) Gains</span>
          <span class="badge badge-success" style="font-size: 0.72rem;">Tables 1 &amp; 2</span>
        </div>
        <div class="metric-speedup speedup-ssmp" id="metric-ddn-gain">+23% Subset Accuracy</div>
        <div class="metric-stats">
          <strong>Wetlab Actions:</strong> 0.35 &rarr; 0.65 (+30% gain)<br>
          <strong>TACoS Cooking:</strong> 0.40 &rarr; 0.63 (+23% gain)<br>
          <strong>PASCAL-VOC:</strong> 0.71 &rarr; 0.89 (+18% gain)
        </div>
      </div>

      <div class="demo-metric-card highlight-blue">
        <div class="metric-name">
          <span>DDN-ILP Formulation</span>
          <span class="badge badge-info" style="font-size: 0.72rem;">Our Work</span>
        </div>
        <div class="metric-speedup speedup-itself">MILP MPE Solver</div>
        <div class="metric-stats">
          <strong>Inference:</strong> MPE via Mixed Integer Linear Programming<br>
          <strong>Approximation:</strong> Piecewise linear relaxation (&epsilon; = 0.001)<br>
          <strong>Advantage:</strong> Eliminates independent output assumptions
        </div>
      </div>

      <div class="demo-metric-card highlight-gray">
        <div class="metric-name">
          <span>Jaccard Index &amp; Error</span>
          <span class="badge badge-secondary" style="font-size: 0.72rem;">Hamming Loss</span>
        </div>
        <div class="metric-speedup speedup-baseline">Up to 0.95 JI</div>
        <div class="metric-stats">
          <strong>PASCAL-VOC:</strong> 0.95 JI (0.006 Hamming loss)<br>
          <strong>TACoS Actions:</strong> 0.72 JI (0.040 Hamming loss)<br>
          <strong>MS-COCO:</strong> 0.83 JI (0.88 F1 score)
        </div>
      </div>
    </div>

    <!-- Interactive Dataset Selector & Live Comparison Graph -->
    <div class="demo-workload-box">
      <div class="workload-header">
        <h5>Select Evaluated Benchmark Dataset (Tables 1 &amp; 2, AISTATS 2024):</h5>
        <div class="workload-controls">
          <button type="button" class="workload-btn ddn-btn active" data-dataset="tacos">TACoS (Cooking Actions)</button>
          <button type="button" class="workload-btn ddn-btn" data-dataset="wetlab">Wetlab (Bio Protocols)</button>
          <button type="button" class="workload-btn ddn-btn" data-dataset="pascal">PASCAL-VOC (Images)</button>
          <button type="button" class="workload-btn ddn-btn" data-dataset="coco">MS-COCO (80 Classes)</button>
          <button type="button" class="workload-btn ddn-btn" data-dataset="charades">Charades (157 Actions)</button>
        </div>
      </div>

      <div class="demo-progress-group" id="ddn-progress-group">
        <div class="demo-progress-row" id="ddn-row-1">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="ddn-row1-label">DDN - ILP (Ours, MILP MPE Solver)</span>
            <span class="demo-progress-val speedup-ssmp" id="ddn-row1-val">63.0% Subset Accuracy (0.72 JI, 0.040 HL)</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-green" id="ddn-row1-bar" style="width: 63%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="ddn-row-2">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="ddn-row2-label">DDN - Greedy (Ours, Local Search)</span>
            <span class="demo-progress-val speedup-itself" id="ddn-row2-val">56.0% Subset Accuracy (0.69 JI, 0.040 HL)</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-blue" id="ddn-row2-bar" style="width: 56%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="ddn-row-3">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="ddn-row3-label">DRF - ILP (Discriminative Random Field)</span>
            <span class="demo-progress-val speedup-baseline" id="ddn-row3-val">51.0% Subset Accuracy (0.65 JI, 0.030 HL)</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-gray" id="ddn-row3-bar" style="width: 51%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="ddn-row-4">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="ddn-row4-label">InceptionV3 Feature Extractor Baseline</span>
            <span class="demo-progress-val" style="color: var(--global-text-color-light, #6b7280);" id="ddn-row4-val">40.0% Subset Accuracy (0.61 JI, 0.082 HL)</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill" style="background: #9ca3af;" id="ddn-row4-bar" style="width: 40%;"></div>
          </div>
        </div>
      </div>

      <p class="demo-video-caption" id="ddn-takeaway" style="margin-top: 0.85rem; margin-bottom: 0;">
        <strong>Paper Finding (TACoS Cooking Actions, Table 1):</strong> DDN-ILP achieves a <strong>+23% increase in Subset Accuracy</strong> (from 0.40 to 0.63) over the InceptionV3 baseline and reduces Hamming error by more than half (0.082 &rarr; 0.040). Combinatorial MILP inference enforces consistent concurrent action sets (e.g. chopping, holding utensil) that independent classifiers miss.
      </p>
    </div>

  </div>
</details>

<script>
(function() {
  function initDdnSimulation() {
    var buttons = document.querySelectorAll(".ddn-btn");
    var row1 = document.getElementById("ddn-row-1");
    var row2 = document.getElementById("ddn-row-2");
    var row3 = document.getElementById("ddn-row-3");
    var row4 = document.getElementById("ddn-row-4");
    var row1Label = document.getElementById("ddn-row1-label");
    var row1Val = document.getElementById("ddn-row1-val");
    var row1Bar = document.getElementById("ddn-row1-bar");
    var row2Label = document.getElementById("ddn-row2-label");
    var row2Val = document.getElementById("ddn-row2-val");
    var row2Bar = document.getElementById("ddn-row2-bar");
    var row3Label = document.getElementById("ddn-row3-label");
    var row3Val = document.getElementById("ddn-row3-val");
    var row3Bar = document.getElementById("ddn-row3-bar");
    var row4Label = document.getElementById("ddn-row4-label");
    var row4Val = document.getElementById("ddn-row4-val");
    var row4Bar = document.getElementById("ddn-row4-bar");
    var metricGain = document.getElementById("metric-ddn-gain");
    var takeaway = document.getElementById("ddn-takeaway");

    if (!buttons.length || !row1 || !row2 || !row3 || !row4) return;

    var datasetData = {
      "tacos": {
        gain: "+23% Subset Accuracy",
        takeaway: "<strong>Paper Finding (TACoS Cooking Actions, Table 1):</strong> DDN-ILP achieves a <strong>+23% increase in Subset Accuracy</strong> (from 0.40 to 0.63) over the InceptionV3 baseline and reduces Hamming error by more than half (0.082 &rarr; 0.040). Combinatorial MILP inference enforces consistent concurrent action sets (e.g. chopping, holding utensil) that independent classifiers miss.",
        rows: [
          { show: true, label: "DDN - ILP (Ours, MILP MPE Solver)", val: "63.0% Subset Accuracy (0.72 JI, 0.040 HL)", pct: 63.0, cls: "fill-green", style: "" },
          { show: true, label: "DDN - Greedy (Ours, Local Search)", val: "56.0% Subset Accuracy (0.69 JI, 0.040 HL)", pct: 56.0, cls: "fill-blue", style: "" },
          { show: true, label: "DRF - ILP (Discriminative Random Field)", val: "51.0% Subset Accuracy (0.65 JI, 0.030 HL)", pct: 51.0, cls: "fill-gray", style: "" },
          { show: true, label: "InceptionV3 Feature Extractor Baseline", val: "40.0% Subset Accuracy (0.61 JI, 0.082 HL)", pct: 40.0, cls: "", style: "background: #9ca3af;" }
        ]
      },
      "wetlab": {
        gain: "+30% Subset Accuracy",
        takeaway: "<strong>Paper Finding (Wetlab Protocol Actions, Table 1):</strong> DDN-ILP delivers a <strong>+30% gain in Subset Accuracy</strong> (from 0.35 to 0.65) and improves Jaccard Index from 0.64 to 0.76. In multi-step biology experiments with rigid procedural dependencies, exact MPE inference prevents contradictory or physically impossible concurrent label assignments.",
        rows: [
          { show: true, label: "DDN - ILP (Ours, MILP MPE Solver)", val: "65.0% Subset Accuracy (0.76 JI, 0.014 HL)", pct: 65.0, cls: "fill-green", style: "" },
          { show: true, label: "DRF - ILP (Discriminative Random Field)", val: "60.0% Subset Accuracy (0.73 JI, 0.014 HL)", pct: 60.0, cls: "fill-gray", style: "" },
          { show: true, label: "DDN - Greedy (Ours, Local Search)", val: "55.0% Subset Accuracy (0.68 JI, 0.014 HL)", pct: 55.0, cls: "fill-blue", style: "" },
          { show: true, label: "InceptionV3 Feature Extractor Baseline", val: "35.0% Subset Accuracy (0.64 JI, 0.017 HL)", pct: 35.0, cls: "", style: "background: #9ca3af;" }
        ]
      },
      "pascal": {
        gain: "+18% Subset Accuracy",
        takeaway: "<strong>Paper Finding (PASCAL-VOC Image Classification, Table 2):</strong> DDN-ILP achieves an <strong>+18% improvement in Subset Accuracy</strong> (from 0.71 to 0.89), reaches <strong>0.95 Jaccard Index</strong>, and slashes Hamming loss from 0.015 down to 0.006 (a 60% error reduction) compared to the MSRN baseline.",
        rows: [
          { show: true, label: "DDN - ILP (Ours, MILP MPE Solver)", val: "89.0% Subset Accuracy (0.95 JI, 0.006 HL)", pct: 89.0, cls: "fill-green", style: "" },
          { show: true, label: "DDN - Greedy (Ours, Local Search)", val: "86.0% Subset Accuracy (0.91 JI, 0.007 HL)", pct: 86.0, cls: "fill-blue", style: "" },
          { show: true, label: "DRF - ILP (Discriminative Random Field)", val: "76.0% Subset Accuracy (0.88 JI, 0.019 HL)", pct: 76.0, cls: "fill-gray", style: "" },
          { show: true, label: "MSRN Feature Extractor Baseline", val: "71.0% Subset Accuracy (0.85 JI, 0.015 HL)", pct: 71.0, cls: "", style: "background: #9ca3af;" }
        ]
      },
      "coco": {
        gain: "0.55 SA / 0.83 JI",
        takeaway: "<strong>Paper Finding (MS-COCO 80 Categories, Table 2):</strong> Over 80 complex object categories, DDN-ILP outperforms Query2Label (Q2L) transformer in Subset Accuracy (0.51 &rarr; 0.55) and Jaccard Index (0.80 &rarr; 0.83). As illustrated in Figure 3, DDN-ILP recovers missed contextual objects (e.g. dining table, sports ball) and suppresses false positive detections.",
        rows: [
          { show: true, label: "DDN - ILP (Ours, MILP MPE Solver)", val: "55.0% Subset Accuracy (0.83 JI, 0.88 F1)", pct: 55.0, cls: "fill-green", style: "" },
          { show: true, label: "DDN - Greedy (Ours, Local Search)", val: "55.0% Subset Accuracy (0.82 JI, 0.87 F1)", pct: 55.0, cls: "fill-blue", style: "" },
          { show: true, label: "DRF - ILP (Discriminative Random Field)", val: "54.0% Subset Accuracy (0.82 JI, 0.82 F1)", pct: 54.0, cls: "fill-gray", style: "" },
          { show: true, label: "Q2L Transformer Baseline (Liu et al., 2021)", val: "51.0% Subset Accuracy (0.80 JI, 0.88 F1)", pct: 51.0, cls: "", style: "background: #9ca3af;" }
        ]
      },
      "charades": {
        gain: "0.33 JI / 0.36 Macro F1",
        takeaway: "<strong>Paper Finding (Charades 157 Action Classes, Table 1):</strong> Across 157 fine-grained video action classes, DDN-ILP improves Jaccard Index from 0.29 to 0.33 and Macro F1 from 0.32 to 0.36 over the SlowFast 3D-CNN backbone, demonstrating effective structured inference even under extreme label diversity.",
        rows: [
          { show: true, label: "DDN - ILP (Ours, MILP MPE Solver)", val: "33.0% Jaccard Index (0.36 Macro F1, 0.47 Micro F1)", pct: 33.0, cls: "fill-green", style: "" },
          { show: true, label: "DDN - Greedy (Ours, Local Search)", val: "31.0% Jaccard Index (0.33 Macro F1, 0.44 Micro F1)", pct: 31.0, cls: "fill-blue", style: "" },
          { show: true, label: "DRF - ILP (Discriminative Random Field)", val: "31.0% Jaccard Index (0.18 Macro F1, 0.21 Micro F1)", pct: 31.0, cls: "fill-gray", style: "" },
          { show: true, label: "SlowFast 3D-CNN Baseline (Feichtenhofer et al.)", val: "29.0% Jaccard Index (0.32 Macro F1, 0.45 Micro F1)", pct: 29.0, cls: "", style: "background: #9ca3af;" }
        ]
      }
    };

    var rowElements = [
      { row: row1, label: row1Label, val: row1Val, bar: row1Bar },
      { row: row2, label: row2Label, val: row2Val, bar: row2Bar },
      { row: row3, label: row3Label, val: row3Val, bar: row3Bar },
      { row: row4, label: row4Label, val: row4Val, bar: row4Bar }
    ];

    buttons.forEach(function(btn) {
      btn.addEventListener("click", function() {
        buttons.forEach(function(b) { b.classList.remove("active"); });
        btn.classList.add("active");
        var ds = btn.getAttribute("data-dataset");
        var d = datasetData[ds];
        if (!d) return;

        if (metricGain) metricGain.innerHTML = d.gain;
        takeaway.innerHTML = d.takeaway;

        d.rows.forEach(function(rData, idx) {
          var el = rowElements[idx];
          if (!rData.show) {
            el.row.style.display = "none";
          } else {
            el.row.style.display = "";
            el.label.innerHTML = rData.label;
            el.val.innerHTML = rData.val;
            el.bar.style.width = rData.pct + "%";
            el.bar.className = "demo-progress-fill" + (rData.cls ? " " + rData.cls : "");
            if (rData.style) {
              el.bar.setAttribute("style", "width: " + rData.pct + "%; " + rData.style);
            } else {
              el.bar.setAttribute("style", "width: " + rData.pct + "%;");
            }
          }
        });
      });
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initDdnSimulation);
  } else {
    initDdnSimulation();
  }
})();
</script>

---

## Neural Combinatorial Optimization

Combinatorial optimization problems over discrete structures—such as graphs and complex relational networks—underpin critical decision-making in routing, resource allocation, network security, and influence propagation. Classical combinatorial algorithms face severe computational bottlenecks on large-scale instances, whereas greedy or handcrafted heuristics often fail to adapt to complex, domain-specific constraints.

My research in neural combinatorial optimization explores how deep reinforcement learning (DRL) and graph representation learning can learn effective, instance-adaptive decision policies. By formulating discrete sequential decisions (such as node or edge selection) as Markov Decision Processes, we train neural policies that exploit recurring topological symmetries and structural invariants across problem distributions. This amortizes the computational cost of optimization, enabling efficient decision-making while explicitly accounting for operational, budget, privacy, and other domain-specific constraints.

<!-- Interactive Demo: RELINK Edge Activation Budget Explorer -->
<details class="interactive-demo-wrapper" markdown="0">
  <summary class="interactive-demo-summary">
    <span class="interactive-demo-summary-title">
      <span>Interactive Demo: RELINK Edge Activation Budget &amp; Benchmark Explorer</span>
      <span class="interactive-demo-summary-badge">CIKM 2025 Oral</span>
    </span>
    <span class="interactive-demo-summary-chevron">&#9656;</span>
  </summary>

  <div class="interactive-demo-card">
    <div class="demo-card-header">
      <div class="demo-title-group">
        <h4>RELINK Edge Activation for Closed-Network Influence Maximization</h4>
        <p>Empirical edge activation budget regimes and comparative benchmark findings from our CIKM 2025 paper</p>
      </div>
      <div class="demo-badges">
        <span class="demo-badge demo-badge-oral">CIKM 2025 Oral</span>
        <span class="demo-badge demo-badge-sim">Combinatorial Optmization over Graphs</span>
      </div>
    </div>

    <!-- Metric Cards Grid -->
    <div class="demo-metrics-grid">
      <div class="demo-metric-card highlight-green">
        <div class="metric-name">
          <span>RELINK (DRL Policy)</span>
          <span class="badge badge-success" style="font-size: 0.72rem;">Our Work</span>
        </div>
        <div class="metric-speedup speedup-ssmp" id="metric-relink-gain">Up to +15% Spread</div>
        <div class="metric-stats">
          <strong>Formulation:</strong> Edge-centric <em>n</em>-step Double DQN with SVD embeddings<br>
          <strong>Training:</strong> True marginal influence gain rewards (IC model)<br>
          <strong>Win Rate:</strong> 456 / 480 wins (95.0%) across 20 real networks
        </div>
      </div>

      <div class="demo-metric-card highlight-blue">
        <div class="metric-name">
          <span>PSNA (Huang et al.)</span>
          <span class="badge badge-info" style="font-size: 0.72rem;">IM-CSN Baseline</span>
        </div>
        <div class="metric-speedup speedup-itself">95.0% RELINK Win</div>
        <div class="metric-stats">
          <strong>Formulation:</strong> Practical Subnetwork Augmentation heuristic<br>
          <strong>Complexity:</strong> &Omicron;(<em>I</em>(|<em>V</em>| + |<em>E</em>|) log |<em>V</em>| + |<em>V</em>|<em>d</em><sub><em>m</em></sub> log <em>d</em><sub><em>m</em></sub>)<br>
          <strong>Limitation:</strong> High overhead on large graphs; caught by budget saturation
        </div>
      </div>

      <div class="demo-metric-card highlight-gray">
        <div class="metric-name">
          <span>Traditional Baselines</span>
          <span class="badge badge-secondary" style="font-size: 0.72rem;">Degree &amp; Random</span>
        </div>
        <div class="metric-speedup speedup-baseline">&gt;96% RELINK Win</div>
        <div class="metric-stats">
          <strong>Formulation:</strong> Static degree centrality &amp; uniform random selection<br>
          <strong>Win Rate:</strong> 464 / 480 vs. Degree, 462 / 480 vs. Random &amp; FoF<br>
          <strong>Limitation:</strong> Trapped in local dense hubs; misses boundary bridges
        </div>
      </div>
        <!-- Interactive Baseline Selector & Live Win-Rate Comparison Graph -->
    <div class="demo-workload-box">
      <div class="workload-header">
        <h5>Select Evaluated Baseline Comparison (Figure 3 Contingency Matrix, 480 Experiments):</h5>
        <div class="workload-controls">
          <button type="button" class="workload-btn relink-btn active" data-view="all">All Baselines Overview</button>
          <button type="button" class="workload-btn relink-btn" data-view="psna">vs. PSNA (IM-CSN)</button>
          <button type="button" class="workload-btn relink-btn" data-view="degree">vs. Degree Centrality</button>
          <button type="button" class="workload-btn relink-btn" data-view="random_fof">vs. Random &amp; FoF</button>
        </div>
      </div>

      <div class="demo-progress-group" id="relink-progress-group">
        <div class="demo-progress-row" id="relink-row-1">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="relink-row1-label">RELINK vs. Degree Centrality</span>
            <span class="demo-progress-val speedup-ssmp" id="relink-row1-val">96.7% (464 / 480 wins)</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-green" id="relink-row1-bar" style="width: 96.7%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="relink-row-2">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="relink-row2-label">RELINK vs. Random Selection</span>
            <span class="demo-progress-val speedup-itself" id="relink-row2-val">96.2% (462 / 480 wins)</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-blue" id="relink-row2-bar" style="width: 96.2%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="relink-row-3">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="relink-row3-label">RELINK vs. Friend-of-Friend (FoF)</span>
            <span class="demo-progress-val speedup-baseline" id="relink-row3-val">96.2% (462 / 480 wins)</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-gray" id="relink-row3-bar" style="width: 96.2%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="relink-row-4">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="relink-row4-label">RELINK vs. PSNA (Huang et al., IM-CSN Baseline)</span>
            <span class="demo-progress-val" style="color: var(--global-text-color-light, #6b7280);" id="relink-row4-val">95.0% (456 / 480 wins)</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill" style="background: #10b981;" id="relink-row4-bar" style="width: 95.0%;"></div>
          </div>
        </div>
      </div>

      <p class="demo-video-caption" id="relink-takeaway" style="margin-top: 0.85rem; margin-bottom: 0;">
        <strong>Paper Finding (Figure 3 Contingency Matrix &amp; Section 6.2):</strong> Across 480 total experimental configurations spanning 20 real-world social networks (evaluated with 100,000 Monte Carlo runs under the IC model), RELINK outperforms all competing methods in at least 95% of experiments. In low edge budget regimes (<em>k</em> &le; 10), Section 6.3 reports that RELINK frequently achieves influence spread improvements exceeding 15% over PSNA.
      </p>
    </div>

  </div>
</details>

<script>
(function() {
  function initRelinkSimulation() {
    var buttons = document.querySelectorAll(".relink-btn");
    var row1 = document.getElementById("relink-row-1");
    var row2 = document.getElementById("relink-row-2");
    var row3 = document.getElementById("relink-row-3");
    var row4 = document.getElementById("relink-row-4");
    var row1Label = document.getElementById("relink-row1-label");
    var row1Val = document.getElementById("relink-row1-val");
    var row1Bar = document.getElementById("relink-row1-bar");
    var row2Label = document.getElementById("relink-row2-label");
    var row2Val = document.getElementById("relink-row2-val");
    var row2Bar = document.getElementById("relink-row2-bar");
    var row3Label = document.getElementById("relink-row3-label");
    var row3Val = document.getElementById("relink-row3-val");
    var row3Bar = document.getElementById("relink-row3-bar");
    var row4Label = document.getElementById("relink-row4-label");
    var row4Val = document.getElementById("relink-row4-val");
    var row4Bar = document.getElementById("relink-row4-bar");
    var metricGain = document.getElementById("metric-relink-gain");
    var takeaway = document.getElementById("relink-takeaway");

    if (!buttons.length || !row1 || !row2 || !row3 || !row4) return;

    var viewData = {
      "all": {
        gain: "95.0% – 96.7% Win Rate",
        takeaway: "<strong>Paper Finding (Figure 3 Contingency Matrix &amp; Section 6.2):</strong> Across 480 total experimental configurations spanning 20 real-world social networks (evaluated with 100,000 Monte Carlo runs under the IC model), RELINK outperforms all competing methods in at least 95% of experiments. In low edge budget regimes (<em>k</em> &le; 10), Section 6.3 reports that RELINK frequently achieves influence spread improvements exceeding 15% over PSNA.",
        rows: [
          { show: true, label: "RELINK vs. Degree Centrality", val: "96.7% (464 / 480 wins)", pct: 96.7, cls: "fill-green", style: "" },
          { show: true, label: "RELINK vs. Random Selection", val: "96.2% (462 / 480 wins)", pct: 96.2, cls: "fill-blue", style: "" },
          { show: true, label: "RELINK vs. Friend-of-Friend (FoF)", val: "96.2% (462 / 480 wins)", pct: 96.2, cls: "fill-gray", style: "" },
          { show: true, label: "RELINK vs. PSNA (Huang et al., IM-CSN Baseline)", val: "95.0% (456 / 480 wins)", pct: 95.0, cls: "", style: "background: #10b981;" }
        ]
      },
      "psna": {
        gain: "456 / 480 Wins (95.0%)",
        takeaway: "<strong>Paper Finding (Section 6.2 Q2 &amp; Section 6.3):</strong> RELINK outperforms PSNA in <strong>456 out of 480</strong> experiments (95.0%), while PSNA performs better in only 24 cases. Under low edge budgets (<em>k</em> &le; 10), RELINK significantly outperforms PSNA (Figure 6 heatmap, frequently exceeding 15% spread improvements) by prioritizing high-impact boundary bridges early; PSNA partially closes the gap under higher budgets as redundant edges are activated.",
        rows: [
          { show: true, label: "RELINK (Deep Reinforcement Learning Policy)", val: "95.0% Win Rate (456 / 480 wins)", pct: 95.0, cls: "fill-green", style: "" },
          { show: true, label: "PSNA (Huang et al., IM-CSN Baseline)", val: "5.0% Win Rate (24 / 480 wins)", pct: 5.0, cls: "fill-blue", style: "" },
          { show: false },
          { show: false }
        ]
      },
      "degree": {
        gain: "464 / 480 Wins (96.7%)",
        takeaway: "<strong>Paper Finding (Section 6.2 Q1):</strong> RELINK outperforms Degree Centrality in <strong>464 out of 480</strong> experiments (96.7%). Degree centrality performs worst on the IM-CSN task because it greedily activates edges connecting already dense internal hubs, failing to bridge privacy-shielded cluster boundaries.",
        rows: [
          { show: true, label: "RELINK (Deep Reinforcement Learning Policy)", val: "96.7% Win Rate (464 / 480 wins)", pct: 96.7, cls: "fill-green", style: "" },
          { show: true, label: "Degree Centrality Heuristic", val: "3.3% Win Rate (16 / 480 wins)", pct: 3.3, cls: "fill-gray", style: "" },
          { show: false },
          { show: false }
        ]
      },
      "random_fof": {
        gain: "462 / 480 Wins (96.2%)",
        takeaway: "<strong>Paper Finding (Section 6.2 Q1):</strong> RELINK outperforms both Random and Friend-of-Friend (FoF) in <strong>462 out of 480</strong> experiments each (96.2%). Notably, Random outperforms FoF and Degree on IM-CSN because uniform random selection occasionally discovers exploratory bridge links across disconnected components that local heuristics miss.",
        rows: [
          { show: true, label: "RELINK (Deep Reinforcement Learning Policy)", val: "96.2% Win Rate (462 / 480 wins)", pct: 96.2, cls: "fill-green", style: "" },
          { show: true, label: "Random Edge Selection", val: "4.2% Win Rate (20 / 480 wins)", pct: 4.2, cls: "fill-gray", style: "" },
          { show: true, label: "Friend-of-Friend (FoF)", val: "3.8% Win Rate (18 / 480 wins)", pct: 3.8, cls: "fill-gray", style: "" },
          { show: false }
        ]
      }
    };

    var rowElements = [
      { row: row1, label: row1Label, val: row1Val, bar: row1Bar },
      { row: row2, label: row2Label, val: row2Val, bar: row2Bar },
      { row: row3, label: row3Label, val: row3Val, bar: row3Bar },
      { row: row4, label: row4Label, val: row4Val, bar: row4Bar }
    ];

    buttons.forEach(function(btn) {
      btn.addEventListener("click", function() {
        buttons.forEach(function(b) { b.classList.remove("active"); });
        btn.classList.add("active");
        var view = btn.getAttribute("data-view");
        var d = viewData[view];
        if (!d) return;

        if (metricGain) metricGain.innerHTML = d.gain;
        takeaway.innerHTML = d.takeaway;

        d.rows.forEach(function(rData, idx) {
          var el = rowElements[idx];
          if (!rData.show) {
            el.row.style.display = "none";
          } else {
            el.row.style.display = "";
            el.label.innerHTML = rData.label;
            el.val.innerHTML = rData.val;
            el.bar.style.width = rData.pct + "%";
            el.bar.className = "demo-progress-fill" + (rData.cls ? " " + rData.cls : "");
            if (rData.style) {
              el.bar.setAttribute("style", "width: " + rData.pct + "%; " + rData.style);
            } else {
              el.bar.setAttribute("style", "width: " + rData.pct + "%;");
            }
          }
        });
      });
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initRelinkSimulation);
  } else {
    initRelinkSimulation();
  }
})();
</script>

**Representative Contribution:**

- **RELINK** (CIKM 2025 Oral): A deep reinforcement learning framework for edge-level influence maximization in closed social networks (IM-CSN) under budget constraints. Employs an edge-centric Double DQN with SVD node embeddings and edge-aware aggregation trained on true marginal influence gains. Evaluated across 20 real-world networks with 100K Monte Carlo simulations, achieving up to 15% higher influence spread, a 95.0% win rate (456/480) over PSNA, and favorable GPU-accelerated sequential inference.

---

## Structured and Multimodal Intelligence

Perceptual intelligence in complex environments requires more than mapping sensory inputs to isolated semantic labels; it demands reasoning over temporal dependencies, procedural workflows, and structured human interactions. My work in structured and multimodal intelligence integrates high-dimensional visual and linguistic representations with explicit task models to bridge low-level perception and higher-level reasoning.

This agenda spans two interconnected threads:

- **Procedural Video Understanding and Activity Reasoning:** Real-world human activities unfold through multi-step workflows with sequential dependencies and potential execution errors. Moving beyond frame-level action recognition, my research develops structured models that capture procedural hierarchies, track user progress, detect execution errors, and provide proactive predictive guidance in physical environments and augmented reality (AR).
- **Human-Guided Vision-Language Systems:** To ensure multimodal systems remain trustworthy and aligned with user intent, I investigate interactive human-in-the-loop learning. Rather than treating models as static black boxes, this work explores how different granularities of human feedback—from natural language explanations and corrective annotations to lightweight scalar critiques—can calibrate multimodal reasoning, resolve perceptual ambiguities, and adapt models to dynamic deployment contexts.

<!-- Interactive Demo: CaptainCook4D Procedural Error Taxonomy Explorer -->
<details class="interactive-demo-wrapper" markdown="0">
  <summary class="interactive-demo-summary">
    <span class="interactive-demo-summary-title">
      <span>Interactive Demo: CaptainCook4D Procedural Error Taxonomy Explorer</span>
      <span class="interactive-demo-summary-badge">NeurIPS 2024 D&amp;B</span>
    </span>
    <span class="interactive-demo-summary-chevron">&#9656;</span>
  </summary>

  <div class="interactive-demo-card">
    <div class="demo-card-header">
      <div class="demo-title-group">
        <h4>CaptainCook4D Procedural Activity &amp; Error Taxonomy Explorer</h4>
        <p>Explore genuine error categories, recipe tasks, and multimodal sensory capture from the CaptainCook4D benchmark</p>
      </div>
      <div class="demo-badges">
        <span class="demo-badge demo-badge-oral">NeurIPS 2024 D&amp;B</span>
        <span class="demo-badge demo-badge-sim">Egocentric 4D Benchmark</span>
      </div>
    </div>

    <!-- Metric Cards Grid -->
    <div class="demo-metrics-grid">
      <div class="demo-metric-card highlight-green">
        <div class="metric-name">
          <span>Dataset Scale</span>
          <span class="badge badge-success" style="font-size: 0.72rem;">Benchmark</span>
        </div>
        <div class="metric-speedup speedup-ssmp">94.5 Hours</div>
        <div class="metric-stats">
          <strong>Recordings:</strong> 384 sessions across 10 real kitchens<br>
          <strong>Tasks:</strong> 24 complex WikiHow recipes (&le;30 min)<br>
          <strong>Annotations:</strong> 5.3K steps, 10K fine-grained actions
        </div>
      </div>

      <div class="demo-metric-card highlight-blue">
        <div class="metric-name">
          <span>Error Taxonomy</span>
          <span class="badge badge-info" style="font-size: 0.72rem;">7 Categories</span>
        </div>
        <div class="metric-speedup speedup-itself">Real Deviations</div>
        <div class="metric-stats">
          <strong>Categories:</strong> Technique, Measurement, Order, Prep, Timing, Temp, Missing<br>
          <strong>Protocols:</strong> Adherent normal steps vs. induced error deviations<br>
          <strong>Ground truth:</strong> Frame-accurate temporal boundaries
        </div>
      </div>

      <div class="demo-metric-card highlight-gray">
        <div class="metric-name">
          <span>Sensory Modalities</span>
          <span class="badge badge-secondary" style="font-size: 0.72rem;">Hardware</span>
        </div>
        <div class="metric-speedup speedup-baseline">Egocentric 4D</div>
        <div class="metric-stats">
          <strong>Dual-view:</strong> GoPro Hero 11 (4K @ 30 fps), HoloLens 2 RGB<br>
          <strong>Depth &amp; Poses:</strong> HoloLens 2 AHAT depth, 3D hand/head poses<br>
          <strong>IMU &amp; Spatial:</strong> 3-stream IMU, audio, 3D spatial mesh
        </div>
      </div>
    </div>

    <!-- Interactive Step & Error Inspector with Authentic Video Showcase -->
    <div class="demo-workload-box">
      <div class="workload-header">
        <h5>Select Demonstration from Project Benchmark:</h5>
        <div class="workload-controls">
          <button type="button" class="workload-btn cc-tax-btn active" data-cat="technique_spill">Technique (Spillage)</button>
          <button type="button" class="workload-btn cc-tax-btn" data-cat="measurement">Measurement (Quantity)</button>
          <button type="button" class="workload-btn cc-tax-btn" data-cat="order">Order (Sequence)</button>
          <button type="button" class="workload-btn cc-tax-btn" data-cat="prep">Preparation (Utensil)</button>
          <button type="button" class="workload-btn cc-tax-btn" data-cat="technique_cut">Technique (Cutting)</button>
          <button type="button" class="workload-btn cc-tax-btn" data-cat="spatial_4d">4D Point Cloud</button>
          <button type="button" class="workload-btn cc-tax-btn" data-cat="task_graph">Task Graph</button>
        </div>
      </div>

      <!-- Embedded Authentic Video Player -->
      <div class="demo-video-wrapper" style="margin-top: 0.75rem; margin-bottom: 0.5rem; text-align: center;">
        <video id="cc-video-player" class="demo-video-player" controls playsinline muted loop style="max-height: 320px; width: 100%; border-radius: 6px; background-color: #000;">
          <source id="cc-video-source" src="https://captaincook4d.github.io/captain-cook/static/videos/error_categories/technique_error_1.mp4" type="video/mp4">
          Your browser does not support the video tag.
        </video>
        <p class="demo-video-caption" id="cc-video-caption" style="margin-top: 0.4rem; font-size: 0.82rem; color: var(--global-text-color-light, #6b7280);">
          Butter corn cup: First 2 snippets exhibit correct execution without spillage; next 3 exhibit induced corn spillage while mixing.
        </p>
      </div>

      <div class="demo-inspector-card" id="cc-inspector-display" style="margin-top: 0.75rem;">
        <div class="demo-inspector-status">
          <div>
            <div class="demo-inspector-step-title" id="cc-tax-recipe">Recipe: Butter Corn Cup</div>
            <span style="font-size: 0.85rem; color: var(--global-text-color-light, #6b7280);" id="cc-tax-step">Instruction: "Mix the contents of the bowl well"</span>
          </div>
          <span class="badge badge-danger" id="cc-tax-badge" style="font-size: 0.78rem;">Technique Error</span>
        </div>

        <div style="font-size: 0.88rem; line-height: 1.5; margin: 0.5rem 0;">
          <p style="margin: 0.25rem 0;"><strong>Normal Execution:</strong> <span id="cc-tax-normal">Contents of the bowl are mixed thoroughly without spillage.</span></p>
          <p style="margin: 0.25rem 0;"><strong>Recorded Error:</strong> <span id="cc-tax-error" style="color: #ef4444;">Participant mixes too aggressively, spilling corn kernels out of the bowl while mixing.</span></p>
        </div>

        <div class="demo-inspector-streams">
          <div class="demo-stream-pill">
            <strong>Sensory Capture:</strong> <span id="cc-tax-streams">GoPro Hero 11 (4K @ 30 fps), HoloLens 2 AHAT Depth, 3D Hand/Head Poses, IMU &amp; Audio</span>
          </div>
          <div class="demo-stream-pill">
            <strong>Benchmark Tasks:</strong> <span id="cc-tax-task">Error Recognition (Supervised &amp; Zero-Shot), Multi-Step Localization (MSL), Procedure Learning</span>
          </div>
        </div>
      </div>

      <div style="display: flex; flex-wrap: wrap; gap: 0.75rem; justify-content: space-between; align-items: center; margin-top: 0.85rem; font-size: 0.82rem; border-top: 1px solid var(--global-divider-color, rgba(0, 0, 0, 0.08)); padding-top: 0.65rem;">
        <span style="color: var(--global-text-color-light, #6b7280);">
          <strong>Official Resources:</strong>
          <a href="https://captaincook4d.github.io/captain-cook/" target="_blank" rel="noopener">Project Website</a> &bull;
          <a href="https://proceedings.neurips.cc/paper_files/paper/2024/file/f4a04396c2ed1342a5d8d05e94cb6101-Paper-Datasets_and_Benchmarks_Track.pdf" target="_blank" rel="noopener">NeurIPS 2024 Paper</a> &bull;
          <a href="https://github.com/CaptainCook4D/downloader" target="_blank" rel="noopener">Downloader</a> &bull;
          <a href="https://github.com/CaptainCook4D/annotations" target="_blank" rel="noopener">Annotations</a>
        </span>
        <span style="color: var(--global-text-color-light, #6b7280);">
          IRB Approved (UF) &bull; Apache 2.0 License
        </span>
      </div>
    </div>

  </div>
</details>

<script>
(function() {
  function initCaptainCookTaxonomy() {
    var taxBtns = document.querySelectorAll(".cc-tax-btn");
    var recipeEl = document.getElementById("cc-tax-recipe");
    var stepEl = document.getElementById("cc-tax-step");
    var badgeEl = document.getElementById("cc-tax-badge");
    var normalEl = document.getElementById("cc-tax-normal");
    var errorEl = document.getElementById("cc-tax-error");
    var streamsEl = document.getElementById("cc-tax-streams");
    var taskEl = document.getElementById("cc-tax-task");
    var videoPlayer = document.getElementById("cc-video-player");
    var videoSource = document.getElementById("cc-video-source");
    var videoCaption = document.getElementById("cc-video-caption");

    if (!taxBtns.length || !recipeEl) return;

    var taxData = {
      technique_spill: {
        recipe: "Recipe: Butter Corn Cup",
        step: 'Instruction: "Mix the contents of the bowl well"',
        badge: "Technique Error",
        badgeClass: "badge-danger",
        normal: "Contents of the bowl are mixed thoroughly without any spillage.",
        error: "Participant induces error by spilling out corn from the bowl while mixing.",
        streams: "GoPro Hero 11 (4K @ 30 fps), HoloLens 2 AHAT Depth, 3D Hand/Head Poses, IMU & Audio",
        task: "Error Recognition (Supervised & Zero-Shot), Multi-Step Localization (MSL), Procedure Learning",
        videoUrl: "https://captaincook4d.github.io/captain-cook/static/videos/error_categories/technique_error_1.mp4",
        caption: "Butter corn cup: First 2 snippets exhibit correct execution without spillage; next 3 exhibit induced corn spillage while mixing."
      },
      measurement: {
        recipe: "Recipe: Scrambled Eggs",
        step: 'Instruction: "Peel 2 garlic cloves"',
        badge: "Measurement Error",
        badgeClass: "badge-warning",
        normal: "Participant counts and peels exactly 2 garlic cloves as specified in the recipe.",
        error: "Incorrect quantity peeled (4 garlic cloves, 1 clove, and 1 clove respectively peeled instead of 2).",
        streams: "GoPro Hero 11 (4K @ 30 fps), HoloLens 2 AHAT Depth, 3D Hand/Head Poses, IMU & Audio",
        task: "Error Recognition (Supervised & Zero-Shot), Multi-Step Localization (MSL), Procedure Learning",
        videoUrl: "https://captaincook4d.github.io/captain-cook/static/videos/error_categories/measurement_error.mp4",
        caption: "Scrambled eggs: First 2 snippets show correct 2-clove peeling; next 3 snippets show incorrect quantities (4, 1, and 1 cloves)."
      },
      order: {
        recipe: "Recipe: Spicy Tuna Avocado Wraps",
        step: 'Instruction: "Top lettuce leaves with tuna mixture"',
        badge: "Order Error",
        badgeClass: "badge-info",
        normal: "Steps executed in valid topological dependency order defined by the recipe task graph.",
        error: "Incorrect sequence followed: avocado is added after topping lettuce leaves with tuna mixture instead of before.",
        streams: "GoPro Hero 11 (4K @ 30 fps), HoloLens 2 AHAT Depth, 3D Hand/Head Poses, IMU & Audio",
        task: "Error Recognition (Supervised & Zero-Shot), Multi-Step Localization (MSL), Procedure Learning",
        videoUrl: "https://captaincook4d.github.io/captain-cook/static/videos/error_categories/order_error.mp4",
        caption: "Spicy tuna avocado wraps: First 2 snippets show correct step order; next 3 show avocado added out of sequence."
      },
      prep: {
        recipe: "Recipe: Mug Cake",
        step: 'Instruction: "Whisk batter"',
        badge: "Preparation Error",
        badgeClass: "badge-danger",
        normal: "Proper whisk utensil used to blend batter ingredients uniformly.",
        error: "Incorrect utensil or implement utilized: participant uses a spoon, tablespoon, or hand to perform whisking.",
        streams: "GoPro Hero 11 (4K @ 30 fps), HoloLens 2 AHAT Depth, 3D Hand/Head Poses, IMU & Audio",
        task: "Error Recognition (Supervised & Zero-Shot), Multi-Step Localization (MSL), Procedure Learning",
        videoUrl: "https://captaincook4d.github.io/captain-cook/static/videos/error_categories/preparation_error.mp4",
        caption: "Mug cake: First 2 snippets show proper whisk utensil usage; remaining snippets show incorrect utensils (spoon, tablespoon, hand)."
      },
      technique_cut: {
        recipe: "Recipe: Cucumber Raita",
        step: 'Instruction: "Chop or grate the cucumber"',
        badge: "Technique Error",
        badgeClass: "badge-danger",
        normal: "Cucumber is chopped or grated evenly according to culinary technique.",
        error: "Improper knife execution: cucumber cut incorrectly, sliced vertically, or sliced horizontally.",
        streams: "GoPro Hero 11 (4K @ 30 fps), HoloLens 2 AHAT Depth, 3D Hand/Head Poses, IMU & Audio",
        task: "Error Recognition (Supervised & Zero-Shot), Multi-Step Localization (MSL), Procedure Learning",
        videoUrl: "https://captaincook4d.github.io/captain-cook/static/videos/error_categories/technique_error_2.mp4",
        caption: "Cucumber raita: First 2 snippets show correct chopping/grating; next 3 show vertical and horizontal slicing errors."
      },
      spatial_4d: {
        recipe: "Kitchen Environment: Real-World 4D Reconstructions",
        step: 'Modality: HoloLens 2 AHAT Depth & Egocentric Spatial Meshing',
        badge: "4D Point Cloud & Mesh",
        badgeClass: "badge-success",
        normal: "Continuous 3D spatial surfaces and egocentric point clouds reconstructed across 10 real kitchen environments.",
        error: "Captures 3D spatial relations, object-hand interactions, and metric scene depth for 384 recording sessions.",
        streams: "HoloLens 2 AHAT (Short-Throw) Depth, 3D Hand/Head Poses, 3D Spatial Surface Mesh",
        task: "Error Recognition (Supervised & Zero-Shot), Multi-Step Localization (MSL), Procedure Learning",
        videoUrl: "https://captaincook4d.github.io/captain-cook/static/videos/4D/4D_SHIVVRAT_HOUSE.mp4",
        caption: "4D egocentric point cloud and spatial mesh reconstructed from HoloLens 2 depth and sensor poses in a real kitchen environment."
      },
      task_graph: {
        recipe: "Recipe: Blender Banana Pancakes",
        step: 'Structure: Hierarchical Directed Acyclic Task Graph (DAG)',
        badge: "Task Graph Representation",
        badgeClass: "badge-secondary",
        normal: "Formulates recipes as directed acyclic graphs encoding step prerequisites, parallel paths, and optional sub-activities.",
        error: "Enables grounding execution paths against procedural constraints to detect missing, skipped, or misordered actions.",
        streams: "WikiHow Recipe Dependency Graph, Step Annotations & Temporal Alignments",
        task: "Error Recognition (Supervised & Zero-Shot), Multi-Step Localization (MSL), Procedure Learning",
        videoUrl: "https://captaincook4d.github.io/captain-cook/static/videos/task_graph_blender_banana_pancakes.mp4",
        caption: "Task graph animation: Procedural workflow representation modeling step execution order and dependency constraints."
      }
    };

    taxBtns.forEach(function(btn) {
      btn.addEventListener("click", function() {
        taxBtns.forEach(function(b) { b.classList.remove("active"); });
        btn.classList.add("active");
        var cat = btn.getAttribute("data-cat");
        var d = taxData[cat];
        if (!d) return;

        recipeEl.textContent = d.recipe;
        stepEl.textContent = d.step;
        badgeEl.textContent = d.badge;
        badgeEl.className = "badge " + d.badgeClass;
        normalEl.textContent = d.normal;
        errorEl.textContent = d.error;
        streamsEl.textContent = d.streams;
        taskEl.textContent = d.task;

        if (videoPlayer && videoSource && d.videoUrl) {
          videoSource.src = d.videoUrl;
          videoPlayer.load();
        }
        if (videoCaption && d.caption) {
          videoCaption.textContent = d.caption;
        }
      });
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initCaptainCookTaxonomy);
  } else {
    initCaptainCookTaxonomy();
  }
})();
</script>

**Representative Contributions & Datasets:**

- **CaptainCook4D** (NeurIPS 2024 Datasets and Benchmarks Track): A 94.5-hour egocentric 4D multimodal dataset comprising 384 recordings of complex recipe executions, capturing both successful and errorful trials with fine-grained temporal and procedural step annotations ([Project](https://captaincook4d.github.io/captain-cook/)).
- **Explainable Video Reasoning** (ACM TiiS 2023): Hybrid architectures combining deep video representations with dynamic cutset networks to enable tractable probabilistic queries and interpretable activity explanations.
- **Predictive Task Guidance in AR** (IEEE VR 2024): Real-time augmented-reality systems that anticipate user actions and deliver proactive task assistance during complex physical procedures.
- **Human-in-the-Loop Multimodal Feedback** (ACM TiiS 2026): A comprehensive empirical study comparing textual commentary, word corrections, and scalar feedback mechanisms for steering vision-language model predictions.

### Human-Guided Vision-Language and Multimodal AI

<figure class="figure">
  <img src="/assets/img/publication_preview/TiiS_FACOLE.png" class="figure-img img-fluid" alt="Vision-language model feedback interface">
</figure>

We study multimodal systems that integrate visual and linguistic representations with structured human feedback. This work investigates how different forms of human guidance, from detailed natural-language feedback to lightweight corrective signals, can improve model reliability, task adaptation, and downstream multimodal understanding. More broadly, we are interested in interactive learning frameworks in which human feedback becomes an explicit component of model reasoning and adaptation.

- **Comparison of Text-Based Inputs for Human-in-the-Loop Feedback in Vision-Language Models** ([ACM TiiS 2026](https://doi.org/10.1145/3816700))
  - Studies different forms of human-in-the-loop feedback for video understanding, comparing detailed natural-language commentary, word-level corrections, and lower-cost scalar judgments for improving model reliability.

<!-- Interactive Demo: VLM Accuracy Across Human Feedback Modalities -->
<details class="interactive-demo-wrapper" markdown="0">
  <summary class="interactive-demo-summary">
    <span class="interactive-demo-summary-title">
      <span>Interactive Benchmark: VLM Accuracy Across Human Feedback Modalities</span>
      <span class="interactive-demo-summary-badge">ACM TiiS 2026</span>
    </span>
    <span class="interactive-demo-summary-chevron">&#9656;</span>
  </summary>

  <div class="interactive-demo-card" id="demo-tiis-card">
    <!-- Header with title, brief description, and badges -->
    <div class="demo-card-header">
      <div class="demo-title-group">
        <h4>VLM Accuracy Across Human-in-the-Loop Feedback Modalities</h4>
        <p>Empirical findings from ACM TiiS 2026 evaluating video understanding accuracy across feedback granularities, post-processing strategies, and VLM architectures</p>
      </div>
      <div class="demo-badges">
        <span class="demo-badge demo-badge-oral">ACM TiiS 2026</span>
        <span class="demo-badge demo-badge-sim">Multimodal Benchmark</span>
      </div>
    </div>

    <!-- Metric Cards Grid -->
    <div class="demo-metrics-grid">
      <div class="demo-metric-card highlight-green">
        <div class="metric-name">
          <span>Peak VLM Accuracy</span>
          <span class="badge badge-success" style="font-size: 0.72rem;">Free Text</span>
        </div>
        <div class="metric-speedup speedup-ssmp" id="metric-tiis-gain">90.0% Accuracy</div>
        <div class="metric-stats">
          <strong>Baseline (No Feedback):</strong> 40.0% &rarr; 90.0% (+50% gain)<br>
          <strong>Architecture:</strong> LLaVA-NeXT-Video<br>
          <strong>Condition:</strong> Unconstrained natural-language commentary
        </div>
      </div>

      <div class="demo-metric-card highlight-blue">
        <div class="metric-name">
          <span>Targeted Error Correction</span>
          <span class="badge badge-info" style="font-size: 0.72rem;">LLM Refinement</span>
        </div>
        <div class="metric-speedup speedup-itself">82.0% – 85.0%</div>
        <div class="metric-stats">
          <strong>Video-LLaVA Peak:</strong> 82.0% (surpasses 75% Free Text)<br>
          <strong>LLaVA-NeXT-Video:</strong> 85.0% accuracy<br>
          <strong>Strategy:</strong> Human error localization + LLM rewriting
        </div>
      </div>

      <div class="demo-metric-card highlight-gray">
        <div class="metric-name">
          <span>Lightweight Feedback</span>
          <span class="badge badge-secondary" style="font-size: 0.72rem;">Low-Cost</span>
        </div>
        <div class="metric-speedup speedup-baseline">Up to 80.0%</div>
        <div class="metric-stats">
          <strong>Binary Feedback:</strong> 80.0% (LLaVA-NeXT-Video)<br>
          <strong>Error Selection:</strong> 80.0% (LLaVA-NeXT-Video)<br>
          <strong>Zero-Shot Baseline:</strong> 40.0% across both models
        </div>
      </div>
    </div>

    <!-- Interactive Selector & Live Comparison Graph -->
    <div class="demo-workload-box">
      <div class="workload-header">
        <h5>Select Evaluated Evaluation View (ACM TiiS 2026):</h5>
        <div class="workload-controls">
          <button type="button" class="workload-btn tiis-btn active" data-view="next_video">LLaVA-NeXT-Video</button>
          <button type="button" class="workload-btn tiis-btn" data-view="video_llava">Video-LLaVA</button>
          <button type="button" class="workload-btn tiis-btn" data-view="head_to_head">Head-to-Head Comparison</button>
          <button type="button" class="workload-btn tiis-btn" data-view="processing">Raw Human vs. LLM Post-Processing</button>
        </div>
      </div>

      <div class="demo-progress-group" id="tiis-progress-group">
        <div class="demo-progress-row" id="tiis-row-1">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="tiis-row1-label">Free Text</span>
            <span class="demo-progress-val speedup-ssmp" id="tiis-row1-val">90.0% Accuracy</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-green" id="tiis-row1-bar" style="width: 90%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="tiis-row-2">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="tiis-row2-label">Error Correction – LLM Post Processing</span>
            <span class="demo-progress-val speedup-itself" id="tiis-row2-val">85.0% Accuracy</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-blue" id="tiis-row2-bar" style="width: 85%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="tiis-row-3">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="tiis-row3-label">Error Correction – Raw Human Feedback</span>
            <span class="demo-progress-val speedup-itself" id="tiis-row3-val">84.0% Accuracy</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-blue" id="tiis-row3-bar" style="width: 84%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="tiis-row-4">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="tiis-row4-label">Binary – Raw Human Feedback</span>
            <span class="demo-progress-val speedup-baseline" id="tiis-row4-val">80.0% Accuracy</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-gray" id="tiis-row4-bar" style="width: 80%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="tiis-row-5">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="tiis-row5-label">Error Selection – Raw Human Feedback</span>
            <span class="demo-progress-val speedup-baseline" id="tiis-row5-val">80.0% Accuracy</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill fill-gray" id="tiis-row4-bar" style="width: 80%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="tiis-row-6">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="tiis-row6-label">Binary – LLM Post Processing</span>
            <span class="demo-progress-val" style="color: var(--global-text-color-light, #6b7280);" id="tiis-row6-val">78.0% Accuracy</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill" style="background: #9ca3af;" id="tiis-row6-bar" style="width: 78%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="tiis-row-7">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="tiis-row7-label">Error Selection – LLM Post Processing</span>
            <span class="demo-progress-val" style="color: var(--global-text-color-light, #6b7280);" id="tiis-row7-val">76.0% Accuracy</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill" style="background: #9ca3af;" id="tiis-row7-bar" style="width: 76%;"></div>
          </div>
        </div>

        <div class="demo-progress-row" id="tiis-row-8">
          <div class="demo-progress-meta">
            <span class="demo-progress-name" id="tiis-row8-label">No Feedback (Zero-Shot Baseline)</span>
            <span class="demo-progress-val" style="color: var(--global-text-color-light, #6b7280);" id="tiis-row8-val">40.0% Accuracy</span>
          </div>
          <div class="demo-progress-track">
            <div class="demo-progress-fill" style="background: #d1d5db;" id="tiis-row8-bar" style="width: 40%;"></div>
          </div>
        </div>
      </div>

      <p class="demo-video-caption" id="tiis-takeaway" style="margin-top: 0.85rem; margin-bottom: 0;">
        <strong>Paper Finding (LLaVA-NeXT-Video):</strong> Human feedback delivers massive gains over the unassisted baseline, surging from 40.0% up to <strong>90.0%</strong> with Free Text commentary. Even lightweight binary feedback doubles model accuracy to <strong>80.0%</strong>, demonstrating that modern video-language models effectively ground corrective human signals across all interaction granularities.
      </p>
    </div>

  </div>
</details>

<script>
(function() {
  function initTiisSimulation() {
    var buttons = document.querySelectorAll(".tiis-btn");
    var rowElements = [];
    for (var i = 1; i <= 8; i++) {
      rowElements.push({
        row: document.getElementById("tiis-row-" + i),
        label: document.getElementById("tiis-row" + i + "-label"),
        val: document.getElementById("tiis-row" + i + "-val"),
        bar: document.getElementById("tiis-row" + i + "-bar")
      });
    }
    var metricGain = document.getElementById("metric-tiis-gain");
    var takeaway = document.getElementById("tiis-takeaway");

    if (!buttons.length || !rowElements[0].row) return;

    var viewData = {
      "next_video": {
        gain: "90.0% Peak (LLaVA-NeXT)",
        takeaway: "<strong>Paper Finding (LLaVA-NeXT-Video):</strong> Human feedback delivers massive gains over the unassisted baseline, surging from 40.0% up to <strong>90.0%</strong> with Free Text commentary. Even lightweight binary feedback doubles model accuracy to <strong>80.0%</strong>, demonstrating that modern video-language models effectively ground corrective human signals across all interaction granularities.",
        rows: [
          { show: true, label: "Free Text (Natural Language Commentary)", val: "90.0% Accuracy", pct: 90.0, cls: "fill-green", style: "" },
          { show: true, label: "Error Correction – LLM Post Processing", val: "85.0% Accuracy", pct: 85.0, cls: "fill-blue", style: "" },
          { show: true, label: "Error Correction – Raw Human Feedback", val: "84.0% Accuracy", pct: 84.0, cls: "fill-blue", style: "" },
          { show: true, label: "Binary – Raw Human Feedback", val: "80.0% Accuracy", pct: 80.0, cls: "fill-gray", style: "" },
          { show: true, label: "Error Selection – Raw Human Feedback", val: "80.0% Accuracy", pct: 80.0, cls: "fill-gray", style: "" },
          { show: true, label: "Binary – LLM Post Processing", val: "78.0% Accuracy", pct: 78.0, cls: "", style: "background: #9ca3af;" },
          { show: true, label: "Error Selection – LLM Post Processing", val: "76.0% Accuracy", pct: 76.0, cls: "", style: "background: #9ca3af;" },
          { show: true, label: "No Feedback (Zero-Shot Baseline)", val: "40.0% Accuracy", pct: 40.0, cls: "", style: "background: #d1d5db;" }
        ]
      },
      "video_llava": {
        gain: "82.0% Peak (Video-LLaVA)",
        takeaway: "<strong>Paper Finding (Video-LLaVA):</strong> On Video-LLaVA, Error Correction with LLM post-processing achieves the highest overall accuracy at <strong>82.0%</strong>, surpassing even Free Text (75.0%). Notably, simple LLM post-processing of ambiguous binary (26.0%) or error-selection (39.0%) signals degrades accuracy below the 40.0% baseline, whereas raw human feedback remains significantly more robust (65.0% and 57.0%).",
        rows: [
          { show: true, label: "Error Correction – LLM Post Processing", val: "82.0% Accuracy", pct: 82.0, cls: "fill-green", style: "" },
          { show: true, label: "Free Text (Natural Language Commentary)", val: "75.0% Accuracy", pct: 75.0, cls: "fill-blue", style: "" },
          { show: true, label: "Error Correction – Raw Human Feedback", val: "68.0% Accuracy", pct: 68.0, cls: "fill-blue", style: "" },
          { show: true, label: "Binary – Raw Human Feedback", val: "65.0% Accuracy", pct: 65.0, cls: "fill-gray", style: "" },
          { show: true, label: "Error Selection – Raw Human Feedback", val: "57.0% Accuracy", pct: 57.0, cls: "fill-gray", style: "" },
          { show: true, label: "No Feedback (Zero-Shot Baseline)", val: "40.0% Accuracy", pct: 40.0, cls: "", style: "background: #d1d5db;" },
          { show: true, label: "Error Selection – LLM Post Processing", val: "39.0% Accuracy", pct: 39.0, cls: "", style: "background: #f87171;" },
          { show: true, label: "Binary – LLM Post Processing", val: "26.0% Accuracy", pct: 26.0, cls: "", style: "background: #f87171;" }
        ]
      },
      "head_to_head": {
        gain: "LLaVA-NeXT vs. Video-LLaVA",
        takeaway: "<strong>Paper Finding (Cross-Model Architecture Comparison):</strong> Both models begin at an identical <strong>40.0% zero-shot accuracy</strong> without feedback. LLaVA-NeXT-Video demonstrates broad resilience, maintaining 76%–90% accuracy across every feedback type. In contrast, Video-LLaVA is highly sensitive to feedback structure, peaking at 82.0% under structured error correction.",
        rows: [
          { show: true, label: "Free Text: LLaVA-NeXT-Video", val: "90.0% Accuracy", pct: 90.0, cls: "fill-green", style: "" },
          { show: true, label: "Free Text: Video-LLaVA", val: "75.0% Accuracy", pct: 75.0, cls: "fill-blue", style: "" },
          { show: true, label: "Error Correction (LLM): LLaVA-NeXT-Video", val: "85.0% Accuracy", pct: 85.0, cls: "fill-green", style: "" },
          { show: true, label: "Error Correction (LLM): Video-LLaVA", val: "82.0% Accuracy", pct: 82.0, cls: "fill-blue", style: "" },
          { show: true, label: "Binary (Raw Human): LLaVA-NeXT-Video", val: "80.0% Accuracy", pct: 80.0, cls: "fill-green", style: "" },
          { show: true, label: "Binary (Raw Human): Video-LLaVA", val: "65.0% Accuracy", pct: 65.0, cls: "fill-blue", style: "" },
          { show: true, label: "No Feedback Baseline: Both Models", val: "40.0% Accuracy (Zero-Shot)", pct: 40.0, cls: "", style: "background: #d1d5db;" },
          { show: false }
        ]
      },
      "processing": {
        gain: "Raw vs. LLM Post-Processing",
        takeaway: "<strong>Paper Finding (Raw Feedback vs. LLM Post-Processing):</strong> For complex error correction, LLM post-processing substantially improves accuracy (+14.0% gain on Video-LLaVA from 68% &rarr; 82%). However, when post-processing underspecified binary or category selection inputs, the LLM hallucinates or over-generalizes, precipitating steep performance drops (Binary on Video-LLaVA collapses from 65% down to 26%).",
        rows: [
          { show: true, label: "Error Correction (LLM Post-Processed) – Video-LLaVA", val: "82.0% Accuracy (+14% over raw)", pct: 82.0, cls: "fill-green", style: "" },
          { show: true, label: "Error Correction (Raw Human) – Video-LLaVA", val: "68.0% Accuracy", pct: 68.0, cls: "fill-blue", style: "" },
          { show: true, label: "Error Correction (LLM Post-Processed) – LLaVA-NeXT", val: "85.0% Accuracy", pct: 85.0, cls: "fill-green", style: "" },
          { show: true, label: "Error Correction (Raw Human) – LLaVA-NeXT", val: "84.0% Accuracy", pct: 84.0, cls: "fill-blue", style: "" },
          { show: true, label: "Binary Feedback (Raw Human) – Video-LLaVA", val: "65.0% Accuracy", pct: 65.0, cls: "fill-gray", style: "" },
          { show: true, label: "Binary Feedback (LLM Post-Processed) – Video-LLaVA", val: "26.0% Accuracy (-39% drop)", pct: 26.0, cls: "", style: "background: #f87171;" },
          { show: false },
          { show: false }
        ]
      }
    };

    buttons.forEach(function(btn) {
      btn.addEventListener("click", function() {
        buttons.forEach(function(b) { b.classList.remove("active"); });
        btn.classList.add("active");
        var view = btn.getAttribute("data-view");
        var d = viewData[view];
        if (!d) return;

        if (metricGain) metricGain.innerHTML = d.gain;
        takeaway.innerHTML = d.takeaway;

        d.rows.forEach(function(rData, idx) {
          var el = rowElements[idx];
          if (!rData || !rData.show) {
            el.row.style.display = "none";
          } else {
            el.row.style.display = "";
            el.label.innerHTML = rData.label;
            el.val.innerHTML = rData.val;
            el.bar.style.width = rData.pct + "%";
            el.bar.className = "demo-progress-fill" + (rData.cls ? " " + rData.cls : "");
            if (rData.style) {
              el.bar.setAttribute("style", "width: " + rData.pct + "%; " + rData.style);
            } else {
              el.bar.setAttribute("style", "width: " + rData.pct + "%;");
            }
          }
        });
      });
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initTiisSimulation);
  } else {
    initTiisSimulation();
  }
})();
</script>

---

## AI for Scientific Discovery

Scientific domains are characterized by complex, high-dimensional observations governed by underlying biological, physical, or mechanistic structure. My research develops machine learning methods that incorporate domain knowledge, relational structure, and scientific priors directly into learned representations and generative models. The goal is to move beyond purely data-driven pattern recognition toward models that better reflect the organization and interactions underlying scientific data.

In **computational biology**, my work focuses on structured representation learning for single-cell genomics, transcriptomics, and spatial biology. Rather than analyzing gene expression in isolation, we incorporate intercellular signaling mechanisms, such as cell-cell communication networks derived from ligand-receptor interactions, directly into deep generative models. This allows us to learn cellular representations that preserve organizational structure, resolve cellular heterogeneity, and capture biologically meaningful interactions across tissue microenvironments.

**Representative Contribution:**

- **CoLa-VAE** (bioRxiv 2026): A cell-cell communication-aware variational autoencoder that regularizes latent cellular representations using dynamic graph Laplacian constraints built from ligand-receptor interactomes, significantly improving cell-type identification and intercellular relationship mapping ([Code](https://github.com/Yeqing95/CoLa-VAE)).

---

## ARIA Research Lab

These research directions form the foundation of my work in the **Algorithms and Architectures for Reasoning and Intelligent Automation (ARIA) Lab** at NJIT.

For current lab projects, active grants, open-source code repositories, publications, and student recruiting opportunities, please visit the [**ARIA Lab Research**](https://aria-research-lab.github.io/research/) page.
