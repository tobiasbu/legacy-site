---
layout: post
title: "KK Off-topic: Estendendo a Unity"
date:  2016-07-24 15:30:00 -02:00
categories:
- devlog
comments: true
ogimage: kkdev2.jpg
---

![Alt Devlog]({{site.baseurl}}/img/posts/{{page.ogimage}})

No dia 16/07/2016, eu estive presente no **PAIN**, encontro de desenvolvedores de jogos independentes de Porto Alegre. Além de ter
a fabulosa palestra do game designer **Felipe Dal Molin** da **[Aquiris Game Studio](http://www.aquiris.com.br/?lang=pt_BR){:target="_blank"}**, foram expostos jogos para play-tests. E é claro, Koko-Kuba esteve lá.
Os feedbacks foram extremamente positivos. Fiquei muito contente com críticas, sugestões e sobretudo, com o pessoal que jogou de cabo a rabo o jogo.

Chamou a minha atenção em que algumas pessoas ficaram interresados no processo de criação do jogo. Não vou falar agora de tópicos de game design, GDD ou coisas semelhantes (quem sabe em algum próximo post). Mas sim, falar das estensões em que **Unity** permite implementar. Também não vou defender a qualidade, produtividade ou qualquer coisa que seja de X engine ou Y engine porém, quero mostrar que o jogo depende de **estensões**, que permitem uma facilidade enorme em sua criação.

### A Unity

Confesso que eu não gostava da Unity. O motivo bem simples: não tive boa experiência com ela em uma **Global Game Jam**. Apesar de que eu ter assumido o papel de artista naquela vez, eu programei um pouco para apurar a criação na jam. O resultado não foi muito bacana.

Entretanto, **as coisas mudam**. Eu comecei a usar Unity no modo *hard* com o desenvolvimento do Koko-Kuba. Aprendi a ama-la assim como gosto do Game Maker ou fazer um jogo em Javascript ou C++ *from scratch*.

Unity foi feita para estender e isso é o grande ponto positivo dela e também negativo, pelo fato de em certos casos, ser necessário perder tempo criando ou comprar estensões na **[Unity Asset Store](https://www.assetstore.unity3d.com/){:target="_blank"}**. O projeto do Koko-Kuba tá recheado de estensões para facilitar a minha vida na hora de compor fases.
A seguir, gostaria de apresentar algumas dessas **estensões que criei**.

### Rhythmos Engine

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img style="max-width: 75%;" src="{{site.baseurl}}/img/posts/kkRhythmos.jpg">
</p>

**[Rhythmos Engine](http://localhost:4000/website/portfolio/rhythmos-engine/){:target="_blank"}** foi criado junto com jogo desde o inicio. Trata-se de uma simples aplicação dentro da Unity para criação de ritmos para jogos. Sem dúvida, a Rhythmos é de enorme importância para um jogo de música. Eu lancei ele na **[Unity Asset Store](https://www.assetstore.unity3d.com/en/#!/content/39835){:target="_blank"}**.

### KK Balancing Level Tool

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/kkBalanceamento.jpg">
</p>

Para balanceamento do jogo, essa ferramenta reúne todos os dados de cada play-test, mostrando cada ação dos jogadores, desempenho, média geral de todos os atributos e apresenta um gráfico com ações positivas e negativas dos jogadores X tempo de gameplay. A função dessa ferramenta é facilitar o ajuste de level design de cada fase do jogo, o que é uma tarefa que envolve muito trabalho.

### Muitos, mas muitos, custom Inspectors

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/kkInspectors.jpg">
</p>

A Unity é baseado em *GameObjects* que contém componentes. Cada componente possui um *Inspector*, que nada mais é que uma exibição de atributos. É uma forma legal de alterar variaveis daquele elemento especifico. Mas existem certas circustâncias que nem sempre a Unity vai suprir com todas as demandas de primitivas, objetos, ou até deixando a exibição feia. Por isso, a Unity possibilita criar inspectors alternativos. Eu usei muita parte do desenvolvimento criando esses inspectors com a simples finalidade de deixar tudo mais prático.

### Custom Particle System

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/kkParticleSys.jpg">
</p>

Afim de obter maior controle em alguns efeitos especias, criei meu próprio sistema simples com utilização de *Sprites*. Possui custom Inspector + exibição do resultado na cena de edição.

### Custom Tile System

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/kkTileSystem.jpg">
</p>

Exibição de gizmos na cena para edição de níveis. :)

E para terminar, **você pode estar fazendo o seguinte questionamento:**

### Por que raios vou perder tempo estendendo a Unity, fazendo esses tais de Inspector e todas essas paradas?

Resposta simples: **Unity foi feita para estender**. Além de que na hora de produzir o seu jogo, **vai diminuir considerávelmente** o tempo de criar fases ou qualquer aspecto que seja. Faz com que você também **entenda como a engine funciona**, assim você pode criar **soluções melhores de código**. Estender a Unity te permite **criar soluções genéricas** para seus jogos, até podendo entrar em outro nicho de mercado que é **Unity Asset Store**.

Espero que tenham gostado desse off-topic! Nos vemos por aí! :)
