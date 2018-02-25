---
layout: project
title: Raytracer
permalink: /portfolio/raytracer/
date: 2018-02-24 00:00:00.000000000 -03:00
portfolio: true
---

## Releases and Source code

## Description

The Raytracer was made for Advanced Computer Graphics Techniques class on the college. 
This project involves to create a entire system of algorithms to render three-dimensional images using the **backward Raytracing technique**.

The ray tracer is based on **light paths** as well as in the real world, simulating effects according to the objects characteristics. It's capable to generate high degree of realism, but it has a great computational cost.

## Raytracer Project

In this section 

### Workflow

### Pseudo-Code

{% pseudocode %}
Function render()
  For Each image pixel
  // Compute ray Direction for current Pixel based on the Camera;
  ray <- camera.ComputeRay();
  // Trace the computed Ray on the scene where:
  tCloser <- infinity
  objectCloser <- null

  For Each object
    If ray.Intersects(object)
        If ray distance < tCloser
            objectCloser <- Object // closer object
            tCloser <- Distance // intersection distance

  finalColor <- backgroundColor

  If objectCloser != null

    // Then with the closest intersected object
    For each Light source
        // Compute light contribution
        lightContrib <- Light.ComputeContribution(ray)
        // Compute shading of the closer object Material.
        finalColor <- objectCloser.Shading(ray, lightContrib)

    image.SetPixel(finalColor);
  Else
    // Otherwise, not object intersected.
    // Fill current pixel with background color
    image.SetPixel(finalColor);
{% endpseudocode %}


### Acceleration Structures



### Optimizing

## Features

## Code and References

## Data Sources

## Details
