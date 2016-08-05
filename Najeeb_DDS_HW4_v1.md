# Doing Data Science, HomeWork Week 4: Bootstrap Showing CLT
Najeeb Zaidi  
August 5, 2016  
<script src="https://cdn.datacamp.com/datacamp-light-latest.min.js"></script>

---
title: "Doing Data Science, HomeWork Week 4: Bootstrap Showing CLT"
author: "Najeeb Zaidi"
date: "August 5, 2016"
output: 
  html_document: 
    keep_md: yes
    theme: spacelab
---

dc_light_exercise_bootstarp

```
## character(0)
```

```
## [1] "C:/Users/najee/Documents/R/MSDS6306-W4-HW"
```

```
## 
## Welcome to googleVis version 0.5.10
## 
## Please read the Google API Terms of Use
## before you start using the package:
## https://developers.google.com/terms/
## 
## Note, the plot method of googleVis will by default use
## the standard browser to display its output.
## 
## See the googleVis package vignettes for more details,
## or visit http://github.com/mages/googleVis.
## 
## To suppress this message use:
## suppressPackageStartupMessages(library(googleVis))
```
_Note: we could hide this chunk by adding include=FALSE, echo=FALSE in the first line_


# Introduction
In this presentation, we attempt to illustrate the Central Limit Theorem using the Bootstrap Method or Simulation Method on a sample data set.

We also describe the advantage of using this technique when compared to other methods .

This HTML uses DataCamp Interactive to display the R code used and is the improved version of plain text file presented earlier.

## Central Limit Theorem (CLT)
[describe]

## Bootstrap / Simulation Method
[describe]

## Illustrations

The first illustration below uses the Parametric Bootstrap.
We use a random sample of x & y observations and define the number of simulations as well as set the seed to ensure results are replicated at a later stage:





The Histogram plot of simulated mean differences looks like this:






