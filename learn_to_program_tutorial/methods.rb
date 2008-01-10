module Methods
  #
  #  METHODS
  #
  
  def generateMethods
    para do <<-END_PARAGRAPH
      Até agora nós vimos uma porção de métodos diferentes,
      #{code 'puts'} e #{code 'gets'}
      dentre outros (<em><strong>Pop Quiz:</strong>  Liste todos
      os métodos que vimos até agora!
      Foram dez deles; a resposta está mais em baixo.</em>),
      mas nós não conversamos realmente sobre o que são métodos.
      Nós sabemos o que eles fazem, mas
      não sabemos o que eles são.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Mas na verdade, isso <em>é</em> o que eles são:  coisas
      que fazem coisas.  Se objetos (como strings,
      inteiros e floats) são os substantivos na linguagem Ruby,
      os métodos são como os verbos.
      E, assim como no Português, você não pode ter um
      verbo sem um substantivo para <em>executar</em> o verbo.
      Por exemplo, contar o tempo não é algo que simplesmente acontece;
      um relógio (ou cronômetro, ou algo parecido) deve fazê-lo. Em
      Português diríamos "O relógio conta o tempo". Em Ruby dizemos
      #{code 'relogio.tick'} (assumindo que #{code 'relogio'}
      é um objeto Ruby, claro).
      Programadores podem dizer que estamos "chamando o método
      #{code 'tick'} do #{code 'relogio'},"
      ou que "chamamos #{code 'tick'} no #{code 'relogio'}."
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      E então, você respondeu o quiz? Bom. Bem, tenho
      certeza que você lembrou dos métodos
      #{code 'puts'}, #{code 'gets'} e #{code 'chomp'},
      que acabamos de ver. Você também provavelmente
      lembrou dos métodos de conversão,
      #{code 'to_i'}, #{code 'to_f'}
      e #{code 'to_s'}.  No entanto, você descobriu os
      outros quatro?  Por que, não eram ninguém menos
      que nossos velhos amigos da aritimética #{code '+'},
      #{code '-'}, #{code '*'} e #{code '/'}!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então como eu estava dizendo, assim como todo verbo precisa
      de um substantivo, todo método precisa de um objeto.
      Geralmente é fácil dizer qual objeto está executando o
      método: é aquilo que vem logo antes do ponto, como
      no nosso exemplo do #{code 'relogio.tick'}, ou em
      #{code '101.to_s'}.
      As vezes, no entanto, isso não é tão óbvio; como com os
      métodos aritiméticos. A bem da verdade,
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
      Não é muito bonito, então nós nunca iremos escrever desse jeito;
      no entanto, é importante entender o que <em>realmente</em> está
      acontecendo.
      (Na minha máquina, isso também me dá um <dfn>aviso</dfn>:
      #{output 'warning: parenthesize argument(s) for future version'}.
      O código ainda rodou sem problemas, mas ele está me dizendo que está com
      problemas para descobrir o que eu quis dizer e para usar mais parênteses no
      futuro).
      Isso também nos dá um entendimento mais profundo sobre por que podemos fazer
      #{code "'porco'*5"} mas não #{code "5*'porco'"}:  #{code "'porco'*5"} está
      dizendo ao #{code "'porco'"} para se multiplicar,
      mas #{code "5*'porco'"} está pedindo ao #{code '5'}
      que se multiplique.  #{code "'porco'"} sabe como fazer
      #{code '5'} cópias de si mesmo e juntá-las; no entanto, #{code '5'}
      vai ter muito mais dificuldade para fazer
      #{code "'porco'"} cópias de <em>si mesmo</em>
      e juntá-las.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      E, claro, nós ainda temos o #{code 'puts'}
      e o #{code 'gets'} para explicar.  Onde estão seus
      objetos?  Em Português, você pode as vezes omitir o
      substantivo; por exemplo, se um vilão grita "Morra!",
      o substantivo implícito é a pessoa com quem ele está
      gritando. Em Ruby, se dissermos
      #{code "puts 'ser ou não ser'"}, o que 
      eu realmente estou dizendo é
      #{code "self.puts 'to be or not to be'"}.
      Então o que é #{code 'self'}?  É uma variável especial
      que aponta para o objeto onde você está.
      Nós nem sabemos como esar <em>em</em> um
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
      apenas olhar nessa página novamente se esquecê-los.
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
      o propósito do dicionário? Para que você não <em>precise</em>
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
      var3 = 'Você consegue pronunciar esta frase ao contrário?'
      
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
      O problema está em #{code 'length'}:  ele te dá um número, mas queremos uma string.
      Fácil o bastante, vamos colocar um  #{code 'to_s'} (e cruzar os dedos):
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
      soma todos os tamanhos... hey, por que você não faz isso!  Vá em frente,
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
      Então, existem alguns métodos da string que conseguem mudar a caixa (maiúsculas
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
      de métodos, #{code 'letras'} continuou inalterada.  Eu não quero me prolongar nesse
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
      #{code 'center'} a largura do quão centralizado quer a string.  Então
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
      Hmmm... Eu não acho que essa rima é assim, mas sou muito preguiçoso
      para procurar.  (Também, eu queria alinhar a parte do
      #{code '.center lineWidth'}, por isso acrescentei espaços extra antes
      das strings.  Isso é só por que acho que fica mais bonito assim.
      Programadores geralmente têm fortes sentimentos sobre o que é
      bonito num programa, e eles geralmente discordam sobre o assunto.
      Quanto mais você programar, mais vai descobrir seu próprio estilo).
      Falando em ser preguiçoso, a preguiça nem sempre é algo ruim na programação.
      Por exemplo, viu como eu guardei a largura do poema numa variável
      #{code 'lineWidth'}?  Fiz isso pois se quiser tornar o poema mais
      largo mais tarde, só precisarei mudar a primeira linha do programa,
      ao invés de todas as linhas que são centralizadas.  Com um poema muito
      longo, isso poderia me poupar um bom tempo. Esse tipo de preguiça é na
      verdade uma virtude na programação.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So, about that centering... you may have noticed that it isn't quite
      as beautiful as what a word processor would have done.  If you really
      want perfect centering (and maybe a nicer font), then you should just use
      a word processor!  Ruby is a wonderful tool, but no tool is the right
      tool for <em>every</em> job.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      The other two string formatting methods are #{code 'ljust'} and
      #{code 'rjust'}, which stand for <dfn>left justify</dfn> and
      <dfn>right justify</dfn>.  They are similar to #{code 'center'}, except
      that they pad the string with spaces on the right and left sides,
      respectively.  Let's take a look at all three in action:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      lineWidth = 40
      str = '--> text <--'
      puts str.ljust  lineWidth
      puts str.center lineWidth
      puts str.rjust  lineWidth
      puts str.ljust (lineWidth/2) + str.rjust (lineWidth/2)
      END_CODE
    end
    h2 {'A Few Things to Try'}
    para do <<-END_PARAGRAPH
      &bull; Write an Angry Boss program.  It should rudely ask what you want.
      Whatever you answer, the Angry Boss should yell it back to you, and
      then fire you.  For example, if you type in #{input 'I want a raise.'}, it should yell back
      #{output 'WHADDAYA MEAN "I WANT A RAISE."?!?  YOU\'RE FIRED!!'}
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; So here's something for you to do in order to play around more with
      #{code 'center'}, #{code 'ljust'}, and #{code 'rjust'}:  Write a program
      which will display a Table of Contents so that it looks like this:
      END_PARAGRAPH
    end
    puts '<pre class="L2PoutputBlock">' +
          '                Table of Contents                ' + $/ +
          '                                                 ' + $/ +
          'Chapter 1:  Numbers                        page 1' + $/ +
          'Chapter 2:  Letters                       page 72' + $/ +
          'Chapter 3:  Variables                    page 118' + $/ +
          '</pre>'
    h2 {'Higher Math'}
    para do <<-END_PARAGRAPH
      <em>(This section is totally optional.  It assumes a fair degree
      of mathematical knowledge.  If you aren't interested, you
      can go straight to #{makeLink 'Flow Control', :generateFlowControl}
      without any problems.  However, a quick look at the section
      on <strong>Random Numbers</strong> might come in handy.)</em>
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      There aren't nearly as many number methods as there are string methods
      (though I still don't know them all off the top of my head).  Here, we'll
      look at the rest of the arithmetic methods, a random number generator,
      and the #{code 'Math'} object, with its trigonometric and transcendental
      methods.
      END_PARAGRAPH
    end
    h2 {'More Arithmetic'}
    para do <<-END_PARAGRAPH
      The other two arithmetic methods are #{code '**'} (exponentiation)
      and #{code '%'} (modulus).  So if you want to say "five squared"
      in Ruby, you would write it as #{code '5**2'}.  You can also use
      floats for your exponent, so if you want the square root of 5, you
      could write #{code '5**0.5'}.  The modulus method gives you the remainder
      after division by a number.  So, for example, if I divide 7 by 3,
      I get 2 with a remainder of 1.  Let's see it working in a program:
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
      From that last line, we learn that a (non-leap) year has some number
      of weeks, plus one day.  So if your birthday was on a Tuesday this year,
      it will be on a Wednesday next year.  You can also use floats with the modulus
      method.  Basically, it works the only sensible way it could... but I'll
      let you play around with that.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      There's one last method to mention before we check out the random number
      generator:  #{code 'abs'}.  It just takes the absolute value of the number:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts((5-2).abs)
      puts((2-5).abs)
      END_CODE
    end
    h2 {'Random Numbers'}
    para do <<-END_PARAGRAPH
      Ruby comes with a pretty nice random number generator.  The method to get
      a randomly chosen number is #{code 'rand'}.  If you call #{code 'rand'} just like
      that, you'll get a float greater than or equal to #{code '0.0'} and less
      than #{code '1.0'}.  If you give #{code 'rand'} an integer (#{code '5'}
      for example), it will give you an integer greater than or equal to
      #{code '0'} and less than #{code '5'} (so five possible numbers,
      from #{code '0'} to #{code '4'}).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Let's see #{code 'rand'} in action.  (If you reload this page, these numbers will
      change each time.  You did know I was actually running these programs, didn't you?)
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
      puts('The weatherman said there is a '+rand(101).to_s+'% chance of rain,')
      puts('but you can never trust a weatherman.')
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Note that I used #{code 'rand(101)'} to get back numbers from #{code '0'}
      to #{code '100'}, and that #{code 'rand(1)'} always
      gives back #{code '0'}.  Not understanding the range of possible return
      values is the biggest mistake I see people make with #{code 'rand'}; even professional
      programmers; even in finished products you can buy at the store.  I even
      had a CD player once which, if set on "Random Play," would play every song but
      the last one...  (I wonder what would have happened if I had put in a CD with
      only one song on it?)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Sometimes you might want #{code 'rand'} to return the <em>same</em> random numbers
      in the same sequence on two different runs of your program.  (For example, once I
      was using randomly generated numbers to create a randomly generated world for a computer
      game.  If I found a world that I really liked, perhaps I would want to play on it
      again, or send it to a friend.)  In order to do this, you need to set the
      <em>seed</em>, which you can do with #{code 'srand'}.  Like this:
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
      It will do the same thing every time you seed it with the same number.  If you want
      to get different numbers again (like what happens if you never use
      #{code 'srand'}), then just call #{code 'srand 0'}.  This seeds it with a
      really weird number, using (among other things) the current time on
      your computer, down to the millisecond.
      END_PARAGRAPH
    end
    h2 {"The #{code 'Math'} Object"}
    para do <<-END_PARAGRAPH
      Finally, let's look at the #{code 'Math'} object.  We might as well
      jump right in:
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
      The first thing you noticed was probably the #{code '::'}
      notation.  Explaining the <dfn>scope operator</dfn> (which is what that is)
      is really beyond the, uh... scope of this tutorial.  No pun
      intended.  I swear.  Suffice it to say, you can use
      #{code 'Math::PI'} just like you would expect to.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      As you can see, #{code 'Math'} has all of the things you would
      expect a decent scientific calculator to have.  And as always,
      the floats are <em>really close</em> to being the right answers.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So now let's #{makeLink 'flow', :generateFlowControl}!
      END_PARAGRAPH
    end
  end
end