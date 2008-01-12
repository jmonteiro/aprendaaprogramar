module DefMethods
  #
  #  WRITING METHODS
  #
  
  def generateDefMethod
    para do <<-END_PARAGRAPH
      Como vimos, loops e iteradores nos permitem fazer a mesma
      coisa (executar o mesmo código) várias vezes.
      No entanto, às vezes queremos fazer a mesma coisa várias
      vezes, mas de diferentes partes do programa.
      Por exemplo, vamos dizer que estamos escrevendo um
      programa de questionário para um estudande de psicologia.
      Baseado nos estudantes de psicologia que conheço, e nos
      questionários que eles me deram, provavelmente seria algo
      assim:
      END_PARAGRAPH
    end
    prog ['sim','sim','de jeito nenhum!','NÃO','sim','sim'] do <<-END_CODE
      puts 'Olá, e obrigado pelo seu tempo para me ajudar'
      puts 'com este experimento.  Meu experimento tem a'
      puts 'ver com o que as pessoas acham sobre comida'
      puts 'mexicana.  Apenas pense em comida mexicana e'
      puts 'tente responder cada questão honestamente,'
      puts 'apenas com um "sim" ou um "não".  Meu experimento'
      puts 'não tem qualquer coisa a ver com molhar a cama.'
      puts
      
      #  Nós fazemos estas perguntas, mas ignoramos suas respostas.
      
      boaResposta = false
      while (not boaResposta)
        puts 'Você gosta de comer tacos?'
        resposta = gets.chomp.downcase
        if (resposta == 'sim' or resposta == 'não')
          boaResposta = true
        else
          puts 'Por favor responda "sim" ou "não".'
        end
      end
      
      boaResposta = false
      while (not boaResposta)
        puts 'Você gosta de comer burritos?'
        resposta = gets.chomp.downcase
        if (resposta == 'sim' or resposta == 'não')
          boaResposta = true
        else
          puts 'Por favor responda "sim" ou "não".'
        end
      end
      
      #  Prestamos atenção *nesta* resposta, no entanto.
      boaResposta = false
      while (not boaResposta)
        puts 'Você molha a cama?'
        resposta = gets.chomp.downcase
        if (resposta == 'sim' or resposta == 'não')
          boaResposta = true
          if resposta == 'sim'
            molhaCama = true
          else
            molhaCama = false
          end
        else
          puts 'Por favor responda "sim" ou "não".'
        end
      end
      
      boaResposta = false
      while (not boaResposta)
        puts 'Você gosta de comer chimichangas?'
        resposta = gets.chomp.downcase
        if (resposta == 'sim' or resposta == 'não')
          boaResposta = true
        else
          puts 'Por favor responda "sim" ou "não".'
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
          puts 'Por favor responda "sim" ou "não".'
        end
      end
      
      #  Faça várias outras perguntas sobre comida mexicana.
      
      puts
      puts 'DEBRIEFING:'
      puts 'Obrigado pelo tempo para me ajudar com este'
      puts 'experimento.  Na verdade, este experimento'
      puts 'não tem qualquer coisa a ver com comida mexicana.'
      puts 'É um experimento sobre molhar a cama.  A'
      puts 'comida mexicana estava lá para pegá-lo desprevinido'
      puts 'na esperança que você pudesse responder mais'
      puts 'honestamente.  Obrigado novamente.'
      puts
      puts molhaCama
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Este foi um longo programa, com muitas repetições.
      (Todas as seções de código ao redor das questões sobre
      comida mexicana foram idênticas, e somente a questão
      sobre molhar a cama foi ligeiramente diferente.)
      Repetição é uma coisa ruim.  Porém, nós não podemos colocar
      dentro de um grande loop ou iterador, porque às vezes temos
      coisas que queremos fazer entre as questões.  Em situações
      como esta, é melhor escrever um método. Aqui está como:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def dizerMuu
        puts 'muuuuuuu...'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Uh... nosso programa não fez #{code 'dizerMuu'}.
      Por que não?  Porque não falamos para ele fazer.
      Nós dissemos <em>como</em> #{code 'dizerMuu'},
      mas nós nunca realmente dissemos para <em>fazê-lo</em>.
      Vamos tentar novamente:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def dizerMuu
        puts 'muuuuuuu...'
      end
      
      dizerMuu
      dizerMuu
      puts 'coin-coin'
      dizerMuu
      dizerMuu
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Ahhh, bem melhor.  (Só para o caso de você não falar
      Francês, isso foi um pato francês no meio do programa.
      Na França, os patos dizem <em>"coin-coin"</em>.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então nós <span class="L2Pkeyword">#{code 'def'}</span>inimos
      o método #{code 'sayMoo'}.  (Nomes de método, como
      os nomes de variáveis, começam com letra minúscula.
      Há algumas exceções, no entanto, como  #{code '+'}
      ou #{code '=='}.)
      Mas os métodos não devem ser sempre associados a 
      objetos?  Bem, sim eles devem, e neste caso (assim como
      #{code 'puts'} e #{code 'gets'}), o método é apenas
      associado com o objeto representando o programa inteiro.
      No próximo capítulo veremos como adicionar métodos a 
      outros objetos.  Mas antes...
      END_PARAGRAPH
    end
    h2 {'Parâmetros de Método'}
    para do <<-END_PARAGRAPH
      Você deve ter notado que alguns métodos (como #{code 'gets'}, 
      #{code 'to_s'}, #{code 'reverse'}...) você pode apenas chamar
      em um objeto.  Porém, outros métodos (como #{code '+'}, 
      #{code '-'}, #{code 'puts'}...) recebem <dfn>parâmetros</dfn> 
      para dizer ao objeto como executar o método.  Por exemplo,
      você não diria apenas #{code '5+'}, certo?  Você está dizendo
      para #{code '5'} adicionar, mas você não está dizendo
      <em>o que</em> adicionar.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Para adicionar um parâmetro a  #{code 'dizerMuu'} (digamos, o
      número de mus), faríamos assim:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def dizerMuu numeroDeMus
        puts 'muuuuuuu...'*numeroDeMus
      end
      
      dizerMuu 3
      puts 'oinc-oinc'
      dizerMuu  #  Isto deve dar um erro porque está faltando o parâmetro
      END_CODE
    end
    para do <<-END_PARAGRAPH
      #{code 'numeroDeMus'} é uma variável que aponta para o 
      parâmetro passado.  Eu diria novamente, mas é um pouco
      confuso:  #{code 'numeroDeMus'} é uma variável que
      aponta para o parâmetro passado.  Então se eu digitar
      #{code 'dizerMuu 3'}, então o parâmetro é  #{code '3'},
      e a variável #{code 'numeroDeMus'} aponta para #{code '3'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Como pode ver, o parâmetro agora é <em>obrigatório</em>.
      Afinal, pelo que #{code 'dizerMuu'} deverá multiplicar
      #{code "'muuuuuuu...'"} se você não passar a ele um
      parâmetro?  Seu pobre computador não tem idéia.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Se objetos em Ruby são como substantivos no Português, e métodos
      são como verbos, então você pode pensar em parâmetros como 
      advérbios (como em #{code 'dizerMuu'}, onde o parâmetro nos
      disse <em>como</em> #{code 'dizerMuu'}) ou às vezes como
      objetos diretos (como em #{code 'puts'}, onde o parâmetro é
      <em>o que</em> ficará #{code 'puts'}ado).
      END_PARAGRAPH
    end
    h2 {'Variáveis Locais'}
    para do <<-END_PARAGRAPH
      No programa a seguir, há duas variáveis:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def dupliqueIsto num
        numVezes2 = num*2
        puts num.to_s+' duplicado é '+numVezes2.to_s
      end
      
      dupliqueIsto 44
      END_CODE
    end
    para do <<-END_PARAGRAPH
      As variáveis são #{code 'num'} e #{code 'numVezes2'}.
      As duas estão dentro do método #{code 'dupliqueIsto'}.
      Estas (e todas as variáveis que você viu até agora)
      são <dfn>variáveis locais</dfn>.  Isto significa que
      elas vivem dentro do método, e não podem sair.
      Se você tentar, verá um erro:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def dupliqueIsto num
        numVezes2 = num*2
        puts num.to_s+' duplicado é '+numVezes2.to_s
      end
      
      dupliqueIsto 44
      puts numVezes2.to_s
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Variável local indefinida...  Na verdade, nós <em>realmente</em>
      definimos aquela variável local, mas ela não é local para onde
      nós tentamos usá-la; é local para o método.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Isto parece ser inconveniente, mas é na verdade bem legal.
      Enquanto quer dizer que você não tem acesso a variáveis
      dentro de métodos, também quer dizer que eles não têm acesso
      às <em>suas</em> variáveis, e portanto não podem estragá-las:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def pequenaPeste var
        var = nil
        puts 'HAHA!  Eu arruinei sua variável!'
      end
      
      var = 'Você não pode nem tocar minha variável'
      pequenaPeste var
      puts var
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Há na verdade <em>duas</em> variáveis neste pequeno programa
      com o nome #{code 'var'}:  uma dentro de #{code 'pequenaPeste'},
      e outra fora dele.  Quando chamamos #{code 'pequenaPeste var'},
      nós na realidade apenas passamos a string de uma #{code 'var'} para
      a outra, de forma que ambas estavam apontando para a mesma string.
      Então #{code 'pequenaPeste'} apontou sua própria #{code 'var'} 
      <em>local</em> para #{code 'nil'}, mas fez nada para a
      #{code 'var'} fora do método.
      END_PARAGRAPH
    end
    h2 {'Valores de Retorno'}
    para do <<-END_PARAGRAPH
      Você deve ter notado que alguns métodos devolvem alguma
      coisa quando você os chama.  Por exemplo, #{code 'gets'}
      <dfn>retorna</dfn> uma string (a string que você digitou),
      e o método #{code '+'} em #{code '5+3'}, (que na realidade
      é #{code '5.+(3)'}) retorna #{code '8'}.  Os métodos
      aritméticos para números retornam números, e os métodos
      aritméticos para strings retoram strings.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      É importante entender a diferença entre métodos
      retornando um valor para onde o método for chamado, e
      seu programa escrevendo informações de saída na sua tela,
      como #{code 'puts'} faz.  Repare que #{code '5+3'} retorna
      #{code '8'}; ele <strong>não</strong> escreve #{output '8'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então o <em>que</em> #{code 'puts'} retorna?  Nós nunca nos
      importamos antes, mas vamos ver agora:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      retornaVal = puts 'Este puts retornou:'
      puts retornaVal
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Então o primeiro #{code 'puts'} retornou #{code 'nil'}.  Apesar
      de não termos testado, o segundo #{code 'puts'} fez o mesmo;
      #{code 'puts'} sempre retorna #{code 'nil'}.  Todo método
      tem que retornar algo, mesmo que seja apenas #{code 'nil'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Faça uma pausa rápida e escreva um programa para
      descobrir o que #{code 'digaMuu'} retornou.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Ficou surpreso?  Bem, aqui está como funciona:  o valor
      retornado de um método é simplesmente a última linha do método.  No
      caso de #{code 'digaMuu'}, isto significa que ele retornou
      #{code "puts 'muuuuuuu...'*numeroDeMus"}, que é apenas
      #{code 'nil'} uma vez que #{code 'puts'} sempre retorna
      #{code 'nil'}.  Se quiséssemos que todos os nosso métodos
      retornassem a string #{code "'yellow submarine'"}, nós
      teríamos apenas que colocar <em>aquilo</em> no fim
      dele:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def digaMuu numeroDeMus
        puts 'muuuuuuu...'*numeroDeMus
        'yellow submarine'
      end
      
      x = digaMuu 2
      puts x
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Então, vamos tentar aquele experimento de psicologia novamente,
      mas desta vez escreveremos um método para fazer as perguntas por nós.
      Ele vai precisar receber a pergunta como parâmetro, e retornar
      #{code 'true'} se responderam #{input 'sim'} e
      #{code 'false'} se responderam #{input 'não'}.  (Apesar de que
      na maior parte das vezes nós apenas ignoramos a resposta, ainda
      é uma boa idéia para nosso método retornar a resposta. Desta forma
      podemos usá-la também para a pergunta sobre molhar a cama.)
      Também encurtarei a saudação e o debriefing, para ficar mais fácil
      de ler:
      END_PARAGRAPH
    end
    prog ['sim','sim','de jeito nenhum!','NÃO','sim','sim','sim','sim','sim'] do <<-END_CODE
      def pergunte pergunta
        boaResposta = false
        while (not boaResposta)
          puts pergunta
          resp = gets.chomp.downcase
          
          if (resp == 'sim' or resp == 'no')
            boaResposta = true
            if resp == 'sim'
              resposta = true
            else
              resposta = false
            end
          else
            puts 'Por favor responda "sim" ou "não".'
          end
        end
        
        resposta  #  Isso é o que retornamos (true ou false).
      end
      
      puts 'Olá, e obrigado...'
      puts
      
      pergunte 'Você gosta de comer tacos?'  #  Ignoramos este valor de retorno.
      pergunte 'Você gosta de comer burritos?'
      molhaCama = pergunte 'Você molha a cama?'  #  Salvamos este valor de retorno
      pergunte 'Você gosta de comer chimichangas?'
      pergunte 'Você gosta de comer sopapillas?'
      pergunte 'Você gosta de comer tamales?'
      puts 'Apenas mais algumas perguntas...'
      pergunte 'Você gosta de beber horchata?'
      pergunte 'Você gosta de comer flautas?'
      
      puts
      puts 'DEBRIEFING:'
      puts 'Obrigado por...'
      puts
      puts molhaCama
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Nada mau, hein?  Fomos capazes de adicionar mais perguntas
      (e adicionar perguntas é <em>fácil</em> agora), mas nosso programa
      ainda ficou um pouco menor!  É um grande avanço
      &mdash; o sonho de um programador preguiçoso.
      END_PARAGRAPH
    end
    h2 {'Mais Um Grande Exemplo'}
    para do <<-END_PARAGRAPH
      Acho que outro método de exemplo seria útil aqui.
      Chamaremos este de #{code 'porExtenso'}.
      Ele vai receber um número, como #{code '22'},
      e retornar a versão por extenso dele (neste caso,
      a string #{code "'vinte e dois'"}).  Por enquanto, vamos fazê-lo
      funcionar apenas com inteiros de #{code '0'} a #{code '100'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      <em>(<strong>NOTA:</strong>  Este método usa um novo truque
      para retornar de um método mais cedo usando a palavra-chave
      </em>#{code 'return'}<em>, e introduz uma novidade em ramificações:
      </em>#{code 'elsif'}<em>.  Deve ficar claro no contexto como estes
      funcionam.)</em>
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def porExtenso numero
	#  Só queremos números de 0 a 100
	if numero < 0
	  return 'Por favor entre um número maior ou igual a zero.'
	end
	if numero > 100
	  return 'Por favor entre um número menor ou igual a 100.'
	end
	
	numString = ''  #  Esta será a string que retornaremos.
	
	#  "falta" é o quanto do número ainda falta para escrever.
	#  "escrevendo" é a parte que estamos escrevendo neste momento.
	falta  = numero
	escrevendo = falta/100           #  Quantas centenas faltam escrever?
	falta  = falta - escrevendo*100  #  Subtraia estas centenas.
	
	if escrevendo > 0
	  return 'cem'
	end
	
	escrevendo = falta/10           #  Quantas dezenas faltam escrever?
	falta  = falta - escrevendo*10  #  Subtraia estas dezenas.
	
	if escrevendo > 0
	  if escrevendo == 1  #  Uh-oh...
          #  Como não podemos escrever "dez e dois" em vez de "doze",
          #  temos que fazer uma exceção especial para estes.
            if falta == 0
              numString = numString + 'dez'
            elsif falta == 1
              numString = numString + 'onze'
            elsif falta == 2
              numString = numString + 'doze'
            elsif falta == 3
              numString = numString + 'treze'
            elsif falta == 4
              numString = numString + 'catorze'
            elsif falta == 5
              numString = numString + 'quinze'
            elsif falta == 6
              numString = numString + 'dezesseis'
            elsif falta == 7
              numString = numString + 'dezessete'
            elsif falta == 8
              numString = numString + 'dezoito'
            elsif falta == 9
              numString = numString + 'dezenove'
            end
            #  Uma vez que já cuidamos do dígito das unidades,
            #  não há nada mais para escrever.
            falta = 0
          elsif escrevendo == 2
            numString = numString + 'vinte'
	  elsif escrevendo == 3
            numString = numString + 'trinta'
	  elsif escrevendo == 4
            numString = numString + 'quarenta'
	  elsif escrevendo == 5
            numString = numString + 'cinqüenta'
	  elsif escrevendo == 6
            numString = numString + 'sessenta'
	  elsif escrevendo == 7
            numString = numString + 'setenta'
	  elsif escrevendo == 8
            numString = numString + 'oitenta'
	  elsif escrevendo == 9
            numString = numString + 'noventa'
	  end
	  
          if falta > 0
            numString = numString + ' e '
          end
	end
	
	escrevendo = falta  #  Quantas unidades faltam escrever?
	falta  = 0     #  Subtraia estas unidades.
	
	if escrevendo > 0
	  if    escrevendo == 1
            numString = numString + 'um'
	  elsif escrevendo == 2
            numString = numString + 'dois'
	  elsif escrevendo == 3
            numString = numString + 'três'
	  elsif escrevendo == 4
            numString = numString + 'quatro'
	  elsif escrevendo == 5
            numString = numString + 'cinco'
	  elsif escrevendo == 6
            numString = numString + 'seis'
	  elsif escrevendo == 7
            numString = numString + 'sete'
	  elsif escrevendo == 8
            numString = numString + 'oito'
	  elsif escrevendo == 9
            numString = numString + 'nove'
	  end
	end
	
	if numString == ''
	  #  O único caso em que "numString" poderia ser vazio seria se
	  #  "numero" fosse 0.
	  return 'zero'
	end
	
	#  Se chegamos até aqui, então temos um número em algum lugar
	#  entre 0 e 100, então devemos retornar "numString".
	numString
      end
	  
      puts porExtenso(  0)
      puts porExtenso(  9)
      puts porExtenso( 10)
      puts porExtenso( 11)
      puts porExtenso( 17)
      puts porExtenso( 32)
      puts porExtenso( 88)
      puts porExtenso( 99)
      puts porExtenso(100)
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Bem, certamente há algumas coisas sobre este programa que
      eu não gosto.  Primeiro, há muita repetição.  Segundo,
      ele não lida com números maiores que 100.  Terceiro, há
      casos especiais demais, #{code 'return'}s demais.
      Vamos usar alguns arrays e tentar limpá-lo um pouco:
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