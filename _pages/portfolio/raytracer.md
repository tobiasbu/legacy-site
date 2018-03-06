---
layout: project
title: Raytracer
permalink: /portfolio/raytracer/
date: 2018-02-24 00:00:00.000000000 -03:00
portfolio: true
imageGallery:
  w: 800
  h: 600
  childs:
  - caption: Standford Dragon
    img: raytracer0.png
  - caption: Happy Budha
    img: raytracer1.png
  - caption: 'Three Spheres: Phong, Relfexive and Refractory'
    img: raytracer2.png
  - caption: '1001 Spheres: Cel Shading'
    img: raytracer3.png
  - caption: 'Gooch shading with outline option'
    img: raytracer4.png
  - caption: 'Soft and Hard shadows'
    img: raytracer5.png
  - caption: 'Cube map and Texture mapping (normal and overlay)'
    img: raytracer6.png
  - caption: 'Transformations'
    img: raytracer7.png
---

Comming soon...

## Releases and Source code

{% gitbox https://github.com/tobiasbu/raytracer %}

## Description

The Raytracer was made for Advanced Computer Graphics Techniques class on the college. 
This project involves to create a entire system of algorithms to render three-dimensional images using the **backward Raytracing technique**.

The ray tracer is based on **light paths** as well as in the real world, simulating effects according to the objects characteristics. It's capable to generate high degree of realism, but it has a great computational cost.

## Raytracer Project

In this section 

### Workflow

1. Rays are traced from one observer to each pixel on a virtual screen.
2. Each ray must test intersection with scene objects
3. When intersecting with the nearest object, the color is calculated from light sources examining the object's material properties with mixing (or shading) the information to the final pixel color.
4. Reflective, refractoy or transcluded materials and also, high shadows generation will require more rays to trace.

### Pseudo-Code

The raytracer algorithm can be implemented in the following way:

{% pseudocode %}
Function render()
  For Each image pixel
  // Compute ray Direction for current Pixel based on the Camera;
  ray <- camera.Compute_Ray()
  // Trace the computed Ray on the scene where:
  tCloser <- $infinity
  objectCloser <- @null

  For Each object
    If ray.Intersects(object)
        If ray distance < tCloser
            objectCloser <- object // closer object
            tCloser <- distance // intersection distance

  finalColor <- backgroundColor

  If objectCloser != @null
    // With the closest intersected object
    // Compute light contribution for each light source in the scene.
    For Each light source  
        lightContrib <- light.Compute_Contribution(ray)
        // Compute shading of the closer object Material.
        finalColor <- objectCloser.Shading(ray, lightContrib)

    image.Set_Pixel(finalColor);
  Else
    // Otherwise, not object intersected.
    // Fill current pixel with background color
    image.Set_Pixel(finalColor);
{% endpseudocode %}


### Acceleration Structures

Depending in the scene, in overall the ray tracer algorithm is slow. 
Imagine that we want to render a scene with thousands of primitives. The traditional raytracer algorithm is very slow and unpractical.
How we can dealing with it? **Acceleration Structures** is the answer!

There is a lot of alternatives for structures. In this project I choose to implement **Boundig Box Hierarchy - BVH**.

BVH is a spatial partitioning binary tree, from _"bounding volumes"_. For each object, there is a delimiter volume that extends by forming the maximum boundaries of the object.
There are several variations and optimizations, even for real-time use. 

### Optimizing

To optimize the render routine of the raytracer there more points to consider. In this project I added the following items:

1. BVH - Surface Area Heuristics
2. Polygonal mesh sub-division
3. Parallel ray tracing

## Future Improvements

## Features

The complete list of features of the Raytracer project:

- Rendered scene preview and editing tools
    - Apply Kernel Convulation filters
    - Color tools
    - Scene Normal map, depth map and edges detection preview
- Scene file loader
- Basic Raytracer Architeture (Whitted-style) 
    - Fresnel: Reflection and Refraction
    - Point and Directional Light
    - Phong, Cel-Shading, Gooch and Two-Tones
    - Hard-shadows, Soft-Shadows (area light sampling) and fake soft-shadows
    - Anti-Aliasing (jittering method)
- Primitives
    - Plane
    - Sphere
    - Triangle
    - Mesh
    - Model Loader for Wavefront *.OBJ Loader
    - Supports Transforms
- Bounding volume hierarchy (BVH) - based on pbrt-v3
    - Surface Area Heuristics - SAH 
    - Can contain any primitives
- Texture Mapping
    - Availble Sphere, Triangle and Plane UVs
    - Normal mapping
    - Billinear and Point filter
    - Cube-map
- Filters (Kernel Convolution)
    - Laplacian, Sharpen, Unsharp-Mask, Box-Blur, Motion-Blur, Smooth-Blur, Gaussian Blur and Emboss
- Silhouette Detection using Sobel Filter
    - Using scene normal map and depth map
    - Detects only external or full edges detection
- Image tools
    - Posterize, Brightness and Contrast, Grayscale, Threshold and Invert colors
- Multi-thread raytracing 
    - Screen space division or Each line one thread

## Code and References

Some Links and other user codes that helped me during development:

- [Scrathpixel 2.0](http://www.scratchapixel.com/)
- [Computer Graphics Guide](https://computergraphicsguide.blogspot.com.br/)
- [Bounding Volume Hierarchy](http://fileadmin.cs.lth.se/cs/Education/EDAN30/lectures/S2-bvh.pdf)
- [Glavin001 / Raytracer](https://github.com/Glavin001/Raytracer)
- [flipcode](http://www.flipcode.com/)
- [pbrt-v3](https://github.com/mmp/pbrt-v3)
- [raycer](https://github.com/mikoro/raycer)
- [Rossetacode / Image convolution](https://rosettacode.org/wiki/Image_convolution)
- [songho.ca](http://www.songho.ca/index.html)
- [Sun & Black Cat](http://sunandblackcat.com/index.php?l=eng)
- [tinyobjloader](https://github.com/syoyo/tinyobjloader)
- [EuclideanSpace](http://www.euclideanspace.com/)

Websites of data and resources sources: 

- [The Stanford 3D Scanning Repository](http://graphics.stanford.edu/data/3Dscanrep/)
- [OpenGameArt.org](https://opengameart.org/)
- [John Burkardt](http://people.sc.fsu.edu/~jburkardt/index.html)
- [Bump-map a sphere with a texture map](https://stackoverflow.com/questions/32550498/bump-map-a-sphere-with-a-texture-map)

## Details

<p style="font-size:0.8em">
<strong>Version:</strong> 1.2.0<br>
<strong>Language:</strong> C/C++<br>
<strong>Purpose:</strong> Academic.<br>
<strong>Date:</strong> July-December, 2017.<br>
</p>