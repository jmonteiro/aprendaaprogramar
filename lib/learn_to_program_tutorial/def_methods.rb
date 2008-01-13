module DefMethods
  #
  #  WRITING METHODS
  #
  
  def generateDefMethod
    para do <<-END_PARAGRAPH
      Como vimos, repetições e interadores nos permitem
      fazer a mesma coisa (rodar o mesmo código) de novo e
      de novo e de novo. Porém, algums vezes nós queremos
      fazer a mesma coisa um monte de vezes, mas de lugares
      diferentes do programa. Por exemplo, vamos supor que
      estejamos escrevendo um programa de questionário para
      um estudante de psicologia. A partir dos estudantes
      de psicologia que eu conheço e dos questionários que
      eles me forneceram, eu tenho algo parecido com isso:
      END_PARAGRAPH
    end
    prog ['sim','sim','de jeito nenhum!','NÃO','sim','sim'] do <<-END_CODE
      puts 'Olá, e obrigado pelo seu tempo para me ajudar'
      puts 'com essa pesquisa. Minha pesquisa é sobre'
      puts 'como as pessoas se sentem com comida'
      puts 'Mexicana. Apenas pense sobre comida Mexicana'
      puts 'e tente responder, honestamente, cada questão'
      puts 'com "sim" ou "não". Minha pesquisa não tem'
      puts 'nada há ver com quem molha a cama.'
      puts
      
      #  Nós fazemos as questões, mas ignoramos as respostas.
      
      boaResposta = false
      while (not boaResposta)
        puts 'Você gosta de comer tacos?'
        resposta = gets.chomp.downcase
        if (resposta == 'sim' or resposta == 'não')
          boaResposta = true
        else
          puts 'Por favor, responda com "sim" ou "não".'
        end
      end
      
      boaResposta = false
      while (not boaResposta)
        puts 'Você gosta de comer burritos?'
        resposta = gets.chomp.downcase
        if (resposta == 'sim' or resposta == 'não')
          boaResposta = true
        else
          puts 'Por favor, responda com "sim" ou "não".'
        end
      end
      
      #  Porém, nós prestamos atenção *nesta* questão.
      boaResposta = false
      while (not boaResposta)
        puts 'Você faz xixi na cama?'
        resposta = gets.chomp.downcase
        if (resposta == 'sim' or resposta == 'não')
          boaResposta = true
          if resposta == 'sim'
            molhaCama = true
          else
            molhaCama = false
          end
        else
          puts 'Por favor, responda com "sim" ou "não".'
        end
      end
      
      boaResposta = false
      while (not boaResposta)
        puts 'Você gosta de comer chimichangas?'
        resposta = gets.chomp.downcase
        if (resposta == 'sim' or resposta == 'não')
          boaResposta = true
        else
          puts 'Por favor, responda com "sim" ou "não".'
        end
      end
      
      puts 'Apenas mais algumas perguntas...'
      
      boaResposta = false
      while (not boaResposta)
        puts 'Você gosta de comer sopapillas?'
        resposta = gets.chomp.downcase
        if (resposta == 'sim' or resposta == 'não')
          boaResposta = true
        else
          puts 'Por favor, responda com "sim" ou "não".'
        end
      end
      
      #  Faça mais um monte de perguntas sobre comida
      #  Mexicana.
      
      puts
      puts 'QUESTIONÁRIO:'
      puts 'Obrigado por dispender seu tempo em nos ajudar'
      puts 'com nossa pesquisa. Na verdade, essa pesquisa'
      puts 'não tem nada há ver com comida Mexicana.'
      puts 'Mas é uma pesquisa sobre quem molha a cama.'
      puts 'As comidas mexicanas estavam lá apenas para'
      puts 'baixar sua guarda na espença de fazer você'
      puts 'responder mais honestamente. Obrigado novamente.'
      puts
      puts molhaCama
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Um lindo e longo programa, com um monte de repetição.
      (Todas as seções de código que giram em torno de questões
      sobre comida Mexicana são idênticas, e a questão sobre xixi
      na cama é ligeiramente diferente.)
      Repetição é uma coisa ruim. Mas nós não podemos fazer um grande
      interador, porque algumas vezes nós queremos fazer alguma coisa
      entre as questões. Em situações como essa, é melhor escrever
      um método. Veja como:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def digaMoo
        puts 'mooooooo...'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Anh... Nosso programa não disse #{output 'mooooooo...'}.
      Por que não? Porque nós não o mandamos fazer isso.
      Nós apenas dissemos <em>como</em> fazer para dizer
      #{output 'mooooooo...'}, mas nós nunca o mandamos
      <em>fazer</em> isso. Vamos lá, outra tentativa:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def digaMoo
        puts 'mooooooo...'
      end
      
      digaMoo
      digaMoo
      puts 'coin-coin'
      digaMoo
      digaMoo
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Ah! Muito melhor. (Para o caso de você não falar
      Francês, havia um pato Francês no meio do prorgama.
      Na França, os patos fazem <em>"coin-coin</em>").
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então, nós <span class="L2Pkeyword">#{code 'def'}</span>inimos
      o método #{code 'digaMoo'} (Nomes de método, assim como
      nomes de variáveis, começam com uma letra minúscula. Há
      exceções, como #{code '+'} ou #{code '=='}).
      Mas métodos não têm de sempre estar associados com
      objetos? Bem, sim, eles têm. E nesse caso (assim como com
      o #{code 'puts'} e o #{code 'gets'}) , o método está
      associado apenas com o objeto representando o programa
      como um todo. No próximo capítulo nós vamos ver
      como adicionar métodos para outros objetos. Mas primeiro...
      END_PARAGRAPH
    end
    h2 {'Parâmetros de Métodos'}
    para do <<-END_PARAGRAPH
      Você deve ter notado que com alguns métodos (como
      o #{code 'gets'}, ou o #{code 'to_s'}, ou o #{code 'reverse'}...)
      você pode chamar apenas com um objeto. Porém, outros
      métodos (como o #{code '+'}, o #{code '-'}, o #{code 'puts'}...)
      recebem <dfn>parâmetros</dfn> para dizer ao objeto o que
      fazer com o método. Por exemplo, você não diz apenas
      #{code '5+'}, certo? Vpcê está dizendo ao #{code '5'}
      para adicionar, mas você não o está dizendo <em>o que</em>
      adicionar.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Para adicioanr um parâmetro ao #{code 'digaMoo'} (o número
      de mugidos, por exemplo), nós podemos fazer o seguinte:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def digaMoo numeroDeMoos
        puts 'mooooooo...'*numeroDeMoos
      end
      
      digaMoo 3
      puts 'oink-oink'
      digaMoo  #  Isso vai dar erro pois não foi passado nenhum parâmetro.
      END_CODE
    end
    para do <<-END_PARAGRAPH
      #{code 'numeroDeMoos'} é uma variável que aponta
      para o parâmetro que foi passado. Vou dizer mais uma vez,
      mas é um pouco confuso: #{code 'numeroDeMoos'} é uma variável
      que aponta para o parâmetro que foi passado. Então, se eu
      digitar #{code 'digaMoo 3'}, o parâmetro é o #{code '3'},
      e a variável #{code 'numeroDeMoos'} aponta para #{code '3'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Como você pode ver, agora o parâmetro é <em>necessário</em>.
      Afinal, o que o #{code 'digaMoo'} deve fazer é multiplicar
      #{code "'mooooooo'"} por um número. Mas por quanto, se você
      não disse? Seu computador não tem a menor idéia.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Se compararmos os objetos em Ruby aos substantivos em Português,
      os métodos podem, da mesma forma, ser comparados aos verbos.
      Assim, você pode imaginar os parâmetros como advérbios (assim
      como em #{code 'digaMoo'}, onde o parâmetro nos diz <em>como</em>
      a #{code 'digaMoo'} agir) ou algumas vezes como objetos diretos
      (como em #{code 'puts'}, onde o parâmetro é <em>o que</em>
      o #{code 'puts'} irá imprimir).
      END_PARAGRAPH
    end
    h2 {'Variáveis Locais'}
    para do <<-END_PARAGRAPH
      No programa a seguir, há duas variáveis:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def dobreEste num
        numVezes2 = num*2
        puts 'O dobro de '+num.to_s+' é '+numTimes2.to_s
      end
      
      doubreEste 44
      END_CODE
    end
    para do <<-END_PARAGRAPH
      As variáveis são #{code 'num'} e #{code 'numVezes2'}.
      Ambas estão localizadas dentro do método #{code 'dobreEste'}.
      Estas (e todas as outras variáveis que você viu até agora)
      são <dfn>variáveis locais</dfn>. Isso significa que
      elas vivem dentro do método e não podem sair.
      Se você tentar, você terá um erro:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def dobreEste num
        numVezes2 = num*2
        puts 'O dobro de '+num.to_s+' é '+numTimes2.to_s
      end
      
      doubreEste 44
      puts numVezes2.to_s
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Variável local não definida... Na verdade, nós
      <em>definimos</em> aquela variável local, mas
      ela não é local em relação ao local onde tentamos
      usá-la; ela é local ao método.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Isso pode parecer inconveniente, mas é muito bom.
      Enquanto você não tiver acesso a variáveis de dentro
      dos métodos, isso também quer dizer que ninguém tem
      acesso às <em>suas</em> variáveis, e isso quer dizer
      que ninguém pode fazer algo como isso:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def pequenaPeste var
        var = nil
        puts 'HAHA! Eu acabei com a sua variável!'
      end
      
      var = 'Você não pode tocar na minha variável!'
      pequenaPeste var
      puts var
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Há, atualmente, <em>duas</em> variáveis naquele pequeno
      programa chamado #{code 'var'}: uma dentro do método
      #{code 'pequenaPeste'} e uma fora dele. Quando você chamou
      #{code 'pequenaPeste var'}, nós realmente passamos a stringe
      que estava em #{code 'var'} para a outra, então as mesmas
      estavam apontando para a mesma string. Então, o método #{code 'pequenaPeste'}
      apontou a sua #{code 'var'} <em>local</em> para #{code 'nil'},
      mas isso não fez nada com a #{code 'var'} de fora do método.
      END_PARAGRAPH
    end
    h2 {'Retornando Valores'}
    para do <<-END_PARAGRAPH
      Você deve ter notado que alguns métodos devolvem alguma
      coisa quando você os chama. Por exemplo, o método #{code 'gets'}
      <dfn>retorna</dfn> uma string (a string que você digitas),
      e o método #{code '+'} em #{code '5+3'}, (que é, na verdade #{code '5.+(3)'})
      retorna #{code '8'}. Os métodos aritiméticos para números
      retornam números, e os métodos aritiméticos para strings
      retornam strings.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      É importante entender a diferença entre métodos retornando
      um valor para onde ele foi chamado, e o seu programa gerando
      uma saída para a sua tela, como o #{code 'puts'} faz. Note
      que #{code '5+3'} retorna #{code '8'}; ele <strong>não</strong>
      imprime #{output '8'} na tela.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então, <em>o que</em> o #{code 'puts'} retorna? Nós nunca
      nos importamos antes, mas vamos dar uma olhadinha agora:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      valorRetorno = puts 'Este puts retornou:'
      puts valorRetorno
      END_CODE
    end
    para do <<-END_PARAGRAPH
      O primeiro #{code 'puts'} retornou #{code 'nil'}. Apesar
      de não termos testado o segundo #{code 'puts'}, ele fez a
      mesma coisa; #{code 'puts'} sempre retorna um #{code 'nil'}.
      Todo o método tem que retornar alguma coisa, mesmo que
      seja apenas um #{code 'nil'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Faça uma pausa e escreva um programa que encontre
      o que o método #{code 'digaMoo'} retornou.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Você está surpreso? Bem, as coisas funcionam assim: o valor
      de retorno de um método é simplesmente a última linha avaliada
      do método. No caso do método #{code 'digaMoo'}, isso quer dizer
      que ele retornou #{code "'puts mooooooo...'*numeroDeMoos"}, que
      é um simples #{code 'nil'}, já que #{code 'puts'} sempre retorna
      um #{code 'nil'}. Se nós quisermos que todos os nossos métodos
      retornem a string #{code "'yellow submarine'"}, nós apenas
      temos que colocar ela no fim deles:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def digaMoo numeroDeMoos
        puts 'mooooooo...'*numeroDeMoos
        'yellow submarine'
      end
      
      x = digaMoo 2
      puts x
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Agora vamos tentar aquela pesquisa de psicologia de novo,
      mas agora vamos escrever um método que faça a pergunta
      para nós. Ele vai precisar pegar a questão como um
      parâmetro e retornar #{code 'true'} se a resposta foi
      #{input 'sim'} e #{code 'false'} se a resposta foi
      #{input 'não'} (Mesmo que nós ignoremos a resposta
      na maioria das vezes, é uma boa idéia fazer o método
      retornar a resposta. Assim nós podemos usar isso para a
      questão sobre molhar a cama).
      Eu também vou dar uma resumida na saudação e no final,
      apenas para ficar mais fácil de ler:
      END_PARAGRAPH
    end
    prog ['sim','sim','de jeito nenhum!','NÃO','sim','sim','sim','sim','sim'] do <<-END_CODE
      def pergunte pergunta
        boaResposta = false
        while (not boaResposta)
          puts pergunta
          replica = gets.chomp.downcase
          
          if (replica == 'sim' or replica == 'não')
            boaResposta = true
            if replica == 'sim'
              resposta = true
            else
              resposta = false
            end
          else
            puts 'Por favor, responda com "sim" ou "não".'
          end
        end
        
        resposta #  É isso o que será retornado (true ou false).
      end
      
      puts 'Olá e obrigado por...'
      puts
      
      pergunta 'Você gosta de comer tacos?'          #  Nós ignoramos o valor de retorno desse método.
      pergunta 'Você gosta de comer burritos?'
      molhaCama = pergunta 'Você faz xixi na cama?'  #  Nós salvamos o retorno desse.
      pergunta 'Você gosta de comer chimichangas?'
      pergunta 'Você gosta de comer sopapillas?'
      pergunta 'Você gosta de comer tamales?'
      puts 'Apenas mais algumas perguntas...'
      pergunta 'Você gosta de beber horchata?'
      pergunta 'Você gosta de comer flautas?'
      
      puts
      puts 'QUESTIONÁRIO:'
      puts 'Obrigado por...'
      puts
      puts molhaCama
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Nada mal, hein? Nós podemos adicionar mais peguntas (e
      adicionar mais perguntas é <em>fácil</em> agora), mas
      nosso programa continuará pequeno! Isso é um grande
      progresso&mdash; o sonho de todo o programador preguiçoso.
      END_PARAGRAPH
    end
    h2 {'Mais um Grande Exemplo'}
    para do <<-END_PARAGRAPH
      Eu acho que outro 
      I think another example method would be helpful here.
      We'll call this one #{code 'englishNumber'}.
      It will take a number, like #{code '22'},
      and return the english version of it (in this case,
      the string #{code "'twenty-two'"}).  For now, let's have it
      only work on integers from #{code '0'} to #{code '100'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      <em>(<strong>NOTE:</strong>  This method uses a new trick
      to return from a method early using the </em>#{code 'return'}<em>
      keyword, and introduces a new twist on branching:
      </em>#{code 'elsif'}<em>.  It should be clear in context
      how these work.)</em>
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def englishNumber number
        #  We only want numbers from 0-100.
        if number < 0
          return 'Please enter a number zero or greater.'
        end
        if number > 100
          return 'Please enter a number 100 or lesser.'
        end
        
        numString = ''  #  This is the string we will return.
        
        #  "left" is how much of the number we still have left to write out.
        #  "write" is the part we are writing out right now.
        #  write and left... get it?  :)
        left  = number
        write = left/100          #  How many hundreds left to write out?
        left  = left - write*100  #  Subtract off those hundreds.
        
        if write > 0
          return 'one hundred'
        end
        
        write = left/10          #  How many tens left to write out?
        left  = left - write*10  #  Subtract off those tens.
        
        if write > 0
          if write == 1  #  Uh-oh...
            #  Since we can't write "tenty-two" instead of "twelve",
            #  we have to make a special exception for these.
            if    left == 0
              numString = numString + 'ten'
            elsif left == 1
              numString = numString + 'eleven'
            elsif left == 2
              numString = numString + 'twelve'
            elsif left == 3
              numString = numString + 'thirteen'
            elsif left == 4
              numString = numString + 'fourteen'
            elsif left == 5
              numString = numString + 'fifteen'
            elsif left == 6
              numString = numString + 'sixteen'
            elsif left == 7
              numString = numString + 'seventeen'
            elsif left == 8
              numString = numString + 'eighteen'
            elsif left == 9
              numString = numString + 'nineteen'
            end
            #  Since we took care of the digit in the ones place already,
            #  we have nothing left to write.
            left = 0
          elsif write == 2
            numString = numString + 'twenty'
          elsif write == 3
            numString = numString + 'thirty'
          elsif write == 4
            numString = numString + 'forty'
          elsif write == 5
            numString = numString + 'fifty'
          elsif write == 6
            numString = numString + 'sixty'
          elsif write == 7
            numString = numString + 'seventy'
          elsif write == 8
            numString = numString + 'eighty'
          elsif write == 9
            numString = numString + 'ninety'
          end
          
          if left > 0
            numString = numString + '-'
          end
        end
        
        write = left  #  How many ones left to write out?
        left  = 0     #  Subtract off those ones.
        
        if write > 0
          if    write == 1
            numString = numString + 'one'
          elsif write == 2
            numString = numString + 'two'
          elsif write == 3
            numString = numString + 'three'
          elsif write == 4
            numString = numString + 'four'
          elsif write == 5
            numString = numString + 'five'
          elsif write == 6
            numString = numString + 'six'
          elsif write == 7
            numString = numString + 'seven'
          elsif write == 8
            numString = numString + 'eight'
          elsif write == 9
            numString = numString + 'nine'
          end
        end
        
        if numString == ''
          #  The only way "numString" could be empty is if
          #  "number" is 0.
          return 'zero'
        end
        
        #  If we got this far, then we had a number somewhere
        #  in between 0 and 100, so we need to return "numString".
        numString
      end
      
      puts englishNumber(  0)
      puts englishNumber(  9)
      puts englishNumber( 10)
      puts englishNumber( 11)
      puts englishNumber( 17)
      puts englishNumber( 32)
      puts englishNumber( 88)
      puts englishNumber( 99)
      puts englishNumber(100)
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Well, there are certainly a few things about this program
      I don't like.  First, it has too much repetition.  Second,
      it doesn't handle numbers greater than 100.  Third, there
      are too many special cases, too many #{code 'return'}s.
      Let's use some arrays and try to clean it up a bit:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def englishNumber number
        if number < 0  #  No negative numbers.
          return 'Please enter a number that isn\\'t negative.'
        end
        if number == 0
          return 'zero'
        end
        
        #  No more special cases!  No more returns!
        
        numString = ''  #  This is the string we will return.
        
        onesPlace = ['one',     'two',       'three',    'four',     'five',
                     'six',     'seven',     'eight',    'nine']
        tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
                     'sixty',   'seventy',   'eighty',   'ninety']
        teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
                     'sixteen', 'seventeen', 'eighteen', 'nineteen']
        
        #  "left" is how much of the number we still have left to write out.
        #  "write" is the part we are writing out right now.
        #  write and left... get it?  :)
        left  = number
        write = left/100          #  How many hundreds left to write out?
        left  = left - write*100  #  Subtract off those hundreds.
        
        if write > 0
          #  Now here's a really sly trick:
          hundreds  = englishNumber write
          numString = numString + hundreds + ' hundred'
          #  That's called "recursion".  So what did I just do?
          #  I told this method to call itself, but with "write" instead of
          #  "number".  Remember that "write" is (at the moment) the number of
          #  hundreds we have to write out.  After we add "hundreds" to "numString",
          #  we add the string ' hundred' after it.  So, for example, if
          #  we originally called englishNumber with 1999 (so "number" = 1999),
          #  then at this point "write" would be 19, and "left" would be 99.
          #  The laziest thing to do at this point is to have englishNumber
          #  write out the 'nineteen' for us, then we write out ' hundred',
          #  and then the rest of englishNumber writes out 'ninety-nine'.
          
          if left > 0
            #  So we don't write 'two hundredfifty-one'...
            numString = numString + ' '
          end
        end
        
        write = left/10          #  How many tens left to write out?
        left  = left - write*10  #  Subtract off those tens.
        
        if write > 0
          if ((write == 1) and (left > 0))
            #  Since we can't write "tenty-two" instead of "twelve",
            #  we have to make a special exception for these.
            numString = numString + teenagers[left-1]
            #  The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.
            
            #  Since we took care of the digit in the ones place already,
            #  we have nothing left to write.
            left = 0
          else
            numString = numString + tensPlace[write-1]
            #  The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
          end
          
          if left > 0
            #  So we don't write 'sixtyfour'...
            numString = numString + '-'
          end
        end
        
        write = left  #  How many ones left to write out?
        left  = 0     #  Subtract off those ones.
        
        if write > 0
          numString = numString + onesPlace[write-1]
          #  The "-1" is because onesPlace[3] is 'four', not 'three'.
        end
        
        #  Now we just return "numString"...
        numString
      end
      
      puts englishNumber(  0)
      puts englishNumber(  9)
      puts englishNumber( 10)
      puts englishNumber( 11)
      puts englishNumber( 17)
      puts englishNumber( 32)
      puts englishNumber( 88)
      puts englishNumber( 99)
      puts englishNumber(100)
      puts englishNumber(101)
      puts englishNumber(234)
      puts englishNumber(3211)
      puts englishNumber(999999)
      puts englishNumber(1000000000000)
      END_CODE
    end
    para do <<-END_PARAGRAPH
      <em>Ahhhh....</em> That's much, much better.  The program is
      fairly dense, which is why I put in so many comments.  It
      even works for large numbers... though not quite as nicely
      as one would hope.  For example, I think #{code "'one trillion'"}
      would be a nicer return value for that last number, or even
      #{code "'one million million'"} (though all three are correct).
      In fact, you can do that right now...
      END_PARAGRAPH
    end
    h2 {'A Few Things to Try'}
    para do <<-END_PARAGRAPH
      &bull; Expand upon #{code 'englishNumber'}.  First, put in
      thousands.  So it should return #{code "'one thousand'"}
      instead of #{code "'ten hundred'"} and #{code "'ten thousand'"}
      instead of #{code "'one hundred hundred'"}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Expand upon #{code 'englishNumber'} some more.
      Now put in millions, so you get #{code "'one million'"}
      instead of #{code "'one thousand thousand'"}.  Then try adding
      billions and trillions.  How high can you go?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; How about #{code 'weddingNumber'}?  It should
      work almost the same as #{code 'englishNumber'}, except
      that it should insert the word "and" all over the place,
      returning things like #{code "'nineteen hundred and seventy and two'"},
      or however wedding invitations are supposed to look.  I'd give you more
      examples, but I don't fully understand it myself.  You might
      need to contact a wedding coordinator to help you.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; <em>"Ninety-nine bottles of beer..."</em>
      Using #{code 'englishNumber'} and your old program, write out the
      lyrics to this song the <em>right</em> way this time.
      Punish your computer:  have it start at 9999.  (Don't pick
      a number too large, though, because writing all of that to
      the screen takes your computer quite a while.  A hundred
      thousand bottles of beer takes some time; and if you pick
      a million, you'll be punishing yourself as well!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Congratulations!  At this point, you are a true
      programmer!  You have learned
      everything you need to build huge programs from scratch.
      If you have ideas for programs you would like to write
      for yourself, give them a shot!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Of course, building everything from scratch can be a
      pretty slow process.  Why spend time writing code that
      someone else already wrote?  
      Would you like your program to send some email?
      Would you like to save and load files on your computer?
      How about generating web pages for a tutorial where
      the code samples are actually being run every time the
      web page is loaded?  ;) Ruby has many different
      #{makeLink 'kinds of objects', :generateClasses}
      we can use to help us write better programs faster.
      END_PARAGRAPH
    end
  end
end
