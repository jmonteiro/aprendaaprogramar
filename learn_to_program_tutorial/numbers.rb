module Numbers
  #
  #  NUMBERS
  #
  
  def generateNumbers
    para do <<-END_PARAGRAPH
      Agora que você já #{makeLink('arranjou', :generateSetup)}
      tudo, vamos escrever um programa! Abra seu editor de texto
      favorito e digite o seguinte:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 1+2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Salve seu programa (sim, isso é um programa!) como #{input 'calc.rb'}
      (o <strong>.rb</strong> é o que normalmente colocamos no final de
      programas escritos em Ruby). Agora rode o seu programa digitando
      #{input 'ruby calc.rb'} na linha de comando. Ele deve ter posto
      #{output '3'} na sua tela. Viu como programar não é tão difícil?
      END_PARAGRAPH
    end
    h2 {'Introdução ao '+(code 'puts')}
    para do <<-END_PARAGRAPH
      O que é então que está acontecendo no programa? Tenho certeza que você
      é capaz de adivinhar o quê #{code '1+2'} faz; nosso programa é
      praticamente a mesma coisa que:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 3
      END_CODE
    end
    para do <<-END_PARAGRAPH
      #{code 'puts'} simplesmente escreve na tela tudo que
      vem depois dele.
      END_PARAGRAPH
    end
    h2 {'Inteiro e Float'}
    para do <<-END_PARAGRAPH
      Na maioria das linguagens de programação (e não é diferente no Ruby)
      números sem pontos decimais são chamados de <dfn>inteiros</dfn>, e
      números com pontos decimais normalmente são chamados de
      <dfn>números de ponto-flutuante</dfn>,
      ou mais singelamente, <dfn>floats</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Eis alguns inteiros:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      5
      -205
      9999999999999999999999999
      0
      END_CODE
    end
    para do <<-END_PARAGRAPH
      E aqui estão alguns floats:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      54.321
      0.001
      -205.3884
      0.0
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Na prática, a maioria dos programas não usa floats;
      apenas inteiros.
      (Afinal, ninguém quer ler 7.4 emails, ou navegar 1.8 páginas,
      ou ouvir 5.24 músicas favoritas)
      Floats são usados mais freqüentemente para fins acadêmicos
      (experimentos de física e afins) e para gráficos 3D.
      Mesmo a maioria dos programas que lidam com dinheiro usam
      inteiros; eles só ficam contando as moedinhas!
      END_PARAGRAPH
    end
    h2 {'Aritmética Simples'}
    para do <<-END_PARAGRAPH
      Até agora, temos tudo que é necessário para uma calculadora simples.
      (Calculadoras sempre usam floats, então se você quer que seu
      computador aja como uma calculadora, você também deve usar floats.)
      Para adição e subtração, usamos <kbd>+</kbd> e <kbd>-</kbd>, como
      vimos. Para multiplicação, usamos <kbd>*</kbd>, e para divisão
      usamos <kbd>/</kbd>. A maioria dos teclados possui essas
      teclas no teclado numérico. Se você tem teclado menor ou um laptop,
      você pode usar <kbd>Shift 8</kbd> e <kbd>/</kbd> (fica na mesma
      tecla que <kbd>?</kbd>). Vamos tentar expandir um pouco nosso calc.rb.
      Digite o seguinte e depois rode.
      END_PARAGRAPH
    end
    prog [], 'Isto é o que o programa retorna:' do <<-END_CODE
      puts 1.0 + 2.0
      puts 2.0 * 3.0
      puts 5.0 - 8.0
      puts 9.0 / 2.0
      END_CODE
    end
    para do <<-END_PARAGRAPH
      (Os espaços no programa não são importantes; eles só deixam
      o código mais legível.) Bom, não foi lá muito surpreendente.
      Vamos tentar agora com inteiros.
      END_PARAGRAPH
    end
    prog [], 'Basicamente a mesma coisa, não é?' do <<-END_CODE
      puts 1+2
      puts 2*3
      puts 5-8
      puts 9/2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Ahn... tirando aquele último ali!
      Quando você faz aritmética com inteiros, você recebe respostas em
      inteiros. Quando seu computador não sabe dar a resposta "certa", ele
      sempre arredonda para baixo. (Claro, #{output '4'} <em>é</em> a
      resposta certa em aritmética de inteiros para #{code '9/2'}; só
      pode não ser o que você estava esperando.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Talvez você esteja se perguntado para que divisão de inteiros serve.
      Bem, vamos dizer que você vai ao cinema, mas só tem $ 9. Aqui em
      Portland, você pode ver um filme no Bagdad por 2 pilas. A quantos
      filmes você pode assistir lá? #{code '9/2'}... #{output '4'} filmes.
      4.5 <em>não</em> é a resposta certa neste caso; eles não vão deixar
      você ver metade de um filme, ou metade de você ver um filme inteiro...
      algumas coisas não são divisíveis.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Agora experimente com alguns programas seus! Se você quiser
      escrever expressões mais complexas, você pode usar parênteses.
      Por exemplo:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 5 * (12-8) + -15
      puts 98 + (59872 / (13*8)) * -52
      END_CODE
    end
    h2 {'Umas Coisinhas Para Tentar'}
    para do
      puts 'Escreva um programa que lhe dê:'
    end
    ul do
      li {'quantas horas há em um ano?'}
      li {'quantos minutos há em uma década?'}
      li {'qual é a sua idade em segundos?'}
      li {'quantos chocolates você pretende comer na vida? <br />'+
          '<em><strong>Aviso:</strong>  Esta parte do programa pode demorar um pouco para computar!</em>'}
    end
    para do
      puts "Eis uma pergunta mais difícil:"
    end
    ul do
      li {"Se minha idade é de #{(Time.now - Time.mktime(1976,8,3)).to_i / 1000000} milhões de segundos, qual é minha idade em anos?"}
    end
    para do <<-END_PARAGRAPH
      Quando você cansar de brincar com números, vamos dar uma
      olhada em algumas #{makeLink('letras', :generateLetters)}.
      END_PARAGRAPH
    end
  end
end
