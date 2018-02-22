---
layout: post
title: OpenGL - Night vision shader
date: 2016-01-16 17:40:22.000000000 -02:00
type: post
published: true
status: publish
categories:
- dev
tags:
- academic
- Code
- nightvision
- opengl
- shader
comments: true
lang: EN
---

As I said in the <a href="https://tobiasbu.wordpress.com/2016/01/14/2015-year-in-review/" target="_blank">last post</a> in this time I want to talk about Computer Graphics.  Last year I was in a course of Architecture Graphics where I improved my knowledge on shaders. And this aspect has shown me that I have a certain passion in CG.

So I decided to make my <a href="https://tobiasbu.wordpress.com/2015/11/13/tobigl-announcing-a-framework-for-games/" target="_blank">own game framework</a> based in OpenGL 4. For the first steps that I took is start to program the basic idea of this framework solving the final activity of the CG course: **implement and understand a Night Vision shader.**

I really recommend __<a href="http://www.learnopengl.com/#!Advanced-OpenGL/Framebuffers" target="_blank">this link</a>__ to understand more about post-processing in OpenGL.

## Basic Concepts

- Post processing can also be termed as **Render to Texture** is an effect applied after a scene is rendered. This method allows to capture what is displayed on the application screen, and pass to a _texture_ using _**framebuffer object**_.

- Framebuffer is a special memory capable to storing and transferring data to the screen of a image frame. (Wikipedia)

## Post-Processing: Night Vision Effect

**Post-Processing Flow:**

Before everything we must generate a framebuffer object (FBO) and depth buffer to render a 3D scene. Then we'll need to set vertices to display the resulting texture on screen. And of course, the shader program for the post-processing effect.

1. render the whole scene in a texture (linking with the created framebuffer object);

2. render this single texture to screen;

3. apply the effect (post-processing shader);

4. unlik all buffers to the next frame.

Simple!

**NightVision - the shader program:**

These two topics did to me understand how to apply the night vision effect:

- [Quick and Dirty Night-Vision Shader: Part 1, 2 and 3](http://blog.ionoclast.com/2014/04/quick-and-dirty-night-vision-shader-part-1/){: target="_blank"}

- [Night Vision Post Processing Filter](http://www.geeks3d.com/20091009/shader-library-night-vision-post-processingfilter-glsl/)

The following (fast) statements are based on them and more details you can find in the links above.

1. The green color is dominant! We need eliminate the red and blue channels. But we will set a color proportion between the three channels: 30% red + 59% green + 11% blue = 100% <em>intensity</em>. The returned value will be the intensity of the color fragment.

{% highlight glsl %}
const vec3 proportion = vec3(0.30, 0.59, 0.11);
float intensity = dot(cor.rgb,proportion);
{% endhighlight %}

2. We can set a contrast adjustment working with the input values _intensity_ and _contrast coeficient_.

{% highlight glsl %}
intensity = clamp(contrast * (intensity - 0.5) + 0.5, 0.0,; 1.0);
{% endhighlight %}

3. Finally the green color mathematically consistent:

{% highlight glsl %}
float green = clamp(intensity / 0.59, 0.0, 1.0);
finalColor = cor * vec3(0.0,green, 0.0);
{% endhighlight %}

## Shader GLSL:

**Vertex Shader:**

{% highlight glsl %}
#version 400
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 texCoords;
out vec2 TexCoords;
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
void main()
{
gl_Position = projection * view * model * vec4(position, 1.0f);
TexCoords = texCoords;
}
{% endhighlight %}

**Fragment Shader:**

{% highlight glsl %}
#version 400
in vec2 TexCoords;
out vec3 color;
uniform sampler2D screenTexture; // frame buffer
uniform sampler2D noiseTexture; // noise texture
uniform sampler2D googleTexture; // google texture
uniform float elapsedTime; // seconds for noise effect
float contrast = 0.5;
uniform float intensityAdjust; // = 1;
uniform float noiseAmplification; // 1
uniform float bufferAmplication; // 1
<p>void main()
{
// uv coord for noise texture and swirl effect
vec2 uv;
uv.x = 0.35*sin(elapsedTime*50.0);
uv.y = 0.35*cos(elapsedTime*50.0);
// noise texture color + rotation by time
vec3 noise = texture(noiseTexture, TexCoords.st + uv).rgb * noiseAmplification;
// google mask
vec3 googleColor = texture(googleTexture, TexCoords.st).rgb;
// frame buffer + litle swirl
vec3 sceneColor = texture(screenTexture,
  TexCoords.st + (noise.xy*0.005)).rgb * bufferAmplication;
//color intensity - color dominant
const vec3 lumvec = vec3(0.30, 0.59, 0.11);
float intentisy = dot(lumvec,sceneColor);
// adjust contrast - 0...1<br />
intentisy = clamp(contrast * (intentisy - 0.5) + 0.5, 0.0, 1.0);
// final green result 0...1
float green = clamp(intentisy / 0.59, 0.0, 1.0) * intensityAdjust;
// vision color - getting green max
vec3 visionColor = vec3(0,green,0);//vec3(0.1, 0.95, 0.2);
// final color
color = (sceneColor + (noise*0.2)) * visionColor * googleColor;
}
{% endhighlight %}

## Article and Repository

[Full Repository](https://bitbucket.org/ulrichBR/archgfx)

[Article in portuguese](https://drive.google.com/open?id=0B0spb4kkmET9Q3ZrTUhjMWo3MnM")

## References

Ionoclast Laboratories, [“Quick and Dirty Night-Vision Shader: Part 1, 2 and 3”](http://blog.ionoclast.com/2014/04/quick-and-dirty-night-vision-shader-part-1/)

Learn OpenGL, [“Framebuffers”](http://www.learnopengl.com/#!Advanced-OpenGL/Framebuffers)

Geeks3D, [“Night Vision Post Processing Filter”](http://www.geeks3d.com/20091009/shader-library-night-vision-post-processingfilter-glsl/).
