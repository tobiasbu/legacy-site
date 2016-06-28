---
layout: post
title:  "Devlog de Koko-Kuba"
date:  2016-06-27 09:20:00 -02:00
categories:
- devlog
comments: true
ogimage: kkdev0.jpg
---

![Alt Devlog]({{site.baseurl}}/img/posts/{{page.ogimage}})

Depois de muito tempo sem abrir o “aquário”, voltei no desenvolvimento do Koko-Kuba.

Eu não havia abandonado esse projeto, mas eu precisava de um tempo para outras demandas que captavam meu tempo.
Desde que comecei o dev-diary, ainda no antigo blog, poucas alterações tinham sido feitas até então.

Em resumo, o que basicamente foi feito: **testagem de *builds* para Android** e implementação de *juicy effects* para interface do jogo.

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/4283114.jpg">
<p style="font-style:italic; color:#656565; text-align: center; margin-top:0;" >Nova vibe</p>
</p>

### Mobile e suas tretas:

Primeiramente imaginei que não ia funcionar. E bem, funcionou!

Para o porte Mobile, criei um símbolo `#define MOBILE`, adaptando todo o código, como por exemplo, a remoção de coisas que não fazem sentido (como inputs de teclado e controle). Para telas muito pequenas `(largura < 560px)`, tive que alterar a escala de várias objetos o que resultou o **dobro do trabalho**.

Outro aspecto lento e importante , é a compressão de assets. O primeiro build para o Android que eu fiz, sem nenhuma dessas “tretas” listada acima, o jogo pesava **134 MB**. Removi alguns arquivos em desuso foi para *94 MB*. Com a compressão foi, para **74 MB**. A meta é chegar pelo menos no 60 MB ou abaixo ([e dobrar a meta](https://www.youtube.com/watch?v=Y1NfRN4D7NE){:target="_blank"}).

Eu vendo os peixes no meu Motorola:

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/dwight.gif">
<p style="font-style:italic; color:#656565; text-align: center; margin-top:0;" >Eu fiquei uns três dias assim</p>
</p>

### Interface suculenta:

As animações do botões do jogo me incomodavam. Ou qualquer elemento da interface tava muito *duro* e *“triste”*. Em um jogo *for fun*, os botoes e a interface em geral, tem que ter esse *~ease~* e "não tapa na cara". Aqui o antes e depois:

<div class="block" style="display:block;">
<div class="centered">
  <img src="{{site.baseurl}}/img/posts/kkbutton.gif">
  <p style="font-style:italic; color:#656565;" >Ontem</p>
  </div>

<div class="centered">
<img src="{{site.baseurl}}/img/posts/kkbutton0.gif">
  <p style="font-style:italic; color:#656565;" >Hoje</p>
  </div>
</div>

Está sendo incluindo vários outros elementos e **“purpurinas”** no jogo. Esse incremento, apesar de serem detalhes pequenos, fazem enorme diferença, ficando mais amigável e *juicy*.

Eu encontrei esse fabuloso **[link](http://robertpenner.com/easing/){:target="_blank"}**, dum cara chamado **Robert Penner**, que criou um apanhado de funções de interpolação, dando “sabor” ao movimento das coisas.

E para terminar, aqui vai uma lista de tarefas prontas:

### Lista completa de implementações PRONTAS (e bonitas):

- Auto detecção de idioma (inglês ou português)
- Teste build para Android 1 (sem nenhum alteração)
- Novo botão suculento
- Retirado uma "penca" de imagens sem uso
- Compressão de imagens para mobile
- Créditos do jogo refeito
- Tela do mapa adaptado e refeito para o Mobile
- Nova tela de logos dos parceiros, dando mais destaque a cada um deles
- Varias imagens foram redimensionadas em função de telas muito pequenas
- Teste build para Android 2 e 3 (com todas essas alterações)

A próxima etapa, é terminar a tela de carregamento do jogo e partir para o principal: **alterações in-game**!
