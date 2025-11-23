---
title: "Deep Reinforcement Learning for Combinatorial Optimization on Graphs"
layout: textlay
sitemap: false
permalink: /hiring/drl-graph-optimization
seo:
  title: "Research Position: DRL for Graph Optimization – NJIT"
  description: "Undergraduate and MS research position in deep reinforcement learning for combinatorial optimization, focusing on influence maximization and graph problems."
---

<span style="display:none"><link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}"></span>

<div class="alert alert-info">
This position is open to <strong>undergraduate and MS students</strong>. Choose "Deep Reinforcement Learning for Influence Maximization" for the question "Which of the following match your research interests?" in the google form.
</div>

## Deep Reinforcement Learning for Combinatorial Optimization on Graphs

### Project Overview

This project develops deep reinforcement learning (DRL) methods for hard combinatorial optimization problems on graphs, with a primary focus on **Influence Maximization (IM)** and its variants. Students will design agents that learn to select nodes or edges in large networks to optimize long-term objectives, for example, maximizing information spread or minimizing risk.

Traditional algorithms for these problems are accurate but often too slow on real-world graphs. We study DRL and graph neural networks (GNNs) as fast, generalizable solvers that can handle new graphs and complex constraints.

---

### Core Research Questions

- How can DRL policies learn near-optimal seed selection strategies for IM and related tasks?
- How do GNN architectures and message-passing depth affect performance and generalization across graphs?
- Can DRL-based solvers handle constrained or robust variants that are difficult for classical heuristics?
- How do learned solvers compare to greedy and simulation-based methods in solution quality and runtime?

---

### What You Will Work On

Depending on your background and interests, you will work on a subset of the following:

- Implement IM and variant environments on real and synthetic large-scale graphs.
- Build graph-based DRL agents using **PyTorch** and **PyTorch Geometric**.
- Explore value-based (DQN-style) and policy gradient (PPO-style) algorithms for sequential node selection.
- Design and evaluate GNN architectures and graph embeddings for combinatorial decision-making.
- Benchmark against classical heuristics and state-of-the-art IM algorithms.
- Extend the framework to variants such as:
  - Budgeted or weighted IM.
  - Robust or risk-aware IM under model misspecification.
  - Fair or group-constrained influence maximization.
  - Multi-objective formulations (e.g., spread versus cost/exposure).

The goal is to produce research results competitive with existing methods, suitable for submission to top-tier AI or data mining venues.

---

### What You Will Learn

**AI and Deep Learning**
- Reinforcement learning for sequential decision-making on structured state spaces.
- GNNs and graph embeddings for large network data.
- Practical training of deep models on GPUs, including batching, memory management, and scaling.

**Algorithms and Optimization**
- Formulation of NP-hard graph optimization problems such as IM, coverage, and routing.
- Approximation and heuristic design for large combinatorial spaces.
- Experimental methodology and evaluation protocols for optimization algorithms.
  
---

### Ideal Background and Interests

You are a good fit if you:
- Enjoy AI, machine learning, and especially Deep RL.
- Like working with graphs, algorithms, and optimization theory.
- Are comfortable programming in Python and using PyTorch or similar frameworks.
- Are interested in building, testing, and analyzing models rather than strictly using off-the-shelf tools.

**Helpful but not required:**
- Prior exposure to RL (value iteration, policy gradient).
- Experience with GNNs or PyTorch Geometric.
- Background in algorithms, probability, or graph theory.

---

### Expected Commitment

Typical expectations for a research-oriented project:

**Time:** About 8–12 hours per week during the term

**Regular meetings:** Weekly or biweekly research meetings for updates and guidance

**Deliverables:**
- Working DRL + GNN codebase for at least one IM variant.
- Experimental study on several graph datasets.
- Final research-style report and presentation.
- Conference-style paper (KDD, CIKM, etc.) if results are strong.

---

### Possible Outcomes and Credit

Depending on performance and interest, outcomes may include:

- Hands-on research experience in DRL for graphs.
- Co-authorship on a publication submitted to an AI or data mining venue.
- Undergraduate research credit (**CS 488**: Independent Study in Computer Science).
- Master's project or thesis topic (**CS 700B**: Master's Project, followed by **CS 701B**: Master's Thesis).

---

### Mentorship and Research Environment

You will work closely with **Dr. Arya** and collaborators in a group focusing on learning-based solvers for large-scale decision-making on graphs. The group has prior experience with award-winning research, practical tooling for large graphs, and applications in social network analysis, medical, and energy systems.

You will have access to GPU resources, existing codebases for graph processing, and prior implementations of DRL and GNN models to accelerate progress.

---

### How To Apply

Please submit your details using the <a href="https://forms.gle/SYb5HQeXQB3ogedo9" target="_blank">Google Form</a>.

> **Note**: Choose "Deep Reinforcement Learning for Influence Maximization" for the question "Which of the following match your research interests?" in the google form.

Selected students may be invited for a brief meeting to discuss fit and potential directions.

---

<div class="text-center">
<p>For general lab information and university details, see the <a href="/hiring/">main hiring page</a>.</p>
<a href="/hiring/" class="btn btn-primary">← Back to Main Hiring Page</a>
</div>

