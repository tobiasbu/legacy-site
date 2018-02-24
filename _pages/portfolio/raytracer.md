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

ForEach image pixel

    Compute ray Direction for current Pixel based on the Camera;
    Trace the computed Ray on the Scene where:

        tCloser <- Infinity
        objectCloser <- NULL

        ForEach Object
            If ray Intersects Object
                If ray Distance < tCloser
                    objectCloser <- Object 
                    tCloser <- Distance // intersection distance
                End If
            End If
        End ForEach

        finalColor <- Black OR Background Color

        If objectCloser != NULL
            For each Light source

                // Compute light contribution
                lightContrib <- Light.ComputeContribution(ray)

                // Compute shading of the closer object Material.
                finalColor <- objectCloser.Shading(ray, lightContrib)

            End ForEach

            // Fill current pixel to finalColor
            Image.SetPixel(finalColor);
        Else
            // Fill current pixel with background color
             Image.SetPixel(finalColor);
        End If

End ForEach
{% endpseudocode %}


### Acceleration Structures



### Optimizing

## Features

## Code and References

## Data Sources

## Details
