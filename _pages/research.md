---
title: "Research"
layout: gridlay
sitemap: false
permalink: /research/
---

<!-- <style> -->
<!-- iframe { -->
<!--   height: 100%; -->
<!--   width: 175px !important; -->
<!--   display: inline; -->
<!--   vertical-align:middle; -->
<!--   margin:0px !important; -->
<!--   padding:0px !important; -->
<!--   width: 175px; -->
<!--   display: inline; -->
<!--   vertical-align:middle; -->
<!--   border: 1px solid red; -->
<!-- } -->
<!-- .col-md-3 { -->
<!--   margin:0px !important; -->
<!--   padding:0px !important; -->
<!--   overflow:hidden; -->
<!--   display: table-cell; -->
<!--   text-align:center; -->
<!--   background: white; -->
<!--   width: 175px; -->
<!--   border: 0px solid transparent; -->
<!--   border-radius:20px; -->
<!-- } -->
<!-- </style> -->

<style>
img{
  border-radius: 10px;
}
.col-md-3 {
  margin-top:10px;
  margin-bottom:10px;
  padding:0px;
  display:block;
  overflow:hidden;
  text-align:center;
  display: table-cell;
  background: white;
  border-radius: 20px;
  height: auto;
  <!-- border: 1px solid black; -->
}
iframe {
  margin:0;
  padding:0;
  width: 175px;
  display: inline;
  vertical-align: middle;
}
</style>

  <!-- border: 5px solid red; -->
  <!-- margin-bottom:5px; -->
  <!-- margin-left:5px; -->
  <!-- float: none; -->


## Research
#### Research Interests 
Computer Vision, Machine learning and Artificial Intelligence.

#### Current Research Focus
Deep Learning, Probabilistic Graphical Models, Tractable Machine Learning

<div class="jumbotron">
<div class="row align-items-end">
<div class="col-md-9 col-sm-12">
 <h4>Activity Recognition</h4>
Activity Recognition is very important in everyday life. The task of video activity recognition has been getting a lot of attention in recent years. In this task we are given a set of videos of laboratory experiments and we need to detect what activities are being done by the person in the video. The task is very difficult especially when , (1) There is no limit on the number of labels (activities and objects) for a given frame, (2) There is a correlation between neighbouring frames (since there is a list of steps that the person needs to follow to complete a given task), (3) When there are different subjects doing the tasks in different videos, and (4) Different objects have similar appearances. 
We are trying to implement various Probabilistic Graphical Models (PGMs) to improve the performance of methods. The inputs to these PGMs are vectors of features extracted from Convolutional Neural Network like SlowFast model and InceptionV3. 
Multiple PGMs were tried to improve the performance -
1. Markov Network. Inference Done using 
	1. 	MAP inference - using ILP
	2. Variable Elimination
	3. Iterative Join-Graph Propagation (IJGP)
2. Markov Networks with additional information (coming from NLP)
3. Mixture Models 
4. Dependency Networks 
5. Joint Learning between Dependency Networks and SlowFast
</div>
</div>
</div>

[//]: # (  <!-- <iframe src="https://player.vimeo.com/video/455887852?autoplay=1&loop=1&autopause=0&muted=1&quality=240p&background=1" height="142px" frameborder="0" allow="autoplay"></iframe> -->)

[//]: # ()
[//]: # ()
[//]: # (<div class="jumbotron">)

[//]: # (<div class="row align-items-end">)

[//]: # (<div class="col-md-9 col-sm-12">)

[//]: # (<h4>Learning from animals: Humpback whales</h4>)

[//]: # (Perspective on bubble utilization can come from a surprising source: **animals**.)

[//]: # (<a href="https://www.youtube.com/watch?v=Q8iDcLTD9wQ" target="_blank">Humpback whales hunt</a> using bubbly regions &#40;called bubble nets&#41; and loud vocalizations.)

[//]: # (Specifically, they)

[//]: # (* Release air from their blowholes while swimming, spiraling downwards)

[//]: # (* Surround their prey with a wall of bubbles)

[//]: # (* Vocalize from the exterior, trapping small fish in loud sound &#40;~190dB!&#41;)

[//]: # (* Swim up and through the interior, lunge feeding on the fish)

[//]: # ()
[//]: # (While fascinating, the acoustic mechanisms enabling this behavior are not understood.)

[//]: # (My ensemble-averaged bubbly flow model simulates the relevant acoustic phenomena, <a href="{{ site.url }}{{ site.baseurl }}/papers/bryngelson-JASA-20.pdf" target="_blank">advancing our interpretation of this behavior</a>.)

[//]: # (Similar outcomes are desirable for sensitive, implanted biomedical devices.)

[//]: # (</div>)

[//]: # (<div class="col-md-3 col-sm-12" >)

[//]: # (  <iframe src="https://player.vimeo.com/video/455688521?autoplay=1&loop=1&autopause=0&muted=1&quality=240p&background=1" height="192px" frameborder="0" allow="autoplay"></iframe>)

[//]: # (</div>)

[//]: # (</div>)

[//]: # (</div>)

[//]: # ( )
[//]: # ()
[//]: # (<div class="jumbotron">)

[//]: # (<div class="row align-items-end">)

[//]: # (<div class="col-md-9 col-sm-12">)

[//]: # ( <h4>Therapy design via adjoint-based optimization</h4>)

[//]: # (Designing medical therapies requires efficient optimization algorithms. )

[//]: # (Current methods fail to account for the _material interfaces_ or _shock waves_ that occur during treatments like lithotripsy and histotripsy.)

[//]: # (I created an adjoint-based technique for navigating these complications and computes the gradient-based information required for such <a href="{{ site.url }}{{ site.baseurl }}/papers/bryngelson-xpacc18.pdf" target="_blank">optimization and sensitivity analysis</a>.)

[//]: # (Coupling with <a href="{{ site.url }}{{ site.baseurl }}/software/" target="_blank">PlasCom2</a> provides a full optimization framework for medical therapies and devices.)

[//]: # (</div>)

[//]: # (<div class="col-md-3 col-sm-12" style="background-color:transparent" >)

[//]: # (  <img src="{{ site.url }}{{ site.baseurl }}/images/respic/lithotripsy.jpg" width="175px"/>)

[//]: # (</div>)

[//]: # (</div>)

[//]: # (</div>)

[//]: # ()
[//]: # ()
[//]: # (<div class="jumbotron">)

[//]: # (<div class="row align-items-end">)

[//]: # (<div class="col-md-9 col-sm-12">)

[//]: # ( <h4>An _in silico_ microfluidics and microcirculation</h4>)

[//]: # (I create simulation methods for the cellular flows that occur _in vivo_ and in biomicrofluidic devices.)

[//]: # (These tools are composed of physical models for the cells and particles and numerical methods to solve for their motion.)

[//]: # (These are implemented in <a href="{{ site.url }}{{ site.baseurl }}/software/" target="_blank">RBC3D</a>, my state-of-the-art flow solver that resolves <a href="{{ site.url }}{{ site.baseurl }}/papers/bryngelson-PRF-16.pdf" target="_blank">all particle-scale interactions</a>.)

[//]: # (Coupling RBC3D with <a href="{{ site.url }}{{ site.baseurl }}/papers/bryngelson-PRF-18.pdf" target="_blank">stability and optimization tools</a> I discovered:)

[//]: # (* The <a href="{{ site.url }}{{ site.baseurl }}/papers/bryngelson-RA-16.pdf" target="_blank">buckling mechanism</a>  mediating the flow of sickle cells.)

[//]: # (* The <a href="{{ site.url }}{{ site.baseurl }}/papers/bryngelson-PRE-19.pdf" target="_blank">chaotic behavior</a> of microcirculatory flows, and so computational methods cannot predict cell location &#40;or motion&#41; at long times.)

[//]: # (* A <a href="{{ site.url }}{{ site.baseurl }}/papers/bryngelson-PRE-19.pdf" target="_blank">data-driven low-order model</a> for the flow statistics.)

[//]: # (</div>)

[//]: # (<div class="col-md-3 col-sm-12">)

[//]: # (  <iframe src="https://player.vimeo.com/video/455887647?autoplay=1&loop=1&autopause=0&muted=1&quality=240p&background=1" frameborder="0" allow="autoplay"></iframe>)

[//]: # (</div>)

[//]: # (</div>)

[//]: # (</div>)

[//]: # ()
[//]: # (  <!-- <iframe src="https://player.vimeo.com/video/455887646?autoplay=1&loop=1&autopause=0&muted=1&quality=240p&background=1" frameborder="0" allow="autoplay"></iframe> -->)

[//]: # (<!-- <div class="embed-container embed-container-spleen"> -->)

[//]: # (<!-- </div> -->)

[//]: # ()
[//]: # (<!-- <div class="embed-container embed-container-leuk"> -->)

[//]: # (<!--   <iframe src="https://player.vimeo.com/video/455887647?autoplay=1&loop=1&autopause=0&muted=1&quality=240p&background=1" frameborder="0" allow="autoplay"></iframe> -->)

[//]: # (<!-- </div> -->)

[//]: # ()
[//]: # (<div class="jumbotron">)

[//]: # (<div class="row align-items-end">)

[//]: # (<div class="col-md-9 col-sm-12">)

[//]: # ( <h4>Targeted microcapsules for drug delivery</h4>)

[//]: # (Capsules can deliver drug payloads via the microcirculation and pulmonary system.)

[//]: # (The capsules dynamics are an important design condition in this application, which are particularly sensitive to the capsule membrane itself.)

[//]: # (I crafted kinematic stability analyses of this coupled dynamical system, including:)

[//]: # (* The first <a href="{{ site.url }}{{ site.baseurl }}/papers/bryngelson-JFM-18.pdf" target="_blank">Floquet analysis</a> of such a system, which classifies the stability without the ambiguity of empirical perturbations or experiments)

[//]: # (* <a href="{{ site.url }}{{ site.baseurl }}/papers/bryngelson-EJM-19.pdf" target="_blank">Non-modal extensions</a> of the stability analysis, enabling the prediction of rheometric flows and characterization of the capsule's mechanical properties)

[//]: # (</div>)

[//]: # (<div class="col-md-3 col-sm-12" >)

[//]: # (  <iframe src="https://player.vimeo.com/video/455887720?autoplay=1&loop=1&autopause=0&muted=1&quality=240p&background=1" height="156px" frameborder="0" allow="autoplay"></iframe>)

[//]: # (</div>)

[//]: # (</div>)

[//]: # (</div>)

