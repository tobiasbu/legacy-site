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

~~~
For each Image pixel

    Compute ray Direction for current Pixel based on the Camera;
    Trace the computed Ray on the Scene where:

        Initialize tCloser to Infinity
        Initialize objectCloser to NULL

        For each Object
            If the Ray intersect Object
                If Ray distance is below to tCloser
                    Set objectCloser to current Object
                    Set tCloser to intersection distance
                End If
            End If
        End ForEach

        Initialize finalColor to Black OR Background Color

        If objectCloser is not equal NULL
            For each Light source
                Compute Light contribution
                Compute Shade contribution of the closer Object Material and Light contribution.
                Add contributions to finalColor
            End ForEach

            Fill current pixel to finalColor
        Else
            Fill current pixel with Background color
        End If

End ForEach
~~~


### Acceleration Structures



### Optimizing

## Features

## Code and References

## Data Sources

## Details
