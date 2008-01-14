module Methods
  #
  #  METHODS
  #
  
  def generateMethods
    para do <<-END_PARAGRAPH
      Até agora nós vimos uma porção de métodos diferentes,
      #{code 'puts'} e #{code 'gets'}
      dentre outros (<em><strong>Teste Surpresa:</strong> Liste todos
      os métodos que vimos até agora!
      Foram dez deles; a resposta está mais embaixo.</em>),
      mas nós não conversamos realmente sobre o que são métodos.
      Nós sabemos o que eles fazem, mas não sabemos o que eles são.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Mas, na verdade, isso <em>é</em> o que eles são: coisas
      que fazem coisas.  Se objetos (como strings,
      inteiros e floats) são os substantivos na linguagem Ruby,
      os métodos são como os verbos.
      E, ao contrário do Português (em que há sujeitos indefinidos
      e outras construções esotéricas), você não pode ter um
      verbo sem um substantivo para <em>executar</em> o verbo. Mas mesmo
      o Português trata a ausência de um substantivo como exceção:
      por exemplo, contar o tempo não é algo que simplesmente acontece;
      um relógio (ou cronômetro, ou algo parecido) deve fazê-lo. Em
      Português diríamos: "O relógio conta o tempo". Em Ruby dizemos
      #{code 'relogio.tiquetaque'} (presumindo que #{code 'relogio'}
      é um objeto Ruby, claro).
      Programadores podem dizer que estamos "chamando o método
      #{code 'tiquetaque'} do #{code 'relogio'},"
      ou que "chamamos #{code 'tiquetaque'} no #{code 'relogio'}."
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      E então, você respondeu o quiz? Ótimo. Bem, tenho
      certeza que você lembrou dos métodos
      #{code 'puts'}, #{code 'gets'} e #{code 'chomp'},
      que acabamos de ver. Você também provavelmente
      lembrou dos métodos de conversão,
      #{code 'to_i'}, #{code 'to_f'}
      e #{code 'to_s'}.  No entanto, você descobriu os
      outros quatro?  Pois não eram ninguém menos
      que nossos velhos amigos da matemática, #{code '+'},
      #{code '-'}, #{code '*'} e #{code '/'}!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Como eu estava dizendo, todo método precisa de um objeto.
      Geralmente é fácil dizer qual objeto está executando o
      método: é aquilo que vem logo antes do ponto, como
      no nosso exemplo do #{code 'relogio.tiquetaque'}, ou em
      #{code '101.to_s'}.
      Às vezes, no entanto, isso não é tão óbvio; como com os
      métodos aritméticos. A bem da verdade,
      #{code '5 + 5'} é realmente apenas um atalho para se
      escrever #{code '5.+ 5'}.
      Por exemplo:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'olá '.+ 'mundo'
      puts (10.* 9).+ 9
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Não é muito bonito, então nós nunca mais vamos escrever desse jeito;
      no entanto, é importante entender o que <em>realmente</em> está
      acontecendo.
      (Na minha máquina, isso também me dá um <dfn>aviso</dfn>:
      #{output 'warning: parenthesize argument(s) for future version'}.
      O código ainda rodou sem problemas, mas ele está me dizendo que está com
      problemas para descobrir o que eu quis dizer, e pedindo para usar mais parênteses no
      futuro).
      Isso também nos dá um entendimento mais profundo sobre por que
      podemos fazer #{code "'porco'*5"} mas não #{code "5*'porco'"}:
      #{code "'porco'*5"} está dizendo ao #{code "'porco'"} para se
      multiplicar, mas #{code "5*'porco'"} está pedindo ao #{code '5'}
      que se multiplique.  #{code "'porco'"} sabe como fazer
      #{code '5'} cópias de si mesmo e juntá-las; no entanto, #{code '5'}
      vai ter muito mais dificuldade para fazer
      #{code "'porco'"} cópias de <em>si mesmo</em> e juntá-las.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      E, claro, nós ainda temos o #{code 'puts'}
      e o #{code 'gets'} para explicar.  Onde estão seus
      objetos?  Em Português, você pode às vezes omitir o
      substantivo; por exemplo, se um vilão grita "Morra!",
      o substantivo implícito é a pessoa com quem ele está
      gritando. Em Ruby, se dissermos
      #{code "puts 'ser ou não ser'"}, o que 
      eu realmente estou dizendo é
      #{code "self.puts 'ser ou não ser'"}.
      Então o que é #{code 'self'}?  É uma variável especial
      que aponta para o objeto onde você está.
      Nós nem sabemos como estar <em>em</em> um
      objeto ainda, mas até descobrirmos, nós
      estaremos sempre em um grande objeto que é...
      o programa inteiro! E para nossa sorte, o 
      programa tem alguns métodos próprios, como
      #{code 'puts'} e #{code 'gets'}.
      Preste atenção:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      naoAcreditoQueFizUmNomeDeVariavelTaoGrandeApenasParaGuardarUm3 = 3
      puts naoAcreditoQueFizUmNomeDeVariavelTaoGrandeApenasParaGuardarUm3
      self.puts naoAcreditoQueFizUmNomeDeVariavelTaoGrandeApenasParaGuardarUm3
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Se você não acompanhou tudo o que aconteceu, não tem problema.
      A coisa importante para aprender disso tudo é que cada
      métodos está sendo executado pelo mesmo objeto, mesmo
      que ele não esteja na sua frente. Se você entender isso, então
      está preparado.
      END_PARAGRAPH
    end
    h2 {'Métodos Elegantes da String'}
    para do <<-END_PARAGRAPH
      Vamos aprender alguns métodos divertidos da string.
      Você não precisa memorizar todos eles; você pode
      apenas olhar esta página novamente se esquecê-los.
      Eu só quero mostrar uma <em>pequena</em> parte do que
      as strings podem fazer. Na verdade, eu mesmo não lembro
      da metade dos métodos da string&mdash;mas não tem
      problema, pois existem ótimas referências na internet
      com todos os métodos da string listados e explicados.
      (Vou mostrar onde encontrá-los no final deste tutorial.)
      Pra falar a verdade, eu nem <em>quero</em> saber todos
      os métodos da string; é como saber todas as palavras do
      dicionário. Eu posso falar Português muito bem sem saber
      todas as palavras do dicionário... e esse não é exatamente
      o seu propósito? Para que você não <em>precise</em>
      saber tudo que está nele?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então, nosso primeiro método da string é o #{code 'reverse'},
      que nos dá uma versão ao contrário da string:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      var1 = 'pare'
      var2 = 'radar'
      var3 = 'Voce consegue pronunciar esta frase ao contrario?'
      
      puts var1.reverse
      puts var2.reverse
      puts var3.reverse
      puts var1
      puts var2
      puts var3
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Como você pode ver, #{code 'reverse'} não inverte a
      string original; ela apenas faz uma nova versão ao contrário dela.
      É por isso que #{code 'var1'} ainda é #{code "'pare'"}
      mesmo após a chamada a #{code 'reverse'} em #{code 'var1'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Outro método da string é #{code 'length'}, que nos diz
      o número de caracteres (incluindo espaços) na string:
      END_PARAGRAPH
    end
    prog ['Christopher David Pine'] do <<-END_CODE
      puts 'Qual o seu nome completo?'
      nome = gets.chomp
      puts 'Você sabia que seu nome possui ' + nome.length + ' caracteres, ' + nome + '?'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Uh-oh! Algo deu errado, e parece que isso aconteceu após a linha
      #{code 'nome = gets.chomp'}...  Você enxerga o problema?  Veja se consegue descobrir.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      O problema está em #{code 'length'}:  ele lhe dá um número, mas queremos uma string.
      Fácil, vamos colocar um  #{code 'to_s'} (e cruzar os dedos):
      END_PARAGRAPH
    end
    prog ['Christopher David Pine'] do <<-END_CODE
      puts 'Qual o seu nome completo?'
      nome = gets.chomp
      puts 'Você sabia que seu nome possui ' + nome.length.to_s + ' caracteres, ' + nome + '?'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Não, eu não sabia disso.  <strong>Nota:</strong>  este é o número de
      <em>caracteres</em> no meu nome, não o número de <em>letras</em>
      (conte-as).  Eu acho que conseguimos escrever um programa que
      pergunta seu primeiro nome, nome do meio e sobrenome individualmente e
      some todos os tamanhos... Ei, por que você não faz isso?  Vá em frente,
      eu espero.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Pronto? Bom! É um programa legal, não é?
      Depois de mais uns capítulos, entretanto, você vai ficar maravilhado com
      o que conseguirá fazer.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Existem alguns métodos da string que conseguem mudar a caixa (maiúsculas
      e minúsculas) da sua string.  #{code 'upcase'} muda todas as letras minúsculas
      para maiúsculas, e #{code 'downcase'} muda todas as letras maiúsculas para
      minúsculas.  #{code 'swapcase'} troca a caixa de todas as letras da string e,
      finalmente, #{code 'capitalize'} é parecido com #{code 'downcase'}, exceto que
      ele troca o primeiro caractere para maiúsculo (se for uma letra).
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      letras = 'aAbBcCdDeE'
      puts letras.upcase
      puts letras.downcase
      puts letras.swapcase
      puts letras.capitalize
      puts ' a'.capitalize
      puts letras
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Coisas bem simples. Como você pode ver na linha
      #{code "puts ' a'.capitalize"}, o método #{code 'capitalize'}
      apenas deixa em maiúsculo o primeiro <em>caractere</em>, não a primeira
      <em>letra</em>.  Também, como vimos anteriormente, durante todas essas chamadas
      de métodos, #{code 'letras'} continuou inalterada.  Eu não quero me alongar nesse
      ponto, mas é importante entender.  Existem alguns métodos que <em>mudam</em> o
      objeto associado, mas ainda não vimos nenhum, e nem iremos ver durante algum tempo.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      O último método elegante da string que iremos ver é
      para formatação visual.
      O primeiro, #{code 'center'}, adiciona espaços no começo e no
      fim da string para torná-la centralizada. No entanto, assim como
      você precisa dizer ao #{code 'puts'} o que quer que seja impresso, e ao
      #{code '+'} o que quer que seja adicionado, você precisa dizer ao
      #{code 'center'} a largura total da string a ser centralizada.  Então
      se eu quiser centralizar as linhas de um poema, eu faria assim:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      larguraDaLinha = 50
      puts(                'Old Mother Hubbard'.center(larguraDaLinha))
      puts(               'Sat in her cupboard'.center(larguraDaLinha))
      puts(         'Eating her curds an whey,'.center(larguraDaLinha))
      puts(          'When along came a spider'.center(larguraDaLinha))
      puts(         'Which sat down beside her'.center(larguraDaLinha))
      puts('And scared her poor shoe dog away.'.center(larguraDaLinha))
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Hum... Eu não acho que essa rima é assim, mas sou muito preguiçoso
      para procurar.  (Também, eu queria alinhar a parte do
      #{code '.center larguraDaLinha'}, por isso acrescentei espaços extra antes
      das strings.  Isso é só por que acho que fica mais bonito assim.
      Programadores geralmente têm opiniões fortes sobre o que é
      bonito num programa, e eles geralmente discordam sobre o assunto.
      Quanto mais você programar, mais vai descobrir seu próprio estilo).
      Falando em ser preguiçoso, a preguiça nem sempre é algo ruim na programação.
      Por exemplo, viu como eu guardei a largura do poema numa variável
      #{code 'larguraDaLinha'}?  Fiz isso pois se quiser tornar o poema mais
      largo mais tarde, só precisarei mudar a primeira linha do programa,
      ao invés de todas as linhas que são centralizadas.  Com um poema muito
      longo, isso poderia me poupar um bom tempo. Esse tipo de preguiça é na
      verdade uma virtude na programação.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então, em relação à centralização... você deve ter percebido que não está
      tão bonito quanto um processador de texto teria feito. Se você realmente
      quer centralização perfeita (e talvez uma fonte melhor), então você
      deveria apenas usar um processador de texto!  Ruby é uma ferramenta
      maravilhosa, mas nenhuma ferramenta é a ferramenta certa para
      <em>qualquer</em> trabalho.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Os outros dois métodos de formatação da string são #{code 'ljust'} e
      #{code 'rjust'}, que fazem o texto <dfn>justificado à esquerda</dfn> e
      <dfn>justificado à direita</dfn>.  Eles são parecidos com o #{code 'center'},
      exceto que eliminam os espaços em branco da string do lado direito e esquerdo,
      respectivamente.  Vamos ver os três em ação:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      larguraDaLinha = 40
      str = '--> text <--'
      puts str.ljust  larguraDaLinha
      puts str.center larguraDaLinha
      puts str.rjust  larguraDaLinha
      puts str.ljust (larguraDaLinha/2) + str.rjust (larguraDaLinha/2)
      END_CODE
    end
    h2 {'Umas Coisinhas Para Tentar'}
    para do <<-END_PARAGRAPH
      &bull; Escreva um programa do Chefe Zangado.  Ele deve perguntar o que você quer de forma rude.
      Qualquer que seja a sua resposta, o Chefe Zangado vai gritar de volta para você, e então
      despedi-lo.  Por exemplo, se você digitar #{input 'Eu quero um aumento.'}, ele deve gritar
      de volta #{output 'O QUE VOCÊ QUER DIZER COM "EU QUERO UM AUMENTO."?!?  VOCÊ ESTÁ DESPEDIDO!!'}
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Eis aqui algo para você fazer para brincar um pouco mais com
      #{code 'center'}, #{code 'ljust'} e #{code 'rjust'}:  Escreva um programa
      que irá mostrar um Índice de forma que fique parecido com:
      END_PARAGRAPH
    end
    puts '<pre class="L2PoutputBlock">' +
          '                Tabela de Conteúdo                ' + $/ +
          '                                                  ' + $/ +
          'Capítulo 1:  Números                      página 1' + $/ +
          'Capítulo 2:  Letras                      página 72' + $/ +
          'Capítulo 3:  Variáveis                  página 118' + $/ +
          '</pre>'
    h2 {'Matemática Avançada'}
    para do <<-END_PARAGRAPH
      <em>(Esta seção é totalmente opcional. Ela assume um certo nível
      de conhecimento matemático. Se você não estiver interessado, você pode
      ir direto para o #{makeLink 'Controle de Fluxo', :generateFlowControl}
      sem nenhum problema.  No entanto, uma breve passada pela seção de
      <strong>Números Aleatórios</strong> pode ser útil.)</em>
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Não há tantos métodos nos números quanto nas strings
      (apesar de eu ainda não ter decorado todos).  Aqui, iremos olhar o
      resto dos métodos de aritmética, um gerador de números aleatórios e
      o objeto #{code 'Math'}, com seus métodos trigonométricos e
      transcendentais.
      END_PARAGRAPH
    end
    h2 {'Mais Aritimética'}
    para do <<-END_PARAGRAPH
      Os outros dois métodos aritméticos são #{code '**'} (exponenciação)
      e #{code '%'} (módulo).  Então se você quisesse dizer "cinco ao quadrado"
      em Ruby, você escreveria #{code '5**2'}.  Você também pode usar
      floats para seu expoente, então se você quiser a raiz quadrada de 5,
      você pode escrever #{code '5**0.5'}.  O método módulo lhe dá o resto da
      divisão por um número.  Então, por exemplo, se eu divido 7 por 3,
      eu tenho 2 com resto 1. Vamos vê-los em ação num programa:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 5**2
      puts 5**0.5
      puts 7/3
      puts 7%3
      puts 365%7
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Pela última linha, aprendemos que um ano (não-bissexto) tem um certo
      número de semanas, mais um dia. Então se seu aniversário caiu numa
      terça-feira este ano, ele será numa quarta-feira no ano que vem.
      Você também pode usar floats com o método módulo.  Basicamente, ele
      funciona da única maneira razoável que consegue... Mas eu vou deixar
      você brincar um pouco com isso.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Tem um último método para ser mencionado antes de vermos o gerador de
      números aleatórios:  #{code 'abs'}.  Ele simplesmente pega o valor
      absoluto de um número:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts((5-2).abs)
      puts((2-5).abs)
      END_CODE
    end
    h2 {'Números Aleatórios'}
    para do <<-END_PARAGRAPH
      Ruby vem com um gerador de números aleatórios bem legal.  O método que
      escolhe aleatoriamente um número é o #{code 'rand'}.  Se você chamar #{code 'rand'}
      simplesmente assim, você vai ter um float maior ou igual a #{code '0.0'} e menor
      que #{code '1.0'}.  Se você der um inteiro (#{code '5'} por exemplo) para o #{code 'rand'},
      ele vai te dar um inteiro maior ou igual a #{code '0'} e menor que #{code '5'} (então são
      cinco números possíveis, de #{code '0'} até #{code '4'}).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Vamos ver o #{code 'rand'} em ação.  (Se você recarregar esta página, estes números vão
      mudar a cada vez.  Você sabia que eu estou realmente rodando estes programas, não sabia?)
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts rand
      puts rand
      puts rand
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(1))
      puts(rand(1))
      puts(rand(1))
      puts(rand(99999999999999999999999999999999999999999999999999999999999))
      puts('O homem do tempo disse que existe '+rand(101).to_s+'% de chance de chover,')
      puts('mas você não pode nunca confiar num homem do tempo.')
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Perceba que eu usei #{code 'rand(101)'} para conseguir os números de #{code '0'}
      até #{code '100'}, e que #{code 'rand(1)'} sempre retorna #{code '0'}.  Não entender o
      intervalo dos possíveis valores retornados é o maior erro que eu vejo as pessoas
      cometerem ao usar #{code 'rand'}; mesmo programadores profissionais; mesmo em
      produtos terminados que você pode comprar na loja.  Eu inclusive tive um tocador de CD
      que, se configurado para "Tocar Aleatoriamente", iria tocar todas as músicas menos
      a última...  (Eu imagino o que aconteceria se eu colocasse um CD com apenas uma música
      nele?)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      As vezes você pode querer que #{code 'rand'} retorne os <em>mesmos</em> números aleatórios
      na mesma sequência em duas execuções diferentes do seu programa.  (Por exemplo, uma vez eu
      estava usando números aleatórios gerados para criar um mundo gerado aleatoriamente num
      jogo de computador.  Se eu encontrasse um mundo que eu realmente gostasse, talvez eu quisesse
      jogar nele novamente, ou mandá-lo para um amigo).  Para isso, você precisa configurar
      a <em>semente</em>, que você consegue fazer com #{code 'srand'}.  Desta forma:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      srand 1776
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts ''
      srand 1776
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Ele fará a mesma coisa sempre que você alimentá-lo com a mesma semente.  Se você quer
      voltar a ter números diferentes (como acontece quando você nunca usa
      #{code 'srand'}), então apenas chame #{code 'srand 0'}.  Isso alimenta o gerador com
      um número realmente estranho, usando (dentre outras coisas) a hora atual do seu
      computador, com precisão de milisegundos.
      END_PARAGRAPH
    end
    h2 {"O Objeto #{code 'Math'}"}
    para do <<-END_PARAGRAPH
      Finalmente, vamos olhar para o objeto #{code 'Math'}.  Vamos começar de uma vez:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts(Math::PI)
      puts(Math::E)
      puts(Math.cos(Math::PI/3))
      puts(Math.tan(Math::PI/4))
      puts(Math.log(Math::E**2))
      puts((1 + Math.sqrt(5))/2)
      END_CODE
    end
    para do <<-END_PARAGRAPH
      A primeira coisa que você percebeu foi provavelmente a notação do #{code '::'}.  Explicar
      o <dfn>operador de escopo</dfn> (que é o que ele é) está um pouco além do, uh... escopo
      deste tutorial.  Não é nenhum trocadilho.  Eu juro.  Basta dizer que você pode usar
      #{code 'Math::PI'} exatamente da forma como você espera.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Como você pode ver, #{code 'Math'} tem todas as coisas que você esperaria que
      uma calculadora científica decente tivesse.  E, como sempre, os floats estão
      <em>realmente perto</em> de serem as respostas certas.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então vamos entrar no #{makeLink 'fluxo', :generateFlowControl}!
      END_PARAGRAPH
    end
  end
end
