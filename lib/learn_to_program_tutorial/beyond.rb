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
      Infelizmente, essa resposta não tem muita utilidade, não é? :-)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			Para mim, realmente existem apenas três lugares onde procuro para ajuda 
			para o Ruby.
			Se for uma pequena questão e eu acho que posso experimentar sozinho para 
			encontrar a resposta, uso <dfn>irb</dfn>.
			Se for uma questão maior, procuro no meu <dfn>Pickaxe</dfn>.
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
			tudo sobre ele no Pickaxe.
      END_PARAGRAPH
    end
    h2 {'O Pickaxe: "Programming Ruby"'}
    para do <<-END_PARAGRAPH
			<em>O</em> livro sobre Ruby que você não pode perder de jeito nenhum é 
			"Programming Ruby, The Pragmatic Programmer's Guide",
			de Andrew Hunt e David Thomas (os Programadores Pragmáticos).
			Embora eu recomende fortemente a 
			<a href="http://www.pragmaticprogrammer.com/titles/ruby/">2ª edição</a>
			deste livro excelente, com a cobertura de todas as últimas novidades do Ruby, 
			você também pode obter uma versão on-line grátis de pouco mais antiga (mas ainda relevante). 
			(Na verdade, se você instalou a versão do Ruby para Windows, você já tem ela).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			Você pode encontrar praticamente tudo sobre Ruby, do básico ao avançado, 
			neste livro. É fácil de ler; é abrangente; é quase perfeito. Eu gostaria
      que todas as linguagens (de programação) tivessem um livro desse nível. 
			Na parte final do livro, você encontrará uma enorme seção detalhando 
			cada método de cada classe, explicando-o e dando exemplos. 
			Eu simplesmente amo este livro!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			Há um sem número de lugares onde você pode obtê-lo (incluindo o próprio 
			site do Pragmatic Programmers), mas o meu lugar favorito é no 
      <a href="http://www.ruby-doc.org/docs/ProgrammingRuby/">ruby-doc.org</a>.
			Esta versão tem um bom índice , bem como um índice remessivo
			(no ruby-doc.org tem muitas outras ótimas documentações, tais como a 
			API Central (Core API) e a Biblioteca Padrão (Standard Library)...
      Basicamente, isso documenta tudo que vem com o Ruby.
      <a href="http://www.ruby-doc.org/">Verifique.</a>).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			E por que é chamado de "o Pickaxe" (picareta)?
            Pois bem, há uma imagem de uma picareta na capa do livro.
			É um nome bobo, eu acho, mas pegou.
      END_PARAGRAPH
    end
    h2 {'Ruby-Talk: uma lista de discussão sobre Ruby'}
    para do <<-END_PARAGRAPH
			Mesmo com o irb e o Pickaxe, às vezes você ainda pode não dar conta sozinho.
			Ou talvez você queira saber se alguém já fez o que você está fazendo, 
			para ver se você pode utilizá-lo.
			Nestes casos, o melhor lugar é ruby-talk, a lista de discussão do Ruby. 
			É cheia de gente amigável, inteligente, colaborativa. 
			Para saber mais sobre ela, ou para se inscrever, procure 
			<a href="http://www.ruby-lang.org/en/20020104.html">aqui</a>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      <strong>ATENÇÃO:</strong> Existe um <em>grande</em> número de e-mails 
			na lista todos os dias. Eu criei uma regra no meu cliente de e-mail
      para que não fique tudo na mesma pasta. Mas se você não quiser ter
      que fazer isso, você não precisa!
      A lista de discussão ruby-talk tem um espelho no grupo de notícias
      comp.lang.ruby, assim, você pode ver as mensagens por lá. Em suma,
      você verá as mesmas mensagens, mas de uma maneira um pouco diferente.
      END_PARAGRAPH
    end
    h2 {'Tim Toady'}
    para do <<-END_PARAGRAPH
			Tenho tentado proteger você de algo com o que vai esbarrar em breve, 
            é o conceito de TMTOWTDI (pronunciado como "Tim Toady"): There's More
            Than One Way To Do It (Há Mais De Uma Maneira Para Fazer Isso).
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
			diferente. Eu só lhe mostrei o mais simples dos seis.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
			E quando conversamos sobre ramificações, mostrei para você
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
      #  baboseiras em inglês. Bacana, não?
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
      def facaDuasVezes(&bloco)
        bloco.call
        bloco.call
      end
      
      facaDuasVezes do
        puts 'murditivent flavitemphan siresent litics'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      ...você faz isso:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def facaDuasVezes
        yield
        yield
      end
      
      facaDuasVezes do
        puts 'buritiate mustripe lablic acticise'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
			Não sei ... O que você acha? Talvez seja eu, mas... #{code 'yield'}?! 
			Se fosse algo como #{code 'chame_o_bloco_escondido'} (#{code 'call_the_hidden_block'})
      ou algo assim, faria <em>muito</em> mais sentido para mim. Muitas pessoas dizem que 
			#{code 'yield'} faz sentido para elas. Mas acho que esse é o propósito de 
			TMTOWTDI: elas fazem do jeito delas, e eu vou fazer à minha maneira.
      END_PARAGRAPH
    end
    h2 {'O FIM'}
    para do <<-END_PARAGRAPH
			Use-o para o bem e não para o mal. :-) E se você achou este tutorial útil 
			(ou confuso, ou se você encontrou um erro), 
			<a href="mailto:chris@pine.fm">me faça saber</a>!
      END_PARAGRAPH
    end

  end
end
