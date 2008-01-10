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
            h2 { 'Um lugar para o futuro programador come&ccedil;ar' }
            para do <<-END_PARAGRAPH
              Eu acho que tudo isso come&ccedil;ou em 2002. Eu estava pensando
              em ensinar programa&ccedil;&atilde;o, e como uma grande linguagem como
              Ruby seria &oacute;tima para aprender a como programar.  Quer dizer, n&oacute;s est&aacute;vamos
              todos excitados com Ruby pelo seu poder, eleg&acirc;ncia e por ser realmente divertido,
              mas me pareceu que ele seria, tamb&eacute;m um excelente guia para aprender a programar.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Infelizmente, n&atilde;o havia muita documenta&ccedil;&atilde;o sobre Ruby
              destinada aos iniciantes, naquela &eacute;poca. Alguns de n&oacute;s,
              na comunidade, est&aacute;vamos falando sobre como um tutorial 
              "Ruby for the Nuby" era necess&aacute;rio,
              e, mais gen&eacute;ricamente, um tutorial ensinando a programar, como um todo.
              Quanto mais eu pensava nisso, mais eu tinha a dizer (o que me surpreendeu
              um pouco). At&aacute; que algu&eacute;m finalmente disse: &quot;Chris, porque voc&ecirc;
              n&atilde;o escreve um tutorial ao inv&eacute;s de ficar falando sobre isso?&quot;.
              Ent&atilde;o eu o fiz.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              E isso n&atilde;o foi muito bom. Eu tive todas essas boas id&eacute;ias que eram boas
              <em>em teoria</em>, mas a atual tarefa de fazer um grande tutorial
              para n&atilde;o-programadores foi muito mais desafiador
              do que eu poderia prever. (Quer dizer, pareciam boas para mim, mas eu j&aacute;
              sabia como programar.)
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              O que me salvou foi que eu fiz com que fosse f&aacute;cil para as pessoas
              falarem comigo, e eu sempre tentei ajudar as pessoas quando elas empacavam.
              Quando eu via um monte de gente empacando em uma parte,
              eu a reescrevia. Isso deu muito trabalho, mas lentamente foi se tornando melhor
              e melhor.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Um par de anos depois, isso estava ficando realmente bom.  :-) T&aacute;o bom,
              na verdade, que eu j&aacute; estava pronto para anunciar sua finaliza&ccedil;&atilde;o, e
              partir para outra coisa. E justamente nesse instante houve a
              oportunidade de transformar esse tutorial em um livro. Uma vez que o b&aacute;sico
              j&aacute; estava pronto, eu achei que n&atilde;o haveria maiores problemas.
              I apenas precisaria clarificar umas coisas, adicionar alguns exerc&iacute;cios a mais, talvez
              alguns exemplos a mais, um pouquinho mais de cap&iacute;tulos, enviar ele para uns 50 revisores...
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Isso me tomou outro ano, mas agora eu acho que est&aacute; realmente
              <em>muito</em> bom, grande parte gra&ccedil;as as centenas
              de boas almas que me ajudaram a escrever esse livro.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              O que est&aacute; nesse site &eacute; o tutorial original, quase inalterado
              desde 2004. Para o melhor e mais atualizado, voc&ecirc; poder&aacute;
              querer dar uma olhada <a href="#{FRLTP_ADDR}">no livro</a>.
              END_PARAGRAPH
            end
            puts @@HLINE
            h2 { 'Notas Para Professores' }
            para do <<-END_PARAGRAPH
              H&aacute; algumas normas de conduta que eu tentei seguir.
              Eu acho que elas tornam o processo de aprendizado muito mais suave;
              ensinar a programar j&aacute; &eacute; dif&iacute;cil por si s&oacute;. Se voc&ecirc; est&aacute;
              ensinando ou guiando algu&eacute;m pelas vias hakcers, essas id&eacute;ias podem lhe ajudar tamb&eacute;m.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Primeiramente, eu tentei separar os conceitos o m&aacute;ximo poss&iaacute;vel,
              assim o estudante tem que aprender apenas um conceito de cada vez.
              Isso foi dif&iacute;cil no come&ccedil;o, mas um <em>pouco</em> mais f&aacute;cil
              depois que eu peguei a pr&aacute;tica. Algumas coisas devem ser faladas
              antes de outras, but I was amazed at how little of
              a precedence hierarchy there really is. Eventualmente, eu apenas tive que
              seguir uma ordem, e eu tentei arrumar as coisas de tal maneira
              que cada nova se&ccedil;&atilde;o seja motivada pela anterior.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Outro princ&iacute;pio que eu tinha em mente era de ensinar apenas uma maneira
              de fazer alguma coisa. Isso &eacute; um benef&iacute;cio &oacute;bvio em um tutorial
              para pessoas que nunca programaram antes. Por um motivo:
              uma maneira de fazer uma coisa &eacute; mais f&aacute;cil de aprender do que duas. Por&eacute;m
              o mais importante benef&iacute;cio, &eacute; que quanto menos coisas voc&ecirc;
              ensinar a um novo programador, mais criativo e esperto
              ele tem que ser em sua programa&ccedil;&atilde;o. J&aacute; que muito da programa&ccedil;&atilde;o
              &eacute; a resolu&ccedil;&atilde;o de problemas, torna-se crucial o encorajamento em todos os est&aacute;gios
              poss&iacute;veis.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              I have tried to piggy-back programming concepts onto concepts
              the new programmer already has; to present ideas in such a way
              that their intuition will carry the load, rather than the
              tutorial.  Object-Oriented programming lends itself to this
              quite well.  I was able to begin referring to "objects" and
              different "kinds of objects" pretty early in the tutorial,
              slipping those phrases in at the most innocent of moments.
              I wasn't saying anything like "everything in Ruby is an
              object," or "numbers and strings are kinds of objects,"
              because these statements really don't mean anything to
              a new programmer.  Instead, I would talk about strings
              (not "string objects"), and sometimes I would refer to
              "objects", simply meaning "the things in these programs."
              The fact that all these <em>things</em> in Ruby <em>are</em> objects
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
