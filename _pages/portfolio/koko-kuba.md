---
layout: project
title: Koko-Kuba
permalink: /portfolio/koko-kuba/
date: 2013-12-13 18:15:43.000000000 -02:00
portfolio: true
logo: logo_kk.png
imageGallery:
  w: 814
  h: 452
  childs:
  - caption: teste
    img: screen_kk0.png
  - caption: teste
    img: screen_kk1.png
  - caption: teste
    img: screen_kk2.png
  - caption: teste
    img: screen_kk3.png
---
 <span/>

##  _“Best Game in all categories”_
{: style="text-align: center; margin-top: 1.5em;" :}

— Exhibition Games of _“I Semana Atômica – UNISINOS”._
{: style="text-align:right;font-size:0.8em; margin-bottom: 3em;" :}

**Check-out the Facebook page:**
{: style="text-align: center" :}

<div class="fb">
<div class="fb-page" data-href="https://www.facebook.com/KokoKubaGame" data-width="500" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/KokoKubaGame" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/KokoKubaGame">Koko-Kuba</a></blockquote></div>
</div>

_**This game is under development.**_
{: style="text-align: center" :}

KokoKuba is a rhythmic game where a tribe of fish, moved by music, must go to the dark seas and battle against tritons.

## Partners:

<div class="block" >

{% for i in (0..2) %}

  {% assign ext = ".png" %}
  {% assign link = "https://www.facebook.com/Ampli-Studio-145663258806718" %}
  {% assign styli = "float: left; margin-right: 1%;" %}

    {% if i == 1 %}
        {% assign ext = ".jpg" %}
        {% assign link = "http://ideiaavista.com.br/" %}
    {% elsif i == 2 %}
        {% assign link = "https://www.facebook.com/Eduardo-Luiz-Beise-Ulrich-503570766455890" %}
        {% assign styli = "float: left; margin-right: 0%;" %}
    {% endif %}

  {% capture fname %}partner_logo{{forloop.index0}}{{ext}}{% endcapture %}


  <div class="centered" style="width:32%;">
  <a href="{{ link }}" target="_blank">
    <img src="{{ site.baseurl }}/img/portfolio/{{fname}}">

    </a>
  </div>


{% endfor %}

</div>



## Details:
<p style="font-size:0.8em">
<strong>Genre:</strong> Rhythmic.<br>
<strong>Engine:</strong> Unity.<br>
</p>
