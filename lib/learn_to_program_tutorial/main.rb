module Main
  #
  #  MAIN PAGE GENERATION
  #
  
  def generate
    srand
    chapNum   = @cgi.params['Chapter'][0]
    chapter   = @chapters[chapNum]
    chapTitle = 'Aprendendo a Programar, por Chris Pine'
    if chapter
      chapTitle = chapNum + '.&nbsp;&nbsp;' if chapNum < 'A'
      chapTitle.sub! /^0/, ''
      chapTitle += chapter[0]
    end
    
    puts '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">'
    html(:lang=>'pt_br') do
      head do
        meta('http-equiv'=>"Content-Type", :content=>"text/html; charset=utf-8")
      	
        link(:href=>LINKADDR+'stylesheets/pine.css', :rel=>'Stylesheet', :type=>'text/css', :media=>'screen')
        link(:href=>LINKADDR+'stylesheets/tutorial.css', :rel=>'Stylesheet', :type=>'text/css', :media=>'screen')
        title { chapTitle }
        script(:language=>'JavaScript', :src=>'http://www.gvisit.com/record.php?sid=6941c11eba5c874197e2096f9c854106', :type=>'text/javascript') {}
      end # head
      body do
      div(:id=>'pageWidth') do
        div(:id=>'headerBar') do
          div(:id=>'titlePicContainer') do
            puts '<a href="'+LINKADDR+'">'
            img(:id=>'titlePic', :width=>'418', :height=>'108', :src=>'images/titleLTP.gif', :alt=>'Aprendendo a Programar')
            puts '</a>'
          end
          puts '<a href="'+LINKADDR+'index.rb">'
          puts '  <img id="locket" width="82" height="82" alt="apenas uma figura bonitinha"'
          puts '    src="images/locketLTP.png" />'
          puts '</a>'
        end
        div(:id=>'menuPane') do
          img(:id=>'menuSpearTop', :width=>'35', :height=>'38', :src=>'images/spearup_sm.gif')
          
          menuBookLink
          
          img(:width=>'64', :height=>'21', :style=>'padding: 30px;', :src=>'images/swirly.gif')
          
          menuTOC
          
          img(:id=>'menuSpearBottom', :width=>'36', :height=>'40', :src=>'images/speardown_sm.gif')
        end
        div(:id=>'contentPane') do
          if chapter
            h1 {chapTitle}
            puts HLINE
            method(chapter[1]).call
          else # TOC
            h2 { 'Um lugar para o futuro programador começar' }
            para do <<-END_PARAGRAPH
              Eu acho que tudo isso começou em 2002. Eu estava pensando
              em ensinar programação, e como uma grande linguagem como
              Ruby seria ótima para aprender a como programar.  Quer dizer, nós estávamos
              todos excitados com Ruby pelo seu poder, elegância e por ser realmente divertido,
              mas me pareceu que ele também seria um excelente guia para aprender a programar.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Infelizmente, não havia muita documentação sobre Ruby
              destinada aos iniciantes naquela época. Alguns de nós,
              na comunidade, estávamos falando sobre como um tutorial 
              "Ruby for the Nuby" era necessário,
              e, mais genericamente, um tutorial ensinando a programar, como um todo.
              Quanto mais eu pensava nisso, mais eu tinha a dizer (o que me surpreendeu
              um pouco). Até que alguém finalmente disse: "Chris, porque você
              não escreve um tutorial ao invés de ficar falando sobre isso?".
              Então eu o fiz.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              E isso não foi muito bom. Eu tive todas essas boas idéias que eram boas
              <em>em teoria</em>, mas a real tarefa de fazer um grande tutorial
              para não-programadores foi muito mais desafiadora
              do que eu poderia prever. (Quer dizer, pareciam boas para mim, mas eu já
              sabia como programar.)
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              O que me salvou foi que eu fiz com que fosse fácil para as pessoas
              falarem comigo, e eu sempre tentei ajudar as pessoas quando elas empacavam.
              Quando eu via um monte de gente empacando em uma parte,
              eu a reescrevia. Isso deu muito trabalho, mas lentamente foi se tornando melhor
              e melhor.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Alguns anos depois, isso estava ficando realmente bom.  :-) Tão bom,
              na verdade, que eu já estava pronto para anunciar sua finalização e
              partir para outra coisa. E justamente nesse instante houve a
              oportunidade de transformar esse tutorial em um livro. Uma vez que o básico
              já estava pronto, eu achei que não haveria maiores problemas.
              Eu apenas precisaria esclarecer umas coisas, adicionar alguns exercícios extras,
              talvez mais alguns exemplos, um pouquinho mais de capítulos, enviar ele para
              uns 50 revisores...
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Isso me tomou outro ano, mas agora eu acho que está realmente
              <em>muito</em> bom, grande parte graças às centenas
              de boas almas que me ajudaram a escrever este livro.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              O que está nesse site é o tutorial original, quase inalterado
              desde 2004. Para o melhor e mais atualizado, você pode
              querer dar uma olhada <a href="#{FRLTP_ADDR}">no livro</a>.
              END_PARAGRAPH
            end
            puts HLINE
            h2 { 'Notas Para Professores' }
            para do <<-END_PARAGRAPH
              Há algumas normas de conduta que eu tentei seguir.
              Eu acho que elas tornam o processo de aprendizado muito mais suave;
              ensinar a programar já é difícil por si só. Se você está
              ensinando ou guiando alguém pelas vias hackers, essas idéias podem lhe ajudar também.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Primeiramente, eu tentei separar os conceitos o máximo possível,
              assim o estudante tem que aprender apenas um conceito de cada vez.
              Isso foi difícil no começo, mas um <em>pouco</em> mais fácil
              depois que eu peguei a prática. Algumas coisas devem ser faladas
              antes de outras, mas eu fiquei impressionado com quão pouca
              hierarquia de precedência realmente existe. Eventualmente, eu apenas tive que
              seguir uma ordem, e eu tentei arrumar as coisas de tal maneira
              que cada nova seção fosse motivada pela anterior.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Outro princípio que eu tinha em mente era de ensinar apenas uma maneira
              de fazer alguma coisa. Isso é um benefício óbvio em um tutorial
              para pessoas que nunca programaram antes. Por um motivo:
              é mais fácil aprender uma maneira de fazer uma coisa do que duas. Porém
              o benefício mais importante é que quanto menos coisas você
              ensinar a um novo programador, mais criativo e esperto
              ele tem que ser na programação. Já que muito da programação
              é resolução de problemas, torna-se crucial o encorajamento em todos os estágios
              possíveis.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Eu tentei traçar um paralelo entre os conceitos de programação
              com os conceitos que um novo programador já possui;
              para apresentar as idéias de uma maneira que o entendimento seja
              intuitivo, ao invés do tutorial despejar apenas informações.
              Programação Orientada a Objetos faz isso, por si só, muito bem.
              Eu fui capaz de me referir a "objetos" e diferentes "tipos de objetos"
              muito rapidamente nesse tutorial, soltando tais informações nos mais
              inocentes momentos. Eu não falei nada do tipo "tudo em Ruby é um objeto"
              ou "números e strings são tipos de objetos", porque essas
              coisas não dizem nada para um novo programador. Ao invés disso,
              eu vou falar sobre strings (e não sobre "objetos do tipo string"),
              e algumas vezes eu vou me referir a "objetos", apenas no sentido de "as coisas
              nesses programas". O fato de que todas essas <em>coisas</em> em Ruby <em>são</em>
              objetos fez com que esse tipo de inconsistência da minha parte funcionasse tão bem.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Sobretudo, eu procurei fugir do jargão desnecessário da
              OO, eu procurei ter certeza de que, se eles têm de aprender
              uma palavra, que aprendam a certa (Eu não quero que eles
              tenham de aprender em duplicidade, certo?). Então, eu chamei
              tudo de "strings", e não "texto". Métodos precisam ser chamados
              de alguma coisa, então eu os chamei de métodos.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              A medida que os exercícios foram sendo concebidos, eu achei
              que estava com bons exercícios, mas você nunca pode colocar
              exercícios demais. Honestamente, eu acho que eu gastei quase
              metade do meu tempo apenas tentando fazer exercícios divertidos
              e interessantes. Exercícios entediantes apenas aniquilam qualquer
              desejo de programar, enquanto que o exercício perfeito cria
              aquela coceira no programador novo que ele não consegue ficar sem
              coçar. Resumindo, não gaste muito tempo tentando fazer exercícios bons.
              END_PARAGRAPH
            end
            puts HLINE
            h2 { 'Sobre o Tutorial Original' }
            para do <<-END_PARAGRAPH
              As páginas do tutorial (esta página, inclusive) são geradas por um
              <a href="#{LINKADDR}?ShowTutorialCode=true">grande programa em Ruby</a>,
              claro. :-)
              Assim, elas possuem recursos elegantes. Por exemplo, todos os
              exemplos de código são realmente executados toda vez que você
              vê a página, e a saída dos mesmos é a saída que eles geram.
              Eu acredito que essa é a maneira mais fácil, melhor e, certamente, a
              mais legal de ter certeza que todo o código mostrado
              funciona <em>exatamente</em> como eu digo que funciona.
              Você não precisa se preocupar com a possibilidade de eu ter copiado
              a saída de um exemplo erroneamente ou esquecido de testar um código:
              tudo é testado na hora que você vê. Então, na seção de geradores de
              números aleatórios, você vai ver que os números mudam sempre... <em>lindo</em>.
              (Eu usei um truque parecido na hora de escrever o livro, mas é óbvio que isso
              é muito mais aparente aqui no tutorial.)
              END_PARAGRAPH
            end
            para do
              '<a href="http://ruby-lang.org">'+
                '<img src="images/PoweredByRuby.png" alt="powered by Ruby" width="234" height="60" />'+
              '</a>'
            end
            puts HLINE
            h2 { 'Agradecimentos' }
            para do <<-END_PARAGRAPH
              Finalizando, eu gostaria de agradecer a todos da lista ruby-talk
              por suas idéis e pelo encorajamento, aos meus maravilhosos
              revisores, por sua ajuda em fazer o livro muito melhor do que
              eu poderia fazer sozinho, especialmente à minha querida esposa,
              por ser minha principal revisora/testadora/porquinho-da-índia/musa, ao Matz,
              por ter criado essa fabulosa linguagem, e aos Pragmatic Programmers, por
              me falar sobre a linguagem&mdash;e, é claro, por publicar meu livro!
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Se você notar qualquer erro ou falha de digitação, se tiver
              qualquer comentário ou sugestão, ou um bom exercício que eu possa
              incluir, por favor <a href="mailto:chris@pine.fm">me avise</a>.
              END_PARAGRAPH
            end
          end
          
          puts HLINE
          para(:style=>'padding-bottom: 20px;') { "&copy; 2003-#{Time.now.year} Chris Pine" }
        end # contentPane
      end # pageWidth
      end # body
    end # html
  end
end
