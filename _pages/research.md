---
title: "Research"
layout: research_lay
sitemap: false
permalink: /research/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

# Research

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

**Representative Contributions & Software:**
* **Neural Dual Bounds** (NeurIPS 2026 Spotlight): Architectures providing valid-by-construction dual warm-starts for Join Graph Linear Programming (JGLP), accelerating MAP and constrained MAP inference while guaranteeing bounding certificates.
* **Learning to Condition (L2C)** (NeurIPS 2025): Neural search policies learned from solver traces that guide variable conditioning and branch-and-bound node selection ([Code](https://github.com/brijml/L2C)).
* **SINE** (AISTATS 2025): Structural and parameter-aware neural embeddings for real-time MPE inference in probabilistic graphical models.
* **BEACON** (arXiv 2026): Amortized neural guidance that steers local-search transitions in repeated MPE queries.
* Foundational inference frameworks: Neural MPE with test-time self-improvement (NeurIPS 2024 Spotlight; UAI TPM 2024 Best Paper Award), continuous multilinear relaxations for marginal MAP in probabilistic circuits (AAAI 2024 Oral), self-supervised constrained MPE (AISTATS 2024), and deep dependency networks with ILP inference (AISTATS 2024).
* **[NeuPI](https://neupi.readthedocs.io/en/latest/)**: We have unified these neural inference methods into NeuPI, an open-source library that makes our algorithms accessible through a common interface.

---

## Neural Combinatorial Optimization

Combinatorial optimization problems over discrete structures—such as graphs and complex relational networks—underpin critical decision-making in routing, resource allocation, network security, and influence propagation. Classical combinatorial algorithms face severe computational bottlenecks on large-scale instances, whereas greedy or handcrafted heuristics often fail to adapt to complex, domain-specific constraints.

My research in neural combinatorial optimization explores how deep reinforcement learning (DRL) and graph representation learning can learn effective, instance-adaptive decision policies. By formulating discrete sequential decisions (such as node or edge selection) as Markov Decision Processes, we train neural policies that exploit recurring topological symmetries and structural invariants across problem distributions. This amortizes the computational cost of optimization, enabling efficient decision-making while explicitly accounting for operational, budget, privacy, and other domain-specific constraints.

**Representative Contribution:**
* **RELINK** (CIKM 2025): A deep reinforcement learning framework that formulates edge-level influence maximization under strict privacy constraints in closed networks as a sequential Markov Decision Process, outperforming traditional heuristic and non-learning baselines.

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
