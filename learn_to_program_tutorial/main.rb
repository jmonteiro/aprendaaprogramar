module Main
  #
  #  MAIN PAGE GENERATION
  #
  
  def generate
    srand
    chapNum   = @cgi.params['Chapter'][0]
    chapter   = @chapters[chapNum]
    chapTitle = 'Learn to Program, by Chris Pine'
    if chapter
      chapTitle = chapNum + '.&nbsp;&nbsp;' if chapNum < 'A'
      chapTitle.sub! /^0/, ''
      chapTitle += chapter[0]
    end
    
    puts '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">'
    html(:lang=>'en') do
      head do
        link(:href=>'/stylesheets/pine.css', :rel=>'Stylesheet', :type=>'text/css', :media=>'screen')
        link(:href=>LINKADDR+'tutorial.css', :rel=>'Stylesheet', :type=>'text/css', :media=>'screen')
        title { chapTitle }
        script(:language=>'JavaScript', :src=>'http://www.gvisit.com/record.php?sid=6941c11eba5c874197e2096f9c854106', :type=>'text/javascript') {}
      end # head
      body do
      div(:id=>'pageWidth') do
        div(:id=>'headerBar') do
          div(:id=>'titlePicContainer') do
            puts '<a href="'+LINKADDR+'">'
            img(:id=>'titlePic', :width=>'418', :height=>'108', :src=>'/images/titleLTP.gif', :alt=>'Learn to Program')
            puts '</a>'
          end
          puts '<a href="'+LINKADDR+'">'
          puts '  <img id="locket" width="82" height="82" alt="just a cute picture"'
          puts '    src="/images/locketLTP.png" />'
          puts '</a>'
        end
        div(:id=>'menuPane') do
          img(:id=>'menuSpearTop', :width=>'35', :height=>'38', :src=>'/images/spearup_sm.gif')
          
          menuBookLink
          
          img(:width=>'64', :height=>'21', :style=>'padding: 30px;', :src=>'/images/swirly.gif')
          
          menuTOC
          
          img(:id=>'menuSpearBottom', :width=>'36', :height=>'40', :src=>'/images/speardown_sm.gif')
        end
        div(:id=>'contentPane') do
          if chapter
            h1 {chapTitle}
            puts @@HLINE
            method(chapter[1]).call
          else # TOC
            h2 { 'Um lugar para o futuro programador começar' }
            para do <<-END_PARAGRAPH
              Eu acho que tudo isso começou em 2002. Eu estava pensando
              em ensinar programação, e como uma grande linguagem como
              Ruby seria ótima para aprender a como programar.  Quer dizer, nós estávamos
              todos excitados com Ruby pelo seu poder, elegância e por ser realmente divertido,
              mas me pareceu que ele seria, também um excelente guia para aprender a programar.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Infelizmente, não havia muita documentação sobre Ruby
              destinada aos iniciantes, naquela época. Alguns de nós,
              na comunidade, estávamos falando sobre como um tutorial 
              "Ruby for the Nuby" era necessário,
              e, mais genéricamente, um tutorial ensinando a programar, como um todo.
              Quanto mais eu pensava nisso, mais eu tinha a dizer (o que me surpreendeu
              um pouco). Atá que alguém finalmente disse: "Chris, porque você
              não escreve um tutorial ao invés de ficar falando sobre isso?".
              Então eu o fiz.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              E isso não foi muito bom. Eu tive todas essas boas idéias que eram boas
              <em>em teoria</em>, mas a atual tarefa de fazer um grande tutorial
              para não-programadores foi muito mais desafiador
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
              Um par de anos depois, isso estava ficando realmente bom.  :-) Táo bom,
              na verdade, que eu já estava pronto para anunciar sua finalização, e
              partir para outra coisa. E justamente nesse instante houve a
              oportunidade de transformar esse tutorial em um livro. Uma vez que o básico
              já estava pronto, eu achei que não haveria maiores problemas.
              I apenas precisaria clarificar umas coisas, adicionar alguns exercícios a mais, talvez
              alguns exemplos a mais, um pouquinho mais de capítulos, enviar ele para uns 50 revisores...
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Isso me tomou outro ano, mas agora eu acho que está realmente
              <em>muito</em> bom, grande parte graças as centenas
              de boas almas que me ajudaram a escrever esse livro.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              O que está nesse site é o tutorial original, quase inalterado
              desde 2004. Para o melhor e mais atualizado, você poderá
              querer dar uma olhada <a href="#{FRLTP_ADDR}">no livro</a>.
              END_PARAGRAPH
            end
            puts @@HLINE
            h2 { 'Notas Para Professores' }
            para do <<-END_PARAGRAPH
              Há algumas normas de conduta que eu tentei seguir.
              Eu acho que elas tornam o processo de aprendizado muito mais suave;
              ensinar a programar já é difícil por si só. Se você está
              ensinando ou guiando alguém pelas vias hakcers, essas idéias podem lhe ajudar também.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Primeiramente, eu tentei separar os conceitos o máximo possível,
              assim o estudante tem que aprender apenas um conceito de cada vez.
              Isso foi difícil no começo, mas um <em>pouco</em> mais fácil
              depois que eu peguei a prática. Algumas coisas devem ser faladas
              antes de outras, but I was amazed at how little of
              a precedence hierarchy there really is. Eventualmente, eu apenas tive que
              seguir uma ordem, e eu tentei arrumar as coisas de tal maneira
              que cada nova seção seja motivada pela anterior.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Outro princípio que eu tinha em mente era de ensinar apenas uma maneira
              de fazer alguma coisa. Isso é um benefício óbvio em um tutorial
              para pessoas que nunca programaram antes. Por um motivo:
              uma maneira de fazer uma coisa é mais fácil de aprender do que duas. Porém
              o mais importante benefício, é que quanto menos coisas você
              ensinar a um novo programador, mais criativo e esperto
              ele tem que ser em sua programação. Já que muito da programação
              é a resolução de problemas, torna-se crucial o encorajamento em todos os estágios
              possíveis.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Eu tentei traçar um paralelo entre os conceitos de programação
              com os conceitos que um novo programador já tenha;
              para apresentar as idéias de uma maneira que sua intuição
              o fará entender, ao invés do tutorial apenas despejar informações.
              Programação Orientada a Objetos faz isso, por si só muito bem.
              Eu fui capaz de me referir a "objetos" e diferentes "tipos de objetos"
              muito rapidamente nesse tutorial, soltando essas informações nos mais
              inocentes momentos. Eu não falei nada do tipo "tudo em Ruby é um objeto"
              ou "números e strings são tipos de objetos", porque essas
              coisas não dizem nada para um novo programador. Ao invés disso,
              eu vou falar sobre strings (e não sobre "objetos do tipo string"),
              e algumas vezes eu vou me referir a "objetos", apenas no sentido de "as coisas
              nesses programas". O fato de que todas essas <em>coisas</em> em Ruby <em>são</em> objetos
              made this sort of sneakiness on my part work so well.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Although I wanted to avoid needless OO jargon, I wanted
              to make sure that, if they did need to learn a word, they
              learned the right one.  (I don't want them to have to learn
              it twice, right?)  So I called them "strings," not "text."  Methods
              needed to be called something, so I called them "methods."
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              As far as the exercises are concerned, I think I came up
              with some good ones, but you can never have too many.
              Honestly, I bet I spent half of my time just trying to
              come up with fun, interesting exercises.
              Boring exercises absolutely kill any desire
              to program, while the perfect exercise creates an itch
              the new programmer can't help but scratch.  In short,
              you just can't spend too much time coming up with good
              exercises.
              END_PARAGRAPH
            end
            puts @@HLINE
            h2 { 'About the Original Tutorial' }
            para do <<-END_PARAGRAPH
              The pages of the tutorial (and even this page) are generated by a
              <a href="#{LINKADDR}?ShowTutorialCode=true">big Ruby program</a>,
              of course.  :-)
              As such, it has some neat features.  For example, all of the
              code samples are actually being run every time you view
              the page, and the output shown is the output they generate.
              I think this is the best, easiest, and
              certainly the coolest way to make sure that all of the
              code I present works <em>exactly</em> as I say it does.
              You don't have to worry that I might have copied the output
              of one of the examples
              wrong, or forgotten to test some of the code; it's all tested
              every time you see it.  So in the section on random number
              generators, if you reload the page you will see the numbers
              change each time... <em>nice</em>.
              (I used a similar trick for the example code when writing
              the book, but it's obviously more apparent with the tutorial.)
              END_PARAGRAPH
            end
            para do
              '<a href="http://ruby-lang.org">'+
                '<img src="/images/PoweredByRuby.png" alt="powered by Ruby" width="234" height="60" />'+
              '</a>'
            end
            puts @@HLINE
            h2 { 'Acknowledgements' }
            para do <<-END_PARAGRAPH
              Finally, I'd like to thank everyone on the ruby-talk mailing list
              for their thoughts and encouragement, all of my wonderful
              reviewers for their help in making the book far better than
              I could have alone, my dear wife especially
              for being my main reviewer/tester/guinea pig/muse,
              Matz for creating this fabulous language, and the Pragmatic Programmers
              for telling me about it&mdash;and, of course, for publishing
              my book!
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              If you notice any errors or typos, or have any comments or
              suggestions or good exercises I could include, please
              <a href="mailto:chris@pine.fm">let me know</a>.
              END_PARAGRAPH
            end
          end
          
          puts @@HLINE
          para(:style=>'padding-bottom: 20px;') { "&copy; 2003-#{Time.now.year} Chris Pine" }
        end # contentPane
      end # pageWidth
      end # body
    end # html
  end
end
