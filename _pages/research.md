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

* **Amortized Neural Approximators:** We design neural networks that directly learn the mapping from graphical model structures and observed evidence to high-quality query solutions in one or a few forward passes. By combining structural and parameter-aware graph embeddings with inference-time self-supervised optimization, our models answer complex queries in milliseconds or microseconds.
* **Neural Augmentation of Algorithmic Solvers:** To maintain rigorous bounding certificates and solution guarantees, we integrate neural guidance directly into classical algorithmic frameworks. Learned components predict valid-by-construction dual warm-starts for linear programming relaxations, learn branching and variable-conditioning heuristics from solver search traces, and guide stochastic local search over high-treewidth models.
* **Optimization-Based Structured Inference & Historical Trajectory:** A foundational thread of my research explores mathematical programming and discrete optimization for structured prediction. In earlier work on multi-label classification across images and videos, I investigated how complex output correlations can be captured via deep dependency networks (DDNs) and resolved using integer linear programming (ILP) and local search. Folding label correlations into explicit dependency structures rather than assuming conditional independence established a key conceptual bridge between discriminative representation learning and combinatorial inference that continues to inform my current work.

<details class="interactive-demo-wrapper">
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

  <details class="demo-table-details">
    <summary>View Comprehensive Methodology & Benchmark Comparison Table</summary>
    <div class="demo-table-wrap">
      <table>
        <thead>
          <tr>
            <th>Method</th>
            <th>Venue / Honor</th>
            <th>Task</th>
            <th>Inference Mechanism</th>
            <th>Latency (1 Inf)</th>
            <th>Throughput</th>
            <th>Speedup</th>
            <th>Supervised Labels?</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>SSMP</strong></td>
            <td>AAAI 2024 Oral</td>
            <td>Marginal MAP in PCs</td>
            <td>Amortized continuous multilinear relaxation</td>
            <td><strong>9.870 &micro;s</strong></td>
            <td><strong>101,317.12 /s</strong></td>
            <td><strong>&times;273,860.2</strong></td>
            <td>Zero (Self-Supervised)</td>
          </tr>
          <tr>
            <td><strong>ITSELF</strong></td>
            <td>NeurIPS 2024 Spotlight</td>
            <td>Arbitrary MPE in PMs</td>
            <td>Inference-time self-supervised optimization</td>
            <td><strong>784.000 ms</strong></td>
            <td><strong>1.28 /s</strong></td>
            <td><strong>&times;3.4</strong></td>
            <td>Zero (Self-Supervised)</td>
          </tr>
          <tr>
            <td><strong>Traditional Baseline</strong></td>
            <td>Exact</td>
            <td>Standard Combinatorial Search</td>
            <td>Branch-and-bound</td>
            <td>2.703 s</td>
            <td>0.37 /s</td>
            <td>&times;1.0</td>
            <td>N/A</td>
          </tr>
        </tbody>
      </table>
    </div>
  </details>
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

**Representative Contributions & Software:**
* **Neural Dual Bounds** (NeurIPS 2026 Spotlight): Architectures providing valid-by-construction dual warm-starts for Join Graph Linear Programming (JGLP), accelerating MAP and constrained MAP inference while guaranteeing bounding certificates.
* **Learning to Condition (L2C)** (NeurIPS 2025): Neural search policies learned from solver traces that guide variable conditioning and branch-and-bound node selection ([Code](https://github.com/brijml/L2C)).
* **SINE** (AISTATS 2025): Structural and parameter-aware neural embeddings for real-time MPE inference in probabilistic graphical models.
* **BEACON** (arXiv 2026): Amortized neural guidance that steers local-search transitions in repeated MPE queries.
* Foundational inference frameworks: **ITSELF** for neural MPE with test-time self-improvement (NeurIPS 2024 Spotlight; UAI TPM 2024 Best Paper Award; 3.4&times; speedup), **SSMP** continuous multilinear relaxations for marginal MAP in probabilistic circuits (AAAI 2024 Oral; &gt;273,000&times; speedup), self-supervised constrained MPE (AISTATS 2024), and deep dependency networks with ILP inference (AISTATS 2024).
* **[NeuPI](https://neupi.readthedocs.io/en/latest/)**: We have unified these neural inference methods into NeuPI, an open-source library that makes our algorithms accessible through a common interface.

---

## Neural Combinatorial Optimization

Combinatorial optimization problems over discrete structures—such as graphs and complex relational networks—underpin critical decision-making in routing, resource allocation, network security, and influence propagation. Classical combinatorial algorithms face severe computational bottlenecks on large-scale instances, whereas greedy or handcrafted heuristics often fail to adapt to complex, domain-specific constraints.

My research in neural combinatorial optimization explores how deep reinforcement learning (DRL) and graph representation learning can learn effective, instance-adaptive decision policies. By formulating discrete sequential decisions (such as node or edge selection) as Markov Decision Processes, we train neural policies that exploit recurring topological symmetries and structural invariants across problem distributions. This amortizes the computational cost of optimization, enabling efficient decision-making while explicitly accounting for operational, budget, privacy, and other domain-specific constraints.

**Representative Contribution:**
* **RELINK** (CIKM 2025 Oral): A deep reinforcement learning framework that formulates edge-level influence maximization under strict privacy constraints in closed networks as a sequential Markov Decision Process, outperforming traditional heuristic and non-learning baselines.

---

## Structured and Multimodal Intelligence

Perceptual intelligence in complex environments requires more than mapping sensory inputs to isolated semantic labels; it demands reasoning over temporal dependencies, procedural workflows, and structured human interactions. My work in structured and multimodal intelligence integrates high-dimensional visual and linguistic representations with explicit task models to bridge low-level perception and higher-level reasoning.

This agenda spans two interconnected threads:

* **Procedural Video Understanding and Activity Reasoning:** Real-world human activities unfold through multi-step workflows with sequential dependencies and potential execution errors. Moving beyond frame-level action recognition, my research develops structured models that capture procedural hierarchies, track user progress, detect execution errors, and provide proactive predictive guidance in physical environments and augmented reality (AR).
* **Human-Guided Vision-Language Systems:** To ensure multimodal systems remain trustworthy and aligned with user intent, I investigate interactive human-in-the-loop learning. Rather than treating models as static black boxes, this work explores how different granularities of human feedback—from natural language explanations and corrective annotations to lightweight scalar critiques—can calibrate multimodal reasoning, resolve perceptual ambiguities, and adapt models to dynamic deployment contexts.

**Representative Contributions & Datasets:**
* **CaptainCook4D** (NeurIPS 2024 Datasets and Benchmarks Track): A 94.5-hour egocentric 4D multimodal dataset comprising 384 recordings of complex recipe executions, capturing both successful and errorful trials with fine-grained temporal and procedural step annotations ([Project](https://captaincook4d.github.io/captain-cook/)).
* **Explainable Video Reasoning** (ACM TiiS 2023): Hybrid architectures combining deep video representations with dynamic cutset networks to enable tractable probabilistic queries and interpretable activity explanations.
* **Predictive Task Guidance in AR** (IEEE VR 2024): Real-time augmented-reality systems that anticipate user actions and deliver proactive task assistance during complex physical procedures.
* **Human-in-the-Loop Multimodal Feedback** (ACM TiiS 2026): A comprehensive empirical study comparing textual commentary, word corrections, and scalar feedback mechanisms for steering vision-language model predictions.

---

## AI for Scientific Discovery

Scientific domains are characterized by complex, high-dimensional observations governed by underlying biological, physical, or mechanistic structure. My research develops machine learning methods that incorporate domain knowledge, relational structure, and scientific priors directly into learned representations and generative models. The goal is to move beyond purely data-driven pattern recognition toward models that better reflect the organization and interactions underlying scientific data.

In **computational biology**, my work focuses on structured representation learning for single-cell genomics, transcriptomics, and spatial biology. Rather than analyzing gene expression in isolation, we incorporate intercellular signaling mechanisms, such as cell-cell communication networks derived from ligand-receptor interactions, directly into deep generative models. This allows us to learn cellular representations that preserve organizational structure, resolve cellular heterogeneity, and capture biologically meaningful interactions across tissue microenvironments.

**Representative Contribution:**
* **CoLa-VAE** (bioRxiv 2026): A cell-cell communication-aware variational autoencoder that regularizes latent cellular representations using dynamic graph Laplacian constraints built from ligand-receptor interactomes, significantly improving cell-type identification and intercellular relationship mapping ([Code](https://github.com/Yeqing95/CoLa-VAE)).

---

## ARIA Research Lab

These research directions form the foundation of my work in the **Algorithms and Architectures for Reasoning and Intelligent Automation (ARIA) Lab** at NJIT.

For current lab projects, active grants, open-source code repositories, publications, and student recruiting opportunities, please visit the [**ARIA Lab Research**](https://aria-research-lab.github.io/research/) page.
