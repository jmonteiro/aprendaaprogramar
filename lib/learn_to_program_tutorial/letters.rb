module Letters
  #
  #  LETTERS
  #
  
  def generateLetters
    para do <<-END_PARAGRAPH
      Então, nós já aprendemos tudo sobre #{makeLink('números', :generateNumbers)},
      mas e as letras? Palavras? Textos?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Nós nos referimos a grupos de letras em um programa como <dfn>strings</dfn> (Você
      pode pensar em letras impressas juntas ao longo de um banner).
      Para ficar mais fácil de entender quais partes do código são strings,
      Eu vou colorir as strings em <span class="L2Pcode"><span class="L2Pstring">#{STRING_COLOR}</span></span>.
      Aqui tem alguns exemplos de strings:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      'Olá.'
      'Ruby rocks.'
      '5 é meu número favorito... qual é o seu?'
      'Snoopy diz #%^?&*@! quando alguém pisa no seu pé.'
      '     '
      ''
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Como você pode ver, strings podem ter pontuação, dígitos, símbolos
      e espaços... muito mais do que apenas letras. A última string
      não tem nada: nós a chamamos de <dfn>string vazia</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Nós estávamos usando #{code 'puts'} para imprimir os números;
      vamos tentar ele de novo com algumas strings:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Olá, mundo!'
      puts ''
      puts 'Até logo.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Isso funcionou bem. Agora, tente umas strings você mesmo.
      END_PARAGRAPH
    end
    h2 {'Aritimética das String'}
    para do <<-END_PARAGRAPH
      Assim como você pode fazer aritimética com números, você também
      pode fazer aritimética com strings! Bem, uma parte dela... você pode
      adicionar strings, de qualquer forma.
      Vamos tentar adicionar duas strings e ver o que o #{code 'puts'}
      faz.
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Eu gosto de' + 'torta de maçã.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Ops! Eu esqueci de adicionar um espaço entre #{code "'Eu gosto de'"} e #{code "'torta de maçã.'"}.
      Espaços não fazem importância normalmente, mas eles fazem sentido dentro de strings.
      (É verdade o que dizem: computadores não fazem o que você <em>quer</em> que eles façam,
      apenas o que você <em>manda</em> eles fazerem). Vamos tentar de novo:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Eu gosto de ' + 'torta de maçã.'
      puts 'Eu gosto de' + ' torta de maçã.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      (Como você pode ver, não importa em qual string eu adicione o espaço.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Então você pode somar strings. Mas você pode, também, multiplicá-las!
      (Por um número, de qualquer forma). Veja isso:
      END_PARAGRAPH
    end
    prog [], '(Estou brincando... ele na verdade faz isso:)', 'piscando os olhos dela' do <<-END_CODE
      puts 'piscar ' * 4
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Se você parar para pensar, isso realmente faz sentido. Afinal,
      #{code '7*3'} realmente quer dizer #{code '7+7+7'}, então #{code "'moo'*3"}
      apenas significa #{code "'moo'+'moo'+'moo'"}.
      END_PARAGRAPH
    end
    h2 {"#{code '12'} vs #{code "'12'"}"}
    para do <<-END_PARAGRAPH
      Antes de irmos mais longe, nós devemos ter certeza de que entendemos
      a diferença entre <em>números</em> e <em>dígitos</em>.
      #{code '12'} é um número, mas #{code "'12'"} é uma string de dois dígitos.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Vamos brincar com isso um pouco:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts  12  +  12
      puts '12' + '12'
      puts '12  +  12'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Que tal isso?
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts  2  *  5
      puts '2' *  5
      puts '2  *  5'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Esses exemplos foram muito diretos. De qualquer forma, se você não for
      muito cauteloso quando misturar strings e números, você pode cair em...
      END_PARAGRAPH
    end
    h2 {'Problemas'}
    para do <<-END_PARAGRAPH
      Nesse ponto, você já deve ter tentado algumas coisas que
      <em>não</em> funcionaram. Se não, aqui tem algumas:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts '12' + 12
      puts '2' * '5'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Hmmm... Uma mensagem de erro. O problema é que você
      não pode, realmente, adicionar um número a uma string, ou
      multiplicar uma string por outra string. Isso não faz muito sentido como isso:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Betty' + 12
      puts 'Fred' * 'John'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Uma coisa que você deve saber: você pode escrever #{code "'porco'*5"} em um programa,
      já que isso apenas quer dizer #{code '5'} conjuntos da string #{code "'porco'"}, todas adicionadas
      entre si. Entretanto,
      você <em>não</em> pode escrever #{code "5*'porco'"}, já que isso significa #{code "'porco'"}
      conjuntos do número #{code '5'}, o que é um pouco insano.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Finalmente, e que tal um programa que imprima
      #{output 'Isso é um apóstrofo: \''}? Nós podemos tentar isso:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Isso é um apóstrofo: ''
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Bem, <em>aquilo</em> não vai funcionar; Eu nem vou tentar executar aquilo.
      O computador me disse que nós terminamos com uma string.
      (É por isso que é bom ter um editor de texto que tenha
      <dfn>realçador de sintaxe</dfn> para você). Então, como podemos
      fazer com que o computador saiba que nós queremos continuar dentro da string?
      Nós temos que <dfn>escapar</dfn> o apóstrofo, assim:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Isso é um apóstrofo: \\''
      END_CODE
    end
    para do <<-END_PARAGRAPH
      A barra invertida é um caractere de escape. Em outras palavras, se você tem
      uma barra invertida seguida de um caractere, isso pode ser, algumas vezes, traduzido
      em um novo caractere. As únicas coisas que uma barra invertida escapa, porém,
      são o apóstrofo e a própria barra invertida (Se você pensar a respeito,
      caracteres de escape devem sempre escapar a si mesmos).
      Acho que uns exemplos são bons agora:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Isso é um apóstrofo: \\''
      puts 'uma barra invertida no fim da string:  \\\\'
      puts 'acima\\\\embaixo'
      puts 'acima\\embaixo'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Uma vez que a barra invertida <em>não escapa</em um #{code "'e'"},
      mas <em>escapa</em> a si mesma, as últimas duas strings são
      idênticas. Elas não se parecem no código, mas no seu computador
      elas são as mesmas.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Se você tiver outra dúvida, apenas
      #{makeLink('continue lendo', :generateVariables)}!  Eu não posso
      responder a todas as questões <em>nesta</em> página.
      END_PARAGRAPH
    end
  end
end
