module Beyond
  #
  #  BEYOND THIS TUTORIAL
  #
  
  def generateBeyond
    para do <<-END_PARAGRAPH
      Então, onde é que podemos ir agora? Se você tiver uma pergunta, 
      para quem pode perguntar?
      E se você quer que seu programa abra uma página da Web, envie um e-mail, 
      ou redimensione uma foto digital?
      Pois bem, há muitos, muitos lugares onde encontrar ajuda para Ruby. 
      Infelizmente, essa resposta nao tem muita utilidade, não é? :-)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			Para mim, realmente existem apenas três lugares onde procuro para ajuda 
			para o Ruby.
			Se for uma pequena questão e eu acho que posso experimentar sozinho para 
			encontrar a resposta, uso <dfn>irb</dfn>.
			Se for uma questão maior, procuro no meu <dfn>pickaxe</dfn>.
			E se simplesmente não consigo dar conta do recado, então peço ajuda na 
			lista <dfn>ruby-talk</dfn>.
      END_PARAGRAPH
    end
    h2 {'IRB: Ruby interativo'}
    para do <<-END_PARAGRAPH
			Se você instalou Ruby, então você instalou irb. Para usá-lo, basta ir 
			ao seu prompt de comando e digitar #{input 'irb'}.
			Quando você estiver em irb, você pode digitar qualquer expressão ruby 
			que você queira, e ele devolverá o valor da mesma. 
			Digite #{input '1 + 2'}, e devolverá #{output '3'}. 
			(Note que você não precisa usar #{code 'puts'}).
			É como uma espécie de calculadora Ruby gigante. Quando tiver concluído, 
			digite simplesmente #{input 'exit'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			Há muito mais do que isso a respeito do irb, mas você pode aprender 
			tudo sobre ele no pickaxe.
      END_PARAGRAPH
    end
    h2 {'O Pickaxe: "Programming Ruby"'}
    para do <<-END_PARAGRAPH
			<em>O</em> livro sobre Ruby absolutamente a não perder é 
			"Programming Ruby, The pragmáticas Programador's Guide",
			de Andrew Hunt e David Thomas (os Programadores Pragmáticos -Pragmatic Programmers-).
			Embora eu recomende altamente de escolher a 
			<a href="http://www.pragmaticprogrammer.com/titles/ruby/">2ª edição </a> 
			deste livro excelente, com a cobertura de todas as últimas novidades do Ruby, 
			você também pode obter uma versão on-line grátis de pouco mais antiga (mas ainda relevante). 
			(Na verdade, se você instalou a versão do Ruby para Windows, você já tem ela).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			Você pode encontrar praticamente tudo sobre Ruby, do básico ao avançado, 
			neste livro. É fácil de ler; é abrangente; é quase perfeito. Desejo que 
			todas as línguagens (de programação) tenham um livro desta qualidade. 
			Na parte final do livro, você encontrará uma enorme seção detalhando 
			cada método em cada classe, explicando-o e dando exemplos. 
			Eu simplesmente amo este livro!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			Há um número de lugares onde você pode obtê-lo (incluindo o próprio 
			site do Pragmatic Programmers), mas o meu lugar favorito é no 
      <a href="http://www.ruby-doc.org/docs/ProgrammingRuby/">ruby-doc.org</a>.
			Esta versão tem um bom índice de conteúdos, bem como um índice. 
			(no ruby-doc.org tem muitas outras ótimas documentações, tais como a 
			Core API e a Standard Library... Basicamente, isso documenta tudo que 
			vem com o Ruby. <a href="http://www.ruby-doc.org/">Verifique.</a>).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			E por que é chamado de "o pickaxe" -picareta-? 
			Pois bem, há uma imagem de um pickaxe na capa do livro. 
			É um nome bobo, eu suponho, mas pegou.
      END_PARAGRAPH
    end
    h2 {'Ruby-Talk: a Mailing List do Ruby'}
    para do <<-END_PARAGRAPH
			Mesmo com o irb e o pickaxe, às vezes você ainda pode não dar conta sozinho. 
			Ou talvez você queira saber se alguém já fez o que você está fazendo, 
			para ver se você pode utilizá-lo.
			Nestes casos, o melhor lugar é rubi-talk, a Mailing List do Ruby. 
			É cheia de gente amigável, inteligente, colaborativa. 
			Para saber mais sobre ela, ou para se inscrever, procure 
			<a href="http://www.ruby-lang.org/en/20020104.html">aqui</a>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      <strong>ATENÇÃO:</strong> Existe um <em>grande</em> número de e-mails 
			na lista todos os dias. Tenho a minha automaticamente enviada para 
			uma outra pasta de mail para que ela não fique no meu caminho.
			Se simplesmente não quer lidar com todos os e-mails, no entanto, 
			você não precisa lidar!
			A mailing list ruby-talk é espelhada no newsgroup comp.lang.ruby, 
			e vice-versa, assim você pode ver as mesmas mensagens lá.
			De qualquer maneira, você verá as mesmas mensagens, apenas em um 
			formato ligeiramente diferente.
      END_PARAGRAPH
    end
    h2 {'Tim Toady'}
    para do <<-END_PARAGRAPH
			Tenho tentado proteger você de algo com o que vai esbarrar em breve, 
			é o conceito de TMTOWTDI (pronunciado como "Tim Toady"): Há Mais De 
			Uma Maneira Para Fazer Isso -There's More Than One Way To Do It-.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			Agora alguns vão lhe dizer que TMTOWTDI é uma coisa maravilhosa, 
			enquanto outros se sentem bastante diferente.
			Eu realmente não tenho fortes sentimentos sobre o assunto em geral, 
			mas eu acho que é uma péssima maneira de ensinar para alguém como programar. 
			(Como se aprender uma maneira de fazer alguma coisa não fosse 
			suficientemente desafiante e confuso!).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			No entanto, agora que você está indo além deste tutorial, você verá 
			muito código diversificado. Por exemplo, posso pensar em pelo menos 
			cinco outras maneiras de criar uma string (além de circundar algum 
			texto com aspas simples), e cada um deles funciona de maneira um pouco 
			diferente. Eu só lhe mostrou o mais simples dos seis.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			E quando conversamos sobre ramificação -decisões-, mostrei para você 
			#{code 'if'}, mas não lhe mostrei #{code 'unless'}. 
			Eu vou deixá-lo entender isso no irb.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			Outro agradável atalho que você pode usar com #{code 'if'}, 
			#{code 'unless'}, #{code 'while'}, é a elegante versão de uma linha:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      #  Estas palavras são de um programa que escrevi para gerar
      #  Inglês-como babble. Bacana, não?
      puts 'grobably combergearl kitatently thememberate' if 5 == 2**2 + 1**1
      puts 'enlestrationshifter supposine follutify blace' unless 'Chris'.length == 5
      END_CODE
    end
    para do <<-END_PARAGRAPH
			E, finalmente, há uma outra forma de escrever métodos que recebem blocos 
			(não procs). Vimos isso onde recebemos o bloco e o transformamos em uma 
			proc usando o truque do #{code '&block'} na lista de parâmetros quando 
			se define a função. Depois, para chamar o bloco, você usa 
			#{code 'block.call'}. Pois bem, há um caminho mais curto (embora 
			pessoalmente eu o julgue mais confuso). Em vez disto:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def doItTwice(&block)
        block.call
        block.call
      end
      
      doItTwice do
        puts 'murditivent flavitemphan siresent litics'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      ...you do this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def doItTwice
        yield
        yield
      end
      
      doItTwice do
        puts 'buritiate mustripe lablic acticise'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
			Não sei ... O que você acha? Talvez seja eu, mas... #{code 'yield'}?! 
			Se fosse algo como #{code 'call_the_hidden_block'} ou algo assim, 
			faria <em>muito</em> mais sentido para mim. Muitas pessoas dizem que 
			#{code 'yield'} faz sentido para elas. Mas acho que esse é o propósito de 
			TMTOWTDI: eles fazem do jeito delas, e vou fazê-lo à minha maneira.
      END_PARAGRAPH
    end
    h2 {'O FIM'}
    para do <<-END_PARAGRAPH
			Use-o para o bem e não o mal. :-) E se você achou este tutorial útil 
			(ou confuso, ou se você encontrou um erro), 
			<a href="mailto:chris@pine.fm">me faça saber</a>!
      END_PARAGRAPH
    end

  end
end
