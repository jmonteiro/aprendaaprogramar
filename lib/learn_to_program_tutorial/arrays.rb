module Arrays
  #
  #  ARRAYS AND ITERATORS
  #						    
  
  def generateArrays
    para do <<-END_PARAGRAPH
      Vamos escrever um programa que nos permita entrar com quantas
      palavras quisermos (uma por linha, até pressionarmos <kbd>Enter</kbd>
      em uma linha vazia), e depois mostre as palavras em ordem alfabética. Ok?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então... primeiro nós iremos.. bem.. hum... Bom, poderíamos.. rsrsrs..
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Certo, não sei se podemos fazer isso. Precisamos de uma forma de armazenar
      um número qualquer de palavras, e de podermos acessá-las sem que se misturem
      com as outras variáveis. Precisamos colocá-las num tipo de lista. Precisamos
      dos <dfn>arrays</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Um array é apenas uma lista em seu computador. Cada item da lista
      se comporta como uma variável: você pode ver qual objeto um item está
      apontando, e você pode fazê-lo apontar para um outro objeto.
      Vamos dar uma olhada em alguns arrays:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      []
      [5]
      ['Olá', 'Tchau']
      
      sabor = 'baunilha'             #  isto não é um array, claro...
      [89.9, sabor, [true, false]]  #  ...mas isto é.
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Primeiro nós temos um array vazio, então um array contendo
      um único número, então um array contendo duas strings.
      Depois, temos uma atribuição simples; e aí um array 
      contendo três objetos, sendo que o último é um outro 
      array #{code '[true, false]'}. Lembre-se, variáveis não 
      são objetos, então, nosso último array está realmente
      apontando a para um float, uma <em>string</em> e um array.
      Mesmo que nós mudássemos o valor de #{code 'sabor'}, isso 
      não mudaria o array.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Para nos ajudar a encontrar um objeto qualquer num array,
      cada item tem um número de indexação. Programadores (e, aliás,
      a maioria dos matemáticos) iniciam contando do zero, então,
      o primeiro item do array é o item zero. Veja como podemos
      referenciar os objetos em um array:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      nomes = ['Ana', 'Maria', 'Cris']
      
      puts nomes
      puts nomes[0]
      puts nomes[1]
      puts nomes[2]
      puts nomes[3]  #  Isto está fora do intervalo
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Vemos então, que #{code 'puts nomes'} imprime cada nome do
      array #{code 'nomes'}. Então usamos #{code 'puts nomes[0]'}
      para imprimir o "primeiro" nome do array e #{code 'puts nomes[1]'}
      para imprimir o "segundo"... Tenho certeza que parece confuso,
      mas você <em>deve</em> se acostumar com isso. Você deve realmente
      começar a <em>acreditar</em> que contar inicia do zero e parar
      de usar palavras como "primeiro" e "segundo".
      Se você for num rodízio de pizza, não fale sobre o "primeiro"
      pedaço; fale sobre o pedaço zero (e na sua cabeça 
      pense #{code 'pedaco[0]'}).
      Você tem 5 dedos na sua mão e seus números são 0, 1, 2, 3 e 4.
      Minha esposa e eu somos malabariastas. Quando fazemos malabares
      com 6 pinos, estamos equilibrando os pinos 0 a 5. Felizmente,
      em alguns meses, estaremos equilibrando o pino 6 (e portanto, 
      equilibrando 7 pinos). Você saberá que conseguiu quando
      começar a usar o termo "zerésimo" :-) Sim, é uma palavra real..
      Pergunte a um programador ou matemático..
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Finalmente, nós tentamos #{code 'puts nomes[3]'}, apenas veja o que
      aconteceria.  Você estava esperando um erro?  Algumas vezes quando
      você faz uma pergunta, sua pergunta não faz sentido (pelo
      menos para seu computador); é quando obtém um erro.
      Algumas vezes, entretanto, você pode fazer uma pergunta e a resposta
      é <em>nada</em>.  O que está na posição três?  Nada.
      O que é #{code 'nomes[3]'}?  #{code 'nil'}:  A maneira Ruby
      de dizer "nada".  #{code 'nil'} é um objeto especial
      que basicamente significa "não é qualquer outro objeto."
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Se toda esta numeração divertida de posições de array está confundindo
      você, não tema!  Freqüentemente, nós podemos evitá-la completamente 
      usando vários métodos de array, como este:
      END_PARAGRAPH
    end
    h2 {"O Método #{code 'each'}"}
    para do <<-END_PARAGRAPH
      #{code 'each'} nos permite fazer algo (o que quer que nós
      desejemos) para #{code 'each'} (cada em português) objeto pertencente ao array.  Assim, se nós
      quiséssemos dizer algo bom sobre cada linguagem no array
      abaixo, nós faríamos isto:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      linguagens = ['Português', 'Inglês', 'Ruby']
      
      linguagens.each do |ling|
        puts 'Eu adoro ' + ling + '!'
        puts 'Você não?'
      end
      
      puts 'E vamos ouví-lo sobre C++!'
      puts '...'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Então, o que aconteceu?  Bem, nós fomos capazes de passar por
      todos os objetos no array sem usar nenhum número, e
      isto é muito bom.  Traduzindo para o português, o programa
      acima seria algo como:  Para #{code 'cada'} objeto
      em #{code 'linguagens'}, aponte a variável #{code 'ling'}
      para o objeto e então #{code 'faça'} (do em inglês) tudo que eu disser,
      até que você chegue ao #{code 'fim'} (end em inglês).  (Como você sabe,
      C++ é uma outra linguagem de programação.  É muito mais difícil de aprender
      do que Ruby; normalmente, um programa C++ será muitas vezes
      maior do que um programa Ruby que faz a mesma coisa.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Vocês poderiam estar pensando consigo mesmos, "Isto é muito parecido
      com os laços de repetição (loops) que nós aprendemos anteriormente."  Sim, é similar.
      Uma diferença importante é que o método #{code 'each'}
      é apenas:  um método.  #{code 'while'} e #{code 'end'}
      (como #{code 'do'}, #{code 'if'}, #{code 'else'}, e todas as outras palavras em
      <span class="L2Pcode"><span class="L2Pkeyword">#{KEYWORD_COLOR}</span></span>)
      não são métodos.  Elas são parte fundamental da linguagem
      Ruby, como #{code '='} e os parênteses; como os sinais
      de pontuações no português.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Mas não #{code 'each'}; #{code 'each'} é um apenas um outro
      método do array.  Métodos como #{code 'each'} que "atuam como"
      loops são freqüentemente chamados <dfn>iteradores</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Uma coisa para notar sobre iteradores é que eles são
      sempre seguidos por #{code 'do'}...#{code 'end'}.
      #{code 'while'} e #{code 'if'} nunca têm um #{code 'do'}
      perto deles; nós apenas usamos #{code 'do'} com iteradores.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Aqui está um outro atraente iteradorzinho, mas não é um
      método de array... é um método de inteiros!
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      3.times do
        puts 'Hip-Hip-Urra!'
      end
      END_CODE
    end
    h2 {'Mais Métodos de Array'}
    para do <<-END_PARAGRAPH
      Então nós aprendemos #{code 'each'},
      mas existem muitos outros métodos de array... quase tantos
      quantos existem métodos de string! Na verdade, alguns
      deles (como #{code 'length'}, #{code 'reverse'},
      #{code '+'}, e #{code '*'})
      funcionam da mesma forma que funcionam para strings, exceto que eles
      operam em posições de array ao invés de em
      letras de string. Outros, como #{code 'last'}
      e #{code 'join'}, são específicos para arrays. Ainda
      outros, como #{code 'push'} e #{code 'pop'},
      na verdade modificam o array.  E assim como com
      os métodos de string, você não tem que se lembrar de
      todos estes, desde que você possa se lembrar onde
      achar informações sobre eles (bem aqui).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Primeiro, vamos dar uma olhada em #{code 'to_s'} e #{code 'join'}.
      #{code 'join'} funciona de forma semelhante a #{code 'to_s'}, exceto
      que ele adiciona uma string entre os objetos do array.
      Vamos dar uma olhada:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      comidas = ['feijoada', 'tapioca', 'bolo de fubá']
      
      puts comidas
      puts
      puts comidas.to_s
      puts
      puts comidas.join(', ')
      puts
      puts comidas.join('  :)  ') + '  8)'
      
      200.times do
        puts []
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Como você pode ver, #{code 'puts'} trata os arrays diferentemente
      de outros objetos:  ele apenas chama #{code 'puts'} em cada um
      dos objetos no array.  É por isso que chamar #{code 'puts'} para um
      um array vazio 200 vezes não faz nada; o array não aponta
      para nada, assim não há nada para o #{code 'puts'} mostrar (Fazer
      nada 200 vezes ainda é fazer nada).
      Tente chamar #{code 'puts'} para um array contendo outros arrays;
      fez o que você esperava?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Você também notou que eu deixei uma string vazia quando
      eu quis #{code 'mostrar'} uma linha em branco?  Isto faz a mesma
      coisa.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Agora vamos dar uma olhada em #{code 'push'}, #{code 'pop'},
      e #{code 'last'}.  Os métodos #{code 'push'} e #{code 'pop'}
      são de alguma forma opostos,
      assim como #{code '+'} e #{code '-'} são.  #{code 'push'} adiciona
      um objeto no fim do seu array, e #{code 'pop'}
      remove o último objeto do array (e diz para você
      qual era este objeto).  #{code 'last'} é similar a #{code 'pop'}
      em dizer para você o que está no fim do array,
      exceto que o #{code 'last'} deixa o array em paz.
      Novamente, #{code 'push'} e #{code 'pop'} <em>realmente
      modificam o array</em>:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      favoritos = []
      favoritos.push 'azul e branco'
      favoritos.push 'verde e amarelo'
      
      puts favoritos[0]
      puts favoritos.last
      puts favoritos.length
      
      puts favoritos.pop
      puts favoritos
      puts favoritos.length
      END_CODE
    end
    h2 {'Algumas Coisas para Tentar'}
    para do <<-END_PARAGRAPH
      &bull; Escreva o programa que nós comentamos no início
      deste capítulo.<br />
      <em><strong>Dica:</strong>  Existe um adorável
      método de array que dará a você uma versão ordenada de um 
      array:  </em>#{code 'sort'}<em>.  Use-o!</em>
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Tente escrever o programa acima <em>sem</em> usar
      o método #{code 'sort'}.  Uma grande parte da programação é
      resolver problemas, assim pratique o máximo que você puder!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Re-escreva seu programa de Tabela de Conteúdos (do capítulo
      #{makeLink 'métodos', :generateMethods}).  Inicie o programa
      com um array que mantém todas as informações sobre sua Tabela
      de Conteúdos (nomes de capítulos, números de páginas, etc.).  Então imprima
      na tela a informação do array em uma Tabela de Conteúdos,
      formatada de forma bem bonita.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Até o momento aprendemos bastante sobre um número de métodos diferentes.
      Agora é hora de aprender como
      #{makeLink 'fazer seus próprios métodos', :generateDefMethod}.
      END_PARAGRAPH
    end
  end
end
