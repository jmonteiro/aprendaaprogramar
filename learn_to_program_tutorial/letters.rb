module Letters
  #
  #  LETRAS
  #
  
  def generateLetters
    para do <<-END_PARAGRAPH
      Assim nós aprendemos tudo sobre #{makeLink('numbers', :generateNumbers)},
      mas que tal letras?  palavras?  texto?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Nós nos referimos aos grupos de letras em um programa como <dfn>strings</dfn>.  (Você pode
      pensar nas letras impressas em um banner.)
      Para tornar mais fácil ver apenas que parte do código está em uma string,
      Eu colorirei as strings
      <span class="L2Pcode"><span class="L2Pstring">#{@@STRING_COLOR}</span></span>.
      Aqui estão algumas strings:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      'Olá.'
      'Ruby detona.'
      '5 é meu número favorito... qual é o seu?'
      'Snoopy diz #%^?&*@! quando ele tropeça.'
      '     '
      ''
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Como você pode ver, strings podem ter pontuação, dígitos, simbolos,
      e espaços nelas... mais do que apenas letras.  Esta última string
      não tem nada nela; nós poderíamos chamá-la <dfn>string vazia</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Nós usamos #{code 'puts'} para imprimir números;
      vamos tentar com algumas strings:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Olá, mundo!'
      puts ''
      puts 'Adeus.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Isso funcionou bem.  Agora tente algumas strings de sua autoria.
      END_PARAGRAPH
    end
    h2 {'Aritmética de Strings'}
    para do <<-END_PARAGRAPH
      Assim como você pode fazer aritmética com números, você também pode fazer
      aritmética com strings!  Bem, tipo... você pode adicionar strings, de qualquer maneira.
      Vamos tentar adicionar duas strings e ver o que
      #{code 'puts'} faz com elas.
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Eu gosto de' + 'torta de maçã.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Oopa!  Eu esqueci de colocar espaço entre #{code "'Eu gosto de'"} e #{code "'torta de maçã.'"}.
      Espaços não têm importância normalmente, mas eles têm importância dentro de strings.
      (É verdade o que eles dizem:  computadores não fazem o que você <em>quer</em>
      que eles façam, apenas o que você <em>diz</em> para eles fazerem.)  Vamos tentar novamente:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Eu gosto de ' + 'torta de maçã.'
      puts 'Eu gosto de' + ' torta de maçã.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      (Como você pode ver, não importa em qual string eu adicionei o espaço.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então você pode adicionar strings, mas você pode também multiplicá-las!
      (Por um número, de qualquer maneira.)  Observe isto:
      END_PARAGRAPH
    end
    prog [], '(Brincadeirinha... realmente faz isto:)', 'piscando os olhos dela' do <<-END_CODE
      puts 'piscar ' * 4
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Se você analisar, isto faz um perfeito sentido.  Concluindo,
      #{code '7*3'} realmente significa #{code '7+7+7'}, assim #{code "'muu'*3"} 
      significa #{code "'muu'+'muu'+'muu'"}.
      END_PARAGRAPH
    end
    h2 {"#{code '12'} vs #{code "'12'"}"}
    para do <<-END_PARAGRAPH
      Antes de nós avançarmos, nós deveríamos assegurar que nós entendemos a
      diferença entre <em>números</em> e <em>dígitos</em>.
      #{code '12'} é um número, mas #{code "'12'"} é uma string de dois dígitos.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Vamos brincar com isto por enquanto:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts  12  +  12
      puts '12' + '12'
      puts '12  +  12'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Que tal isto:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts  2  *  5
      puts '2' *  5
      puts '2  *  5'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Estes exemplos foram bem diretos.  Entretando, se você não for muito
      cuidadoso em como misturar strings e seus números, você poderá cair em...
      END_PARAGRAPH
    end
    h2 {'Problemas'}
    para do <<-END_PARAGRAPH
      Neste ponto você pode ter tentado umas poucas coisas que
      <em>não</em> funcionaram.  Se não, aqui estão algumas:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts '12' + 12
      puts '2' * '5'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Hummmm... uma mensagem de erro.  O problema é que você
      não pode realmente adicionar um número a uma string, ou multiplicar uma
      string por outra.  Isto não faz mais sentido do que isto:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Betty' + 12
      puts 'Fred' * 'John'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Alguma coisa a mais para ter cuidado:  você pode escrever #{code "'porco'*5"} em um programa,
      pois isto signifique #{code '5'} conjuntos da string #{code "'porco'"} todas adicionadas
      juntas.  Entretanto,
      você <em>não</em> pode escrever #{code "5*'porco'"}, pois isto significa #{code "'porco'"}
      conjuntos do número #{code '5'}, o que é uma tolice.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Finalmente, e se eu quiser um programa para imprimir
      #{output 'Marca d\'água!'}?  Nós podemos tentar isto:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Marca d'água!'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Bem, <em>isto</em> não funcionará; Eu nem mesmo tentarei executar isto.
      O computador pensou que nós tivessemos termidado com a string.
      (Isto é o porquê é bom ter um editor de textos que faz
      <dfn>coloração de sintaxe</dfn> para você.)  Então como nós faremos para
      o computador saber que nós queremos continuar com a string?  Nós temos
      que fazer um <dfn>escape</dfn> do apóstrofo, desta forma:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Marca d\\'água!'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      A contra-barra é o caracter de escape.  Em outras palavras, se você tem
      uma contra-barra e um outro caracter, eles algumas vezes serão traduzidos
      em um novo caracter.  As únicas coisas que a contra-barra faz escape,
      portanto, são o apóstrofo e a própria contra-barra.  (Se você
      analisar, caracteres de escape devem sempre fazer o escape deles mesmo.)
      Alguns exemplos estão em ordem aqui, eu acho:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Marca d\\'água!'
      puts 'contra-barra no fim da string:  \\\\'
      puts 'para cima\\\\para baixo'
      puts 'para cima\\para baixo'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Since the backslash does <em>not</em> escape a #{code "'d'"},
      but <em>does</em> escape itself, those last two strings are
      identical.  They don't look the same in the code, but in your
      computer they really are the same.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      If you have any other questions, just
      #{makeLink('keep reading', :generateVariables)}!  I couldn't
      answer every question on <em>this</em> page, after all.
      END_PARAGRAPH
    end
  end
end