---
title: "Research"
layout: research_lay
sitemap: false
permalink: /research/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

# Research

My research develops learning-based methods for reasoning and decision-making in complex, structured domains. Operating at the intersection of machine learning, probabilistic modeling, symbolic reasoning, and mathematical optimization, my goal is to build AI systems that are reliable, interpretable, and scalable.

My core research agenda focuses on **neuro-symbolic reasoning and probabilistic inference**—spanning both direct neural approximation of inference problems and neural methods that augment classical solvers—alongside **neural combinatorial optimization** for structured decision-making. Building on these foundations, I study **structured and multimodal intelligence**, including procedural video understanding and human-guided vision-language systems, and develop methods for **AI for scientific discovery**, particularly in computational biology.

## Neuro-Symbolic Reasoning and Probabilistic Inference

I develop learning-based and optimization-based methods for reasoning under uncertainty in structured probabilistic models. My research combines neural networks with probabilistic inference, symbolic structure, classical algorithms, and mathematical optimization to improve the efficiency and scalability of challenging inference tasks. Rather than committing to a single computational paradigm, this work explores how learned and algorithmic components can be combined at different levels of the inference pipeline:

* **Neural approximation**, where neural networks directly learn computationally expensive inference mappings, producing high-quality solutions to queries such as MPE, constrained MPE, and marginal MAP in one or a few forward passes, optionally followed by inference-time optimization.
* **Neural augmentation**, where learned neural components operate within or alongside classical inference algorithms, providing warm starts, conditioning strategies, branching policies, node-selection heuristics, or local-search guidance while retaining the underlying solver framework.
* **Optimization-based structured inference**, where mathematical optimization techniques, including integer linear programming and local search, reason directly over structured probabilistic dependencies and combinatorial constraints.

Representative work includes **Neural Dual Bounds** (NeurIPS 2026 Spotlight), which learns valid-by-construction dual warm starts for MAP and constrained MAP inference; **Learning to Condition** (NeurIPS 2025), which learns conditioning, branching, and node-selection heuristics from solver search traces; **SINE** (AISTATS 2025), which improves neural MPE inference through structure- and parameter-aware embeddings and advanced discretization; and **BEACON** (arXiv 2026), which learns reusable neural guidance for local search in repeated MPE inference. Our earlier work introduced neural MPE inference with inference-time self-improvement and teacher-student training (NeurIPS 2024 Spotlight; UAI TPM 2024 Best Paper), self-supervised neural approximators for marginal MAP inference in probabilistic circuits (AAAI 2024 Oral), self-supervised inference under explicit probabilistic constraints (AISTATS 2024), and deep dependency networks with local-search and integer-programming-based structured inference (AISTATS 2024).



We have released these neural inference methods through **[NeuPI](https://neupi.readthedocs.io/en/latest/)**, a unified open-source library that makes our algorithms accessible through a common interface.

## Neural Combinatorial Optimization

I develop learning-based methods for solving large-scale combinatorial and constrained optimization problems over structured domains. This research combines deep reinforcement learning, representation learning, and classical optimization to learn effective decision policies for problems with large discrete action spaces, complex dependencies, and domain-specific constraints.

A particular focus is graph-structured optimization over complex networks, where solutions require sequentially selecting or modifying discrete elements such as nodes or edges. These methods aim to amortize expensive optimization across problem instances by learning policies that capture reusable structural patterns while accommodating operational, privacy, and application-specific constraints.

Representative work includes **RELINK** (CIKM 2025), which develops a deep reinforcement learning framework for edge-level influence maximization in privacy-constrained closed networks.

## Structured and Multimodal Intelligence

I develop learning methods for reasoning over complex perceptual and multimodal data by combining high-dimensional representations with explicit structure. This research investigates how temporal dependencies, task structure, relational representations, and human feedback can bridge low-level perception and higher-level reasoning, prediction, and decision-making:

* **Structured Video Understanding and Activity Reasoning:** Focuses on modeling the temporal and procedural structure of complex activities in video and augmented reality (AR). Rather than treating videos as collections of isolated frames, these models capture multi-step workflows, action dependencies, and deviations from expected procedures to support procedural error detection, temporal localization, explanation, and predictive task guidance.
* **Human-Guided Vision-Language and Multimodal AI:** Investigates multimodal systems that connect visual and linguistic representations with structured human feedback. This work explores how interactive human-in-the-loop guidance—ranging from rich natural-language commentary and word-level corrections to lightweight corrective signals—can calibrate model reasoning and improve downstream multimodal reliability.

Representative work includes **CaptainCook4D** (NeurIPS 2024 Datasets and Benchmarks Track), explainable activity recognition using deep learning and tractable probabilistic models (ACM TiiS 2023), predictive task guidance in augmented reality (IEEE VR 2024), and text-based human-in-the-loop feedback in vision-language models (ACM TiiS 2026).

## AI for Scientific Discovery

I develop machine learning methods that incorporate scientific structure, domain knowledge, and physical constraints into data-driven models for scientific discovery, focusing on domains where observations are high-dimensional, interactions are structured, and purely black-box learning fails to capture underlying mechanisms.

In **computational biology**, current work focuses on structured representation learning for single-cell genomics and transcriptomics. By embedding biological knowledge—including molecular interactions and cell-cell communication networks—directly into deep generative models, we learn representations that better reflect cellular organization, heterogeneity, and intercellular relationships.

Representative work includes **CoLa-VAE** (bioRxiv 2026), which integrates cell-cell communication structure into a variational autoencoder through dynamic graph Laplacian regularization derived from ligand-receptor interactions.

## ARIA Research Lab

These research directions are developed within the **Algorithms and Architectures for Reasoning and Intelligent Automation (ARIA) Lab** at NJIT.

For detailed project descriptions, software releases, research directions, and publications, visit the [**ARIA Lab Research**](https://aria-research-lab.github.io/research) page.
