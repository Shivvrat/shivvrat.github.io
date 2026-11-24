---
title: "Home"
layout: homelay
permalink: /
seo_title: "Shivvrat Arya – Neurosymbolic AI & Probabilistic Reasoning"
description: "Assistant Professor of Computer Science at NJIT and Director of the ARIA Lab."

---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

<!-- <div class="alert alert-info">
🎓 I am currently on the academic job market! 
</div> -->

<!-- <div class="alert alert-info">
🎓 Shivvrat Arya has joined the Department of Computer Science at the Ying Wu College of Computing, New Jersey Institute of Technology (NJIT) as a Tenure-Track Assistant Professor. 
</div> -->


<div class="alert" style="background-color: #FEF3E2; border: 1px solid #F5DEB3; border-radius: 12px; color: #333; padding: 4px 6px; margin-bottom: 12px;">
📢 Dr. Arya is recruiting motivated Ph.D. students ({{ site.data.recruiting.start_terms_ampersand }}) as well as undergraduate and master’s students interested in research in AI and machine learning. For more details, please see the <a href="{{ site.baseurl }}/hiring" target="_blank">hiring page</a>.
</div>

## Biography  

Shivvrat Arya is an Assistant Professor of Computer Science at the Ying Wu College of Computing, New Jersey Institute of Technology (NJIT), Director of the [ARIA Lab](https://aria-research-lab.github.io/), and a Core Faculty member of the [Center for AI Research](https://research.njit.edu/ai/). His research develops structured, interpretable, and efficient AI methods that integrate learning, reasoning, and optimization, with a focus on probabilistic and neurosymbolic reasoning, neural combinatorial optimization, structured and multimodal intelligence, and AI for scientific discovery.

He received his Ph.D. in Computer Science from The University of Texas at Dallas, where he was advised by <a href="https://personal.utdallas.edu/~vibhav.gogate/">{{ site.data.pi[0].phd_advisor }}</a> and <a href="https://yuxng.github.io/">{{ site.data.pi[0].phd_co_advisor }}</a>. His doctoral research focused on learning-based methods for probabilistic inference and structured reasoning.

<div class="alert" style="background-color: #FEF3E2; border: 1px solid #F5DEB3; border-radius: 12px; color: #333; padding: 4px 6px; margin-bottom: 12px;">
For current projects and research activity, visit the <a href="https://aria-research-lab.github.io/">ARIA Lab website</a>.
</div>
---

## Research Focus  

<ul class="research-focus-list">
<li><a href="{{ '/research/#neuro-symbolic-reasoning-and-probabilistic-inference' | relative_url }}">Neuro-Symbolic and Probabilistic Reasoning:</a> Integrating deep learning with probabilistic graphical models, circuits, and classical solvers to enable scalable, guaranteed, and real-time inference under uncertainty and constraints.</li>
<li><a href="{{ '/research/#neural-combinatorial-optimization' | relative_url }}">Neural Combinatorial Optimization:</a> Developing deep reinforcement learning and graph representation learning methods to learn adaptive, structure-aware decision policies for complex combinatorial and network optimization problems.</li>
<li><a href="{{ '/research/#structured-and-multimodal-intelligence' | relative_url }}">Structured and Multimodal Intelligence:</a> Bridging high-dimensional perception with procedural workflows, temporal reasoning, and human-in-the-loop guidance for procedural video understanding and trustworthy multimodal systems.</li>
<li><a href="{{ '/research/#ai-for-scientific-discovery' | relative_url }}">AI for Scientific Discovery:</a> Incorporating domain priors, biological networks, and mechanistic constraints into deep generative models for structured scientific discovery, with an emphasis on single-cell genomics and computational biology.</li>
</ul>

---

## Selected Projects & Highlights

- **Real-Time Neural Inference Engine**  
  **NeuPI** <a href="https://shivvrat.github.io/certificates/tpm_certificate.jpg" target="_blank" rel="noopener noreferrer" class="award-badge"><i class="fa-solid fa-trophy award-icon" aria-hidden="true"></i> Best Paper Award (UAI TPM '24)</a> <span class="award-badge"><i class="fa-solid fa-star award-icon" aria-hidden="true"></i> NeurIPS '24 Spotlight (Top 2%)</span> <span class="award-badge"><i class="fa-solid fa-bullhorn award-icon" aria-hidden="true"></i> AAAI '24 Oral (Top 3%)</span>  
  An open-source PyTorch library for self-supervised neural probabilistic inference, combining single-pass neural approximators and test-time optimization to accelerate inference from minutes to microseconds.  
  **Publications:** [ITSELF (NeurIPS 2024)](https://openreview.net/forum?id=ufPPf9ghzP), [SSMP (AAAI 2024)](https://ojs.aaai.org/index.php/AAAI/article/view/28966), [SS-CMPE (AISTATS 2024)](https://proceedings.mlr.press/v238/arya24b.html), [SINE (AISTATS 2025)](https://proceedings.mlr.press/v258/arya25a.html)
  <span class="project-resource-links"><a href="https://github.com/Shivvrat/NeuPI" target="_blank" rel="noopener noreferrer" class="project-resource-btn"><i class="fa-brands fa-github" aria-hidden="true"></i> Code</a><a href="https://neupi.readthedocs.io/en/latest/" target="_blank" rel="noopener noreferrer" class="project-resource-btn"><i class="fa-solid fa-book" aria-hidden="true"></i> Documentation</a></span>

- **Neural-Augmented Classical Solvers**  
  **Neural Dual Bounds** <span class="award-badge"><i class="fa-solid fa-star award-icon" aria-hidden="true"></i> NeurIPS '26 Spotlight (Top 1%)</span> & **Learning to Condition (L2C)**  
  Integrating learned heuristics, valid-by-construction dual bounds, and search policies into classical probabilistic inference algorithms to accelerate convergence and reduce search complexity while preserving theoretical guarantees.  
  **Publications:** [Neural Dual Bounds (NeurIPS 2026)](https://openreview.net/forum?id=fdwZvjybdN), [Learning to Condition (NeurIPS 2025)](https://proceedings.neurips.cc/paper_files/paper/2025/file/af80ce1011eb35fe1023c320158c2ad9-Paper-Conference.pdf)  
  **Ongoing work:** [Learning to Bound](https://arxiv.org/abs/2610.39305), [BEACON](https://arxiv.org/abs/2602.01475)
  <span class="project-resource-links"><a href="https://github.com/brijml/L2C" target="_blank" rel="noopener noreferrer" class="project-resource-btn"><i class="fa-brands fa-github" aria-hidden="true"></i> Code (L2C)</a></span>

- **Deep RL for Network Diffusion & Optimization**  
  **[RELINK](https://dl.acm.org/doi/10.1145/3746252.3761006)** <span class="award-badge"><i class="fa-solid fa-bullhorn award-icon" aria-hidden="true"></i> CIKM '25 Oral</span> & **[LEAP](https://doi.org/10.1145/3799682.3840796)** (CIKM '26)  
  Reinforcement learning policies that amortize combinatorial search over complex networks for influence and fixation maximization—achieving up to five orders of magnitude faster inference than simulation-based methods.

- **Procedural Activity Understanding & Task Guidance**  
  **CaptainCook4D**  
  A 94.5-hour egocentric 4D dataset and benchmark for procedural activity understanding, error recognition, and procedure learning, complementing broader work on explainable activity recognition, AR task guidance, and vision-language models.  
  **Publications:** [NeurIPS 2024 Datasets & Benchmarks](https://doi.org/10.52202/079017-4307), [IEEE VR 2024](https://doi.org/10.1109/VRW62533.2024.00283), [ACM TiiS 2023](https://doi.org/10.1145/3626961), [ACM TiiS 2026](https://doi.org/10.1145/3816700)
  <span class="project-resource-links"><a href="https://captaincook4d.github.io/captain-cook/" target="_blank" rel="noopener noreferrer" class="project-resource-btn"><i class="fa-solid fa-globe" aria-hidden="true"></i> Project</a><a href="https://github.com/CaptainCook4D/" target="_blank" rel="noopener noreferrer" class="project-resource-btn"><i class="fa-brands fa-github" aria-hidden="true"></i> Code</a></span>

- **Communication-Aware Single-Cell Genomics**  
  **CoLa-VAE**  
  A knowledge-guided variational autoencoder incorporating cell-cell communication networks to improve single-cell gene expression denoising, communication analysis, and spatial transcriptomic deconvolution.  
  **Preprint:** [bioRxiv 2026](https://doi.org/10.64898/2026.03.28.715052)
  <span class="project-resource-links"><a href="https://github.com/Yeqing95/CoLa-VAE" target="_blank" rel="noopener noreferrer" class="project-resource-btn"><i class="fa-brands fa-github" aria-hidden="true"></i> Code</a></span>

---

For earlier externally funded research contributions, including work supported through DARPA, NSF, and AFOSR projects, see [Funded Projects](/grants/).

<!-- ---

## Education  

- **Ph.D., Computer Science** – {{ site.data.pi[0].education3institution }}  
- **M.S., Computer Science** – {{ site.data.pi[0].education2institution }}  
- **B.Tech., Computer Science and Engineering** – IIIT Vadodara   -->
