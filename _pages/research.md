---
title: "Research"
layout: research_lay
sitemap: false
permalink: /research/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

# Research

My research develops structured, interpretable, and efficient AI methods that integrate **learning, reasoning, and optimization**. I am particularly interested in using neural methods to solve computationally challenging reasoning and optimization problems while preserving the structure and constraints of the underlying domain.

My work spans **probabilistic and neurosymbolic reasoning**, **neural combinatorial optimization**, and **structured vision and multimodal AI**, with applications to graphical models, networks, video understanding, human-AI interaction, and scientific domains.

## Inference in Neurosymbolic Models

I develop learning-based methods for efficient inference in **probabilistic and neurosymbolic models**. A central goal is to replace or augment computationally expensive inference procedures with neural models that exploit the structure of the underlying probabilistic model while retaining high solution quality.

This research includes three complementary directions:

* **Neural approximators for probabilistic inference**, where neural networks directly predict solutions to inference problems such as MPE, constrained MPE, and marginal MAP.
* **Learned heuristics for classical inference algorithms**, where neural models guide search, conditioning, branching, or other decisions within established optimization and inference procedures.
* **Optimization-based structured inference**, where probabilistic dependencies and domain constraints are incorporated into optimization procedures for structured prediction.

Representative work includes **SINE** (AISTATS 2025), **Learning to Condition** (NeurIPS 2025), **ITSELF** and **GUIDE** (NeurIPS 2024 Spotlight; UAI TPM 2024 Best Paper), neural marginal MAP inference (AAAI 2024 Oral), constrained MPE inference (AISTATS 2024), and deep dependency networks with structured inference (AISTATS 2024).

We have released these methods through **[NeuPI](https://neupi.readthedocs.io/en/latest/)**, a unified library that makes our neural probabilistic inference methods accessible through a common interface.

## Neural Combinatorial Optimization

I develop **neural and reinforcement learning methods for combinatorial optimization**, particularly for graph-structured problems where conventional optimization methods can become computationally expensive at scale.

My work investigates how learned representations, policies, and search strategies can exploit structural information in a problem instance to make better discrete decisions. I am particularly interested in methods that combine neural prediction with graph structure, optimization algorithms, and domain-specific constraints rather than treating combinatorial optimization as an unstructured prediction problem.

Representative work includes **RELINK** (CIKM 2025), which develops a deep reinforcement learning framework for edge-level influence maximization in privacy-constrained networks.

## Structured Vision and Video Understanding

I study **structured reasoning for visual understanding**, particularly for procedural activities where recognizing individual actions alone is insufficient to understand the broader task.

This research investigates models that reason about temporal dependencies, procedural structure, errors, explanations, and future actions. The broader objective is to build systems that move beyond frame-level recognition toward representations capable of supporting interpretable reasoning and intelligent assistance.

Representative work includes **CaptainCook4D** (NeurIPS 2024 Datasets and Benchmarks Track), explainable activity recognition using deep learning and tractable probabilistic models (ACM TiiS 2023), and predictive task guidance for augmented reality.

## Vision-Language and Multimodal AI

I investigate **vision-language and multimodal systems** that combine visual perception, language, and structured reasoning. A particular focus is on incorporating human feedback and domain knowledge to improve the reliability, interpretability, and effectiveness of multimodal models.

This work studies how different forms of human supervision can guide vision-language models and how structured feedback can improve downstream image and video understanding.

Representative work includes **Comparison of Text-Based Inputs for Human-in-the-Loop Feedback in Vision-Language Models** (ACM TiiS 2026).

## AI for Computational Biology

I also collaborate on applications of **machine learning and structured representation learning to computational biology**, where domain structure can provide important constraints on learning from high-dimensional biological data.

Current work includes representation learning for single-cell transcriptomics using graph-based models of cell-cell communication, including **CoLa-VAE**, which incorporates dynamically constructed graph Laplacian constraints into variational representation learning.

## Multi-Label Learning

My earlier work also includes **multi-label classification**, particularly methods that model dependencies among output labels and connect naturally to my broader interests in structured prediction and probabilistic inference.

This includes work on kernel-based multi-label classifiers and deep dependency networks for structured image and video classification.

## ARIA Research Lab

These research directions are developed within the **Algorithms and Architectures for Reasoning and Intelligent Automation (ARIA) Lab** at NJIT.

For current projects, detailed research descriptions, software, and publications, visit the [**ARIA Lab Research**](https://aria-research-lab.github.io/research) page.
