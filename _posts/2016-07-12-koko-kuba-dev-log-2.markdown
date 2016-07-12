---
layout: post
title:  "KK Devlog #2: Painéis, Desempenho e Recodificação"
date:  2016-07-12 18:20:00 -02:00
categories:
- devlog
comments: true
ogimage: kkdev1.jpg
---

![Alt Devlog]({{site.baseurl}}/img/posts/{{page.ogimage}})

Finalmente tenho mais tempo para me focar no Koko. Agora que voltei para a minha morada no **[Rio Grande do Sul](https://www.youtube.com/watch?v=4ShRH-tMX3U)** estou quase 100% ativo nele (nem tanto, se não eu morro).

Dessa vez o foco de implementações foram a **finalização da interface de usuário**, **desempenho e recodificação**.

### Novo Design do Painel

Koko-Kuba tem poucos elementos gráficos de interface. Basicamente são botões, painéis e texto.

Um dos objetivos do projeto de interface de usuário do jogo, é exibir pouco texto. Por isso os botões são ícones. Escolhi um formato *“estilo web”* devida as cores muito saturadas da palheta do jogo. Dessa forma, o usuário tem maior visibilidade dos botões, identificando-os com clareza.

Mas a questão em que estava trabalhando era o *design do painel* que é um objeto universal. Aqui embaixo tem a evolução do painel de **Carregar Jogo**, desde da versão alfa até a versão final:

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/devkk0.jpg">
<p style="font-style:italic; color:#656565; text-align: center; margin-top:0;" >Le primeiro painel</p>
</p>

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/devkk1.jpg">
<p style="font-style:italic; color:#656565; text-align: center; margin-top:0;" >Le segundo painel</p>
</p>

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/devkk2.jpg">
<p style="font-style:italic; color:#656565; text-align: center; margin-top:0;" >Le nueva, ultimate e fantastiqué painel</p>
</p>

O painel é basicamente usado também *in-game*. Para realizar a nova arte do painel, busquei referências do **grafismo dos índios tupi-guarani**, misturando a temática aquática do jogo. Eu queria criar algo semelhante a uma rocha submersa com insígnias esculpidas.

### Desempenho e Recodificação

Esse jogo nasceu dentro duma cadeira da universidade. Um semestre não é o suficiente para termina-lo. Na época, como muitos, em tempo apertado, segui pelo caminho *fast and safe* de programação:

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/got.gif">
<p style="font-style:italic; color:#656565; text-align: center; margin-top:0;" >Tá funcionando</p>
</p>

Tecnicamente falando, usei muitos **Singletons** e __instanciação de muitos, mas MUITOS, objetos *in runtime*__. Resumindo, lag, código feio e é um *shit*.

Lembro de quando era um pequeno gafanhoto, e estava lendo um livro do Bjarne Stroustrup, criador do C++ e ele diz:

> _Gosto do meu código elegante e eficiente. A lógica deve ser direta para dificultar o encobrimento de bugs, as dependências mínimas para facilitar a manutenção, o tratamento de erro completo de acordo com uma estratégia clara e o desempenho próximo do mais eficiente de modo a não incitar as pessoas a tornarem o código confuso com otimizações sorrateiras. **O código limpo faz bem apenas uma coisa.**_

É bem… falhei nesse sentido…

Mas, porém, entretanto, estamos aqui para aprender e seguir a canção.

### Singleton, uma treta a ser evitada a qualquer custo

**Singleton**, é um design pattern de programação, em que existe apenas uma única instância do objeto e pode ser acessado por qualquer um. Por exemplo, um Gerenciador de Som.

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/singleton.jpg">
<p style="font-style:italic; color:#656565; text-align: center; margin-top:0;" >Implementação mínima</p>
</p>

Pra quem programa em orientação objetos, as vezes é um saco ficar passando a referência de um objeto. Singleton burla isso facilitando o acesso do objeto. No entanto, **Singleton é uma péssima abordagem**: ([argumentos retirado desse link](http://stackoverflow.com/questions/137975/what-is-so-bad-about-singletons){:target="_blank"})

1. Sendo objeto global, ele esconde as dependências do aplicativo ao invés de exposá-las através de interfaces. Global = **[code smell](https://en.wikipedia.org/wiki/Code_smell){:target="_blank"}** (mau cheiro de código = coisa de preguiçoso)
2. Violam o **[princípio da responsabilidade única](https://en.wikipedia.org/wiki/Single_responsibility_principle){:target="_blank"}**, em virtude deles controlarem seu ciclo de vida e criação.
3. Faz com que o código fique extremamente **[acoplado](https://en.wikipedia.org/wiki/Coupling_%28computer_programming%29){:target="_blank"}**. Isso torna-os falsos em testes fazendo a parada ficar difícil.
4. Eles vivem até o término da aplicação. Mais um problema para grandes testes que são solicitados. Pode se usar muito bem testes unitários que são independente do outro.

Esses argumentos contra os Singletons fez com que eu remodelasse todo o código. Não apenas por isso, mas o jogo apresentava um bug muito esquisito quando a era fechado e acredito que um dos problemas pudesse ter haver com os fatos pontos acima. Também, odiava ver aqueles milhões de arquivos de código mau escrito.

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/bad-code-bad.jpg">
</p>

Esse **[artigo de J. B. Rainsberger](http://www.ibm.com/developerworks/library/co-single/){:target="_blank"}** apresenta dicas de como evitar os Singles e uma metodologia chamada **Toolbox**, que nada mais é que um Singleton que agrega todos os componentes que você necessita. Aqui tem um **[link de implementação na Unity](http://wiki.unity3d.com/index.php/Toolbox){:target="_blank"}**.

É estranho que não vi nenhuma discussão sobre o uso de Singletons na Unity. Nos tutoriais fornecidos pela própria Unity, eles até encorajam a utilizar os Singles.

### Instanciação de objetos em tempo real: uma cacetada de lags

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/lag_vida_real.gif">
<p style="font-style:italic; color:#656565; text-align: center; margin-top:0;" >Lag na vida real</p>
</p>

A cada vez que surgia um novo objeto durante jogo (um torpedo por exemplo), dava um __*delayizinho* chato__. O computador processa o código, alocando novos dados e botando o novo objeto no jogo. Admitindo que eu jamais tinha suspeitado de que isso torna as coisas xaropentas. Até por que, os jogos que até então eu fiz eram curtos e pequenos.

Isso atrapalha a vida do jogador, ainda mais num jogo de precisão musical.

<p style="text-align: center; margin-bottom: 0.25em; line-height:0;">
<img src="{{site.baseurl}}/img/posts/objectpoolingmikegeig.png">
</p>

**Solução:** **Pooling**, que nada mais é que uma gestao de recursos que são instanciados antes do jogo começar, a fim de maximizar vantagens ou minimizar os riscos para os usuários ([Wikipedia](https://en.wikipedia.org/wiki/Pool_(computer_science){:target="_blank"})). Quando não é necessário, eles voltam para uma fila de espera até serem necessários novamente. Para minha surpresa e noobise a **[Unity tem um tutorial sobre isso](https://unity3d.com/pt/learn/tutorials/topics/scripting/object-pooling){:target="_blank"}**.

Depois disso, nunca mais usei `GameObject.Instantiate(…);` durante uma partida.

Bem, por hoje é só. O post foi bastante técnico e espero que você tenha gostado (ou não). :)
