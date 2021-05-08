---
layout: post
title: Iniciando um DevDiary de Koko-Kuba
date: 2015-10-31 16:18:24.000000000 -02:00
type: post
published: true
status: publish
categories:
- blog
tags:
- devdiary
- koko-kuba
comments: true
lang: pt-BR
---
<p>Depois de um longo período de pausa, volto ao desenvolvimento do Koko-Kuba. O inicio de seu desenvolvimento se deu a partir de uma cadeira na universidade, em fevereiro até julho deste ano. Para quem não conhece o projeto, irei explica-lo a cada post.</p>

## Contextualização:

{% image /posts/kk-conceitual.png %}

<p>A cadeira de Projetos de Motores: Motores para Jogos, foi uma das cadeiras mais interessantes que cursei, em minha opinião. Ela permite aos estudantes uma liberdade de criação, assim como uma enorme compreensão de cada passo da criação de um jogo. Exigia também que o jogo se caracterize como um produto sólido, ou seja, no fim da cadeira, um jogo que pode ser "lançado ao mercado". E com esse último aspecto, percebi então que podia criar um jogo do zero e finalmente ser completado pois, isso é difícil de acontecer durante a graduação. Assim nasce o Koko-Kuba.</p>
<p>Bem, o Koko-Kuba não ficou exatamente pronto. Por que a real é que eu sou um perfeccionista do <em>caralho</em>. Gosto de que cada pixel esteja no seu devido lugar. Cada purpurina tenha sua razão de existência. E que muitos feedbacks sejam necessários para atender os jogadores. Eu chamo isso pessoalmente de Síndrome de Phill Fish (nada contra ele).  Mas essa minha neurose quanto ao que mais gosto de fazer. E é por isso, que também não fiz nenhum lançamento ao público.</p>

## DevDiary:

<p>Deixando o papo de lado, iniciarei um <em>Dev Diary</em> (diário de desenvolvedor) da fase final do Koko-Kuba. Por quê um Dev Diary? Eu não sei como isso funciona. Mas eu preciso de uma aliança de compromisso, e essa foi uma das maneiras que me comprometo em finalizar esse jogo. E também acho que o público pode ter maior noção e envolvimento na sua criação. Para isso, listei várias elementos que devem ser implementados e algumas especificações. Essa lista é mutável, pode aumentar ou diminuir, dependendo da vulnerabilidade de meus perfeccionismos.</p>

## Lista de implementação: [FASE FINAL]

<ul>
<li><strong>Melhorias de movimentação do Pajé e sua tribo</strong>: tem um pequeno<em> glitch</em> quando o pajé para de de se movimentar. Isso devido o cálculo permanente de senoide.  O movimento do pajé é pré-calculado e o senoide entra ali pra atrapalhar.</li>
<li><strong>Animação para o Pajé: </strong>um feedback precioso que recebi foi que o Pajé que é representação do jogador no mundo, está muito estático. Falta animações para torna-lo mais vivo.<strong><br />
</strong></li>
<li><strong>Outras propostas de gameplay: </strong>não é um novo modo de jogo mas sim, fases com pequenas alterações da mecânica. Por exemplo, <em>scroller</em> automático e ambientes com fog.</li>
<li><strong>Rede de pesca, poluições, navios e barcos: </strong>novos elemento para atrapalhar a vida do jogador.<strong><br />
</strong></li>
<li><strong>Novas fases: </strong>a versão que esteve distribuída em eventos para o público tinha poucas fases. A ideia é que se tenha 5 fases por mundo, totalizando 20 fases.<strong><br />
</strong></li>
<li><strong>Correção de bug na tela de mapas: </strong>tem um bug que me irrita, é só isso.<strong><br />
</strong></li>
<li><strong>Melhoria no arquivo de salvamento: </strong>acho que o bug acima é devido esse cara chamado <em>save slot</em>.<strong><br />
</strong></li>
<li><strong>Opção de apagar slot: </strong>faltou...<strong><br />
</strong></li>
<li><strong>Diversos minis bugs: </strong>durante alguns playtests em exposições que eu fiz, vi vários bugs e glitches que devem ser corrigidos.</li>
<li><strong>Novo botão para tela inicial - Opções: </strong>trocar opções como idioma, resolução, e afins. <em>Facilitar a vida do usuário</em>.<strong><br />
</strong></li>
<li><strong>Botões com movimentos suaves: </strong>eu não to curtindo a forma de como o botão é ativado. Muito "tapa na cara". Penso em algo suave... como a brisa do mar em dias calmos.<strong><br />
</strong></li>
<li><strong>Músicas: </strong>isso vai depender da disponibilidade do músico. Mas já tenho duas músicas novas para deixar o jogo variado.<strong><br />
</strong></li>
<li><strong>Artes: </strong>o mesmo motivo acima para o artista.<strong><br />
</strong></li>
<li><strong>Sons:</strong> novamente os motivos acima para o estúdio de som.</li>
<li><strong>Cutscenes: </strong>isso realmente falta. O jogo tem uma história só no papel entretanto, durante o jogo não tem nenhuma contextualização. Até por que, um dos  feedbacks dizia sobe nomes dos lugares do mapa. Necessário explicar por que disso tudo nas cutscenes.<strong><br />
</strong></li>
<li><strong>Idioma Inglês: </strong>"pros" gringos.<strong>  </strong>:P<strong><br />
</strong></li>
<li><strong>Build para Android: </strong>nunca fiz um jogo para Android, ainda mais na Unity. Isso vai ser um baita desafio. Mas tá no GDD desde o principio dos tempos.<strong><br />
</strong></li>
</ul>
<p>Você leitor pode me ajudar nessa empreitada, basta comentar e dizer suas impressões, do que falta, o que pode melhorar e qualquer consideração que você queira fazer.</p>
<p>E agora, mãos a obra! :D</p>
