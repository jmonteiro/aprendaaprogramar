module FlowControl
  #
  #  FLOW CONTROL
  #
  
  def generateFlowControl
    para do <<-END_PARAGRAPH
      Ahhhh, controle de fluxo. É aqui que tudo se junta. Ainda que
      este capítulo seja mais curto e fácil que o capítulo sobre
      #{makeLink 'métodos', :generateMethods}, ele vai abrir um mundo de
      possibilidades de programação.
      Após este capítulo, poderemos escrever programas realmente interativos;
      antes fizemos programas que <em>dizem</em> coisas diferentes
      dependendo do que você escreve, mas após este capítulo eles
      <em>farão</em> coisas diferentes, também. Todavia, temos que poder
      comparar objetos no nosso programa. Precisamos de...
      END_PARAGRAPH
    end
    h2 {'Métodos de Comparação'}
    para do <<-END_PARAGRAPH
      Vamos ser rápidos por aqui para chegar até as <strong>ramificações</strong>,
      que é onde as coisas legais começam a acontecer.
      Para ver se um objeto é maior ou menor que outro, usamos
      os métodos #{code '>'} e #{code '<'}, assim:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 1 > 2
      puts 1 < 2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Tudo em ordem. Do mesmo modo, podemos descobrir se um objeto
      é maior-ou-igual-que (ou menor-ou-igual-que) outro com os métodos
      #{code '>='} e #{code '<='}.
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 5 >= 5
      puts 5 <= 4
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Por fim, podemos descobrir se dois objetos são iguais
      ou não usando #{code '=='} (que significa "estes objetos são iguais?")
      e #{code '!='} (que significa "estes objetos são diferentes?").
      É importante não confundir #{code '='} com #{code '=='}. #{code '='}
      serve para dizer a uma variável que aponte para um objeto
      (atribuição), e #{code '=='} é para fazer a pergunta: "Estes dois
      objetos são iguais?".
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 1 == 1
      puts 2 != 1
      END_CODE
    end
    para do <<-END_PARAGRAPH
      E é claro que também podemos comparar strings. Quando strings
      são comparadas, leva-se em conta seus <dnf>ordenamentos
      lexicográficos</dfn>, que, trocando em miúdos, significa a ordem delas
      no dicionário. #{code 'cachorro'} vem antes de #{code 'gato'} no
      dicionário, então:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'cachorro' < 'gato'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Há um porém: os computadores costumam ordenar letras
      maiúsculas antes de minúsculas, como se viessem antes (é assim que
      guardam as letras em fontes, por exemplo: todas as letras
      maiúsculas primeiro, seguidas das minúsculas).
      Isso significa que o computador vai pensar que #{code "'Zoológico'"} vem
      antes de #{code "'abelha'"}, então se você quiser descobrir qual
      palavra viria primeiro num dicionário de verdade, use #{code 'downcase'}
      (ou #{code 'upcase'} ou #{code 'capitalize'}) em ambas as palavras
      antes de tentar compará-las.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Uma última observação antes de <strong>Ramificações</strong>: os
      métodos de comparação não estão nos dando as strings #{code "'true'"}
      e #{code "'false'"}; elas estão nos dando os objetos especiais
      #{code 'true'} e #{code 'false'} (claro, #{code 'true.to_s'} nos dá
      #{code "'true'"}, que é como #{code 'puts'} imprimiu #{code "'true'"}).
      #{code 'true'} e #{code 'false'} são usados o tempo todo em...
      END_PARAGRAPH
    end
    h2 {'Ramificações (Branching)'}
    para do <<-END_PARAGRAPH
      "Ramificação" é um conceito simples, mas poderoso. Na verdade,
      é tão simples que aposto que nem tenho que explicá-lo; deixa
      eu mostrar para você:
      END_PARAGRAPH
    end
    executa1 = {:input => ['Chris']}
    executa2 = {:input => ['Chewbacca'], :remark => 'Mas se colocarmos um nome diferente...'}
    progN executa1, executa2 do <<-END_CODE
      puts 'Olá, qual é o seu nome?'
      nome = gets.chomp
      puts 'Olá, ' + nome + '.'
      if nome == 'Chris'
        puts 'Que nome bonito!'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      E isso é ramificar. Se o que vem depois de #{code 'if'} (N.T.&mdash;se) é
      #{code 'true'}, nós executamos o código entre #{code 'if'} e 
      #{code 'end'}. Se o que vem depois de #{code 'if'} é #{code 'false'},
      não executamos nada. Claro e simples.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Eu indentei o código entre #{code 'if'} e #{code 'end'} porque
      acho que fica mais fácil acompanhar as ramificações assim. Quase
      todos os programadores fazem isso, independente da linguagem
      em que estejam trabalhando. Pode não parecer muito útil neste
      exemplo pequeno, mas quando as coisas ficam mais complexas,
      faz uma baita diferença.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Muitas vezes gostaríamos que um programa fizesse uma coisa se
      uma expressão for #{code 'true'}, e outra se for #{code 'false'}.
      É para isso que serve #{code 'else'}:
      END_PARAGRAPH
    end
    executa1 = {:input => ['Chris']}
    executa2 = {:input => ['Ringo'], :remark => 'Agora vamos tentar um nome diferente...'}
    progN executa1, executa2 do <<-END_CODE
      puts 'Eu sou um vidente. Diga-me seu nome:'
      nome = gets.chomp
      if nome == 'Chris'
        puts 'Vejo coisas maravilhosas no seu futuro.'
      else
        puts 'Seu futuro é... Ó, Deus! Olha a hora!'
        puts 'Eu tenho que ir, mil perdões!'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Ramificar é como deparar com uma bifurcação no código: tomamos
      o caminho para as pessoas com o #{code "nome == 'Chris'"} ou
      #{code 'else'}, tomamos o outro caminho?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      E como os galhos de uma árvore, você pode ter ramificações
      que contêm suas próprias ramificações:
      END_PARAGRAPH
    end
    executa1 = {:input => ['chris', 'sim']}
    executa2 = {:input => ['Chris'], :remark => 'Está bem, vou capitalizar...'}
    progN executa1, executa2 do <<-END_CODE
      puts 'Olá, e bem-vindo à aula de Português.'
      puts 'Meu nome é professora Hélia. Seu nome é...?'
      nome = gets.chomp
      
      if nome == nome.capitalize
        puts 'Por favor, sente-se, ' + nome + '.'
      else
        puts nome + '?  Você quer dizer ' + nome.capitalize + ', não é?'
        puts 'Você não sabe nem escrever seu nome??'
        resposta = gets.chomp
        
        if resposta.downcase == 'sim'
          puts 'Hunf! Vá, sente-se!'
        else
          puts 'FORA!!!'
        end
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Às vezes pode ficar confuso entender onde colocar os
      #{code 'if'}s, #{code 'else'}s e #{code 'end'}s. O que eu faço
      é escrever o #{code 'end'} <em>ao mesmo tempo</em> que escrevo
      o #{code 'if'}. Então enquanto eu estava escrevendo o programa
      acima, ele estava primeiro assim:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Olá, e bem-vindo à aula de Português.'
      puts 'Meu nome é professora Hélia. Seu nome é...?'
      nome = gets.chomp
      
      if nome == nome.capitalize
      else
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Aí eu preenchi com <dfn>comentários</dfn>, coisas no
      código que o computador irá ignorar:
      END_PARAGRAPH
	end
    prog false do <<-END_CODE
      puts 'Olá, e bem-vindo à aula de Português.'
      puts 'Meu nome é professora Hélia. Seu nome é...?'
      nome = gets.chomp
      
      if nome == nome.capitalize
        #  Ela é cordial.
      else
        #  Ela fica brava.
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Qualquer coisa após um #{code '#'} é considerado um comentário (a
      não ser, é claro, que você esteja em uma string). Depois de preencher
      com comentários, substituí-os por código funcional. Algumas
      pessoas gostam de deixá-los no arquivo; particularmente, creio
      que código bem-escrito fala por si. Eu costumava escrever
      mais comentários, mas quanto mais "fluente" fico em Ruby, menos
      faço uso deles. Eles me distraem boa parte do tempo. É uma escolha
      individual; você vai encontrar o seu estilo (normalmente em
      constante evolução). Então meu próximo passo ficou assim:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Olá, e bem-vindo à aula de Português.'
      puts 'Meu nome é professora Hélia. Seu nome é...?'
      nome = gets.chomp
      
      if nome == nome.capitalize
        puts 'Por favor, sente-se, ' + nome + '.'
      else
        puts nome + '?  Você quer dizer ' + nome.capitalize + ', não é?'
        puts 'Você não sabe nem escrever seu nome??'
        resposta = gets.chomp
        
        if resposta.downcase == 'sim'
        else
        end
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Mais uma vez escrevi #{code 'if'}, #{code 'else'} e #{code 'end'}
      ao mesmo tempo. Realmente me ajuda a saber "onde estou" no código.
      Também faz com que o trabalho pareça mais fácil porque posso me 
      concentrar em uma parte pequena, como preencher o código entre
      #{code 'if'} e #{code 'else'}. Uma outra vantagem de fazê-lo
      desta maneira é que o computador pode entender o programa em
      qualquer estágio. Qualquer uma das versões inacabadas do
      programa que eu lhe mostrei rodariam. Elas não estavam terminadas,
      mas eram programas funcionais. Desta maneira eu pude testar
      enquanto escrevia, o que me ajudou a ver como o programa
      progredia e o que precisava ser melhorado. Quando ele passou
      em todos os testes, eu soube que estava pronto!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Essas dicas vão ajudá-lo a escrever programas que se ramificam,
      mas também ajudam com outro tipo central de controle de fluxo:
      END_PARAGRAPH
    end
    h2 {'Repetição (Looping)'}
    para do <<-END_PARAGRAPH
      Você vai querer com alguma freqüência que o computador faça a mesma
      coisa várias e várias vezes&mdash;afinal, é nisso que os computadores,
      em teoria, são bons.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Quando você manda o seu computador ficar repetindo algo, você
      também precisa dizê-lo quando parar. Computadores nunca se entediam,
      então se você não mandar o seu parar, ele não parará. Garantimos
      que isso não aconteça ao dizermos que ele deve repetir certas partes
      de um programa #{code 'while'} (N.T.&mdash;enquanto) uma condição
      especificada for verdadeira. O funcionamento é bem parecido com o do
      #{code 'if'}:
      END_PARAGRAPH
    end
    prog ['Olá?', 'Oi!', 'Muito prazer em conhecê-lo.', 'Ah... que amor!', 'tchau'] do <<-END_CODE
      comando = ''
      
      while comando != 'tchau'
        puts comando
        comando = gets.chomp
      end
      
      puts 'Volte logo!'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      E isso é um loop (você deve ter notado a linha em branco no começo
      da saída; ela vem do primeiro #{code 'puts'}, antes do primeiro
      #{code 'gets'}. Como você modificaria o programa para se livrar
      dessa primeira linha? Teste! Funcionou <em>exatamente</em> como o
      programa acima, fora aquela primeira linha em branco?).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Loops, ou repetições, permitem que você faça várias coisas
      interessantes, como sei que você pode imaginar. Mas também
      podem causar problemas se você cometer algum erro. E se o computador
      ficar preso num loop infinito? Se você acha que isso pode ter acontecido,
      é só segurar a tecla <kbd>Ctrl</kbd> e pressionar <kbd>C</kbd>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Antes de começarmos a brincar com loops, vamos aprender algumas
      coisinhas para facilitar nossa vida.
      END_PARAGRAPH
    end
    h2 {'Um Pouco de Lógica'}
    para do <<-END_PARAGRAPH
      Vamos dar uma olhada no nosso primeiro programa com ramificações. E
      se minha esposa chegasse em casa, visse o programa, tentasse usá-lo
      e ele não dissesse que nome bonito <em>ela</em> tem? Eu não
      gostaria de magoá-la (ou de dormir no sofá), então vamos reescrevê-lo:
      END_PARAGRAPH
    end
    prog ['Katy'] do <<-END_CODE
      puts 'Olá, qual é o seu nome?'
      nome = gets.chomp
      puts 'Olá, ' + nome + '.'
      if nome == 'Chris'
        puts 'Que nome bonito!'
      else
        if nome == 'Katy'
          puts 'Que nome bonito!'
        end
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Bom, funciona... mas não é lá um programa muito bonito. E por quê?
      A melhor regra que eu aprendi sobre programação foi a regra
      <dfn>DRY</dfn>: <dfn>Don't Repeat Yourself</dfn>
      (N.T.&mdash;Não Se Repita). Eu poderia escrever um livro só sobre
      o quão boa ela é. No nosso caso, repetimos a linha 
      #{code 'Que nome bonito!'}. Por que é que isso é um problema? Bem,
      e se eu cometi um erro de digitação quando eu reescrevi? E se eu
      quisesse mudar de #{code 'bonito'} para #{'gracioso'} em ambas
      as linhas? Eu sou preguiçoso, lembra? Basicamente, se eu quero
      que meu programa faça a mesma coisa quando receber #{code 'Chris'} ou
      #{code 'Katy'}, então ele realmente deve fazer <em>a mesma coisa</em>:
      END_PARAGRAPH
    end
    prog ['Katy'] do <<-END_CODE
      puts 'Olá, qual é o seu nome?'
      nome = gets.chomp
      puts 'Olá, ' + nome + '.'
      if (nome == 'Chris' or nome == 'Katy')
        puts 'Que nome bonito!'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Muito melhor.  Para que funcionasse, usei #{code 'or'}. Os outros
      <em>operadores lógicos</em> são #{code 'and'} e #{code 'not'}. É
      sempre bom usar parênteses ao trabalhar com eles. Vamos ver como
      funcionam:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      euSouChris  = true
      euSouRoxo = false
      euAmoComida = true
      euComoPedras = false
      
      puts (euSouChris and euAmoComida)
      puts (euAmoComida and euComoPedras)
      puts (euSouRoxo and euAmoComida)
      puts (euSouRoxo and euComoPedras)
      puts
      puts (euSouChris or euAmoComida)
      puts (euAmoComida or euComoPedras)
      puts (euSouRoxo or euAmoComida)
      puts (euSouRoxo or euComoPedras)
      puts
      puts (not euSouRoxo)
      puts (not euSouChris)
      END_CODE
    end
    para do <<-END_PARAGRAPH
      O único deles que pode enganá-lo é #{code 'or'} (N.T.&mdash;ou). 
      Em português, usa-se "ou" para dizer "um ou outro, mas não os dois".
      Por exemplo, sua mãe pode lhe dizer: "Para sobremesa você pode escolher
      torta ou bolo". Ela <em>não</em> deu a opção de escolher os dois!
      Um computador, por outro lado, entende #{code 'or'} como "ou um ou outro,
      ou os dois" (outro jeito de colocar é "ao menos um destes é verdadeiro").
      É por isso que computadores são mais legais que mães.
      END_PARAGRAPH
    end
    h2 {'Umas Coisinhas Para Tentar'}
    para do <<-END_PARAGRAPH
      &bull; <em>"Um elefante incomoda muita gente..."</em>  Escreva um
      programa que imprima a letra para o clássico das viagens de
      carro, com um limite de 100 elefantes.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Escreva um programa Velha Surda.  O que quer que
      você diga à velha (o que quer que você digite), ela tem
      que responder com #{output 'QUE?! FALA MAIS ALTO!'}, a não
      ser que você grite (digite tudo em maiúsculas). Se você 
      gritar, ela pode lhe ouvir (ou ao menos pensa que pode), e
      sempre responde #{output 'NÃO, NÃO DESDE 1938!'}  Para fazer seu
      programa ser realmente verossímil, faça a velha gritar
      um número diferente a cada vez; talvez qualquer ano aleatório
      entre 1930 e 1950 (a última parte é opcional, e ficaria muito
      mais fácil se você lesse a seção sobre o gerador de números
      randômicos do Ruby no capítulo sobre 
      #{makeLink 'métodos', :generateMethods}). Você não pode parar
      de falar com a velha enquanto não gritar #{input 'TCHAU'}.<br />
      <em><strong>Dica:</strong> Não esqueça do </em>#{code 'chomp'}
      <em>!  </em>#{code "'TCHAU'"} com um enter não é a mesma coisa que
      #{code "'TCHAU'"} sem!
      <em><strong>Dica 2:</strong>  Tente pensar em que partes do programa
      as coisas acontecem repetidamente. Todas elas devem estar no seu
      loop #{code 'while'}.</em>
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Melhore o seu programa Velha Surda: e se a velha
      não quiser que você vá embora? Quando você gritar #{input 'TCHAU'},
      ela pode fingir que não lhe ouve. Mude seu programa anterior
      para que você tenha que gritar #{input 'TCHAU'} três vezes <em>em
      seqüência</em>. Teste bem o seu programa: se você gritar 
      #{input 'TCHAU'} três vezes, mas não em seqüência, você tem
      que continuar falando com a velha.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Anos bissextos. Escreva um programa que pergunte um
      ano inicial e um ano final, e imprima com #{code 'puts'} todos
      os anos bissextos entre eles (e os incluindo, se eles também
      forem bissextos). Anos bissextos são sempre divisíveis por
      quatro (como 1984 e 2004). Contudo, anos divisíveis por 100
      <em>não</em> são bissextos (como 1800 e 1900)
      <strong><em>a não ser que</em></strong> sejam divisíveis por
      400 (como 1600 e 2000, que foram de fato anos bissextos).
      <em>(Sim, é bem confuso, mas não tão confuso como ter dezembro
      no meio do inverno, que é o que aconteceria no fim).</em>
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Quando você terminá-las, descanse um pouco! Você já aprendeu
      muitas coisas. Parabéns. Você está surpreso com a quantidade
      de coisas que se pode mandar o computador fazer? Mais alguns capítulos
      e você vai poder programar praticamente tudo. Sério mesmo!
      Veja só tudo que você pode fazer que não podia antes de aprender
      sobre loops e ramificações.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Agora vamos aprender sobre um novo tipo de objeto, que
      controla listas de outros objetos:
      #{makeLink 'arrays', :generateArrays}.
      END_PARAGRAPH
    end
  end
end
