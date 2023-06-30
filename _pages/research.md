---
title: "Research"
layout: gridlay
sitemap: false
permalink: /research/
---
# Research

#### Research Interests

Computer Vision, Machine (Deep) learning and Artificial Intelligence.

#### Current Research Focus

Probabilistic Graphical Models, Tractable Machine Learning, Deep Learning, Combining Deep Learning and Graphical Models

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
