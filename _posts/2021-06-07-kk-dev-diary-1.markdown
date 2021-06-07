---
layout: post
title:  "Koko-Kuba - Dev Diary #1: Problemas iniciais"
date:  2021-06-07 11:00:00 -03:00
categories:
- blog
comments: true
lang: pt-BR
---
Para (re)começar minha jornada na produção do Koko-Kuba, comecei por algumas coisas bem básicas:

- jogar o jogo por completo
- avaliar o que eu já fiz 
- identificar ajustes necessários
- refazer partes fundamentais

Com isso, decidi atualizar a versão da Unity e criar um projeto do zero. O projeto atual  estava terrivelmente bagunçado e o código ilegível. Pretendo fazer migração para o novo projeto gradualmente e integrando conforme o necessário. 

É importante dizer que não pretendo refazer tudo, somente aquelas partes que são fundamentais, como o gameplay, por exemplo. É justo o gameplay por onde vou começar.

Então vamos começar para os elementos mais essenciais do jogo: as mecânicas.

{% image /posts/2021-07-04-mechanics.png "Ciclo de mecânicas do jogador, extraido do Game Design doc" %}

Escrevi essa tabela em 2015 e ainda é válido para nosso propósito. A etapa mais importante desse ciclo é o "Checa ritmo tocado", onde é feito validação do ritmo tocado pelo jogador, comparando a precisão do jogador com a batida da música do jogo. Na época, eu criei um plugin para Unity justamente para essa tarefa: o [RhythmosEngine](https://assetstore.unity.com/packages/tools/audio/rhythmos-engine-39835). 

Porém como eu atualizei a Unity, tive vários percalços devido a incompatibilidade de determinadas caracterísiticas. Logo, tive que tomar um bom tempo consertando esses defeitos e até ajustar o _skin_ da janela do editor. E ainda o código deste editor, esta horrendamente desorganizado, devido a ter feito ele em menos de uma semana e não pretendo de forma alguma ajeita-lo.

{% image_row "Tema claro e escuro. Até que ficou bonitinho" %}

  {% image /posts/2021-07-04-rhythmos_editor_light.png alt="Tema claro" %}
  {% image /posts/2021-07-04-rhythmos_editor_dark.png alt="Tema escuro" %}

{% endimage_row %}

Com este empecilho, acabei não conseguindo de fato tocar no código do jogo em si. No próxima entrada deste diário espero trazer mais coisas relacionadas a gameplay.

Até mais!