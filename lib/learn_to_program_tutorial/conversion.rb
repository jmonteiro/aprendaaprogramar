module Conversion
  #
  #  CONVERSION
  #
  
  def generateConversion
    para do <<-END_PARAGRAPH
      Nós vimos alguns tipos diferentes de objetos
      (#{makeLink 'números', :generateNumbers} e #{makeLink 'letras', :generateLetters}),
      e nós fizemos #{makeLink 'variáveis', :generateVariables} para apontar para elas;
      a coisa que queremos fazer a seguir é fazer com que todas se encaixem.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Nós vimos que se desejássemos que um programa imprimisse #{output '25'},
      o código a seguir <em><strong>não</strong></em> funcionaria, porque
      você não pode somar números e strings:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      var1 = 2
      var2 = '5'
      
      puts var1 + var2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Parte do problema é que seu computador não sabe se você está
      querendo #{output '7'} (#{code '2 + 5'}) ou #{output '25'}
      (#{code "'2' + '5'"}).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Antes que possamos somar os dois, precisamos de alguma maneira
      de obter a versão em string de #{code 'var1'}, ou então de obter
      a versão inteira de #{code 'var2'}.
      END_PARAGRAPH
    end
    h2 {'Conversions'}
    para do <<-END_PARAGRAPH
      Para obter a versão string de um objeto, simplesmente escrevemos
      #{code '.to_s'} depois dele:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      var1 = 2
      var2 = '5'
      
      puts var1.to_s + var2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Similarmente, #{code 'to_i'} fornece a versão inteira de um objeto,
      e #{code 'to_f'} dá a versão float. Vejamos o que esses três método
      fazem (e <em>não</em> fazem) com mais detalhe:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      var1 = 2
      var2 = '5'
      
      puts var1.to_s + var2
      puts var1 + var2.to_i
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Note que, mesmo depois que obtivemos a versão string de 
      #{code 'var1'} por meio de #{code 'to_s'}, #{code 'var1'}
      sempre apontou para #{code '2'}, e nunca para #{code "'2'"}.
      A não ser que reatribuamos #{code 'var1'} explicitamente (o que
      requer um sinal de #{code '='}), ela vai apontar para #{code '2'}
      enquanto o programa estiver rodando.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Agora vamos tentar algumas conversões mais interessantes (e alguma apenas
      esquisitas):
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts '15'.to_f
      puts '99.999'.to_f
      puts '99.999'.to_i
      puts ''
      puts '5 é meu número favorito!'.to_i
      puts 'Quem foi que te perguntou sobre o 5?'.to_i
      puts 'Sua mãe.'.to_f
      puts ''
      puts 'stringuelingue'.to_s
      puts 3.to_i
      END_CODE
    end
    para do <<-END_PARAGRAPH
      É provável que tenha havido surpresas. A primeira é bem padrão e
      dá #{output '15'}.
      Depois disso, convertemos a string #{code "'99.999'"} para um float
      e para um inteiro. O float ficou como esperávamos; o inteiro, como
      sempre, foi arredondado para baixo.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Em seguida temos alguns exemplos de strings... atípicas convertidas
      em números. #{code 'to_i'} ignora a primeira coisa que ela não entende,
      e o resto da string daquele ponto em diante. Então a primeira string
      foi convertida para #{code '5'}, mas as outras, já que começavam com
      letras, foram ignoradas por completo... então o computador só escolhe
      zero.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Por fim, vimos que nossas duas últimas conversas não fizeram nada,
      exatamente como esperávamos.
      END_PARAGRAPH
    end
    h2 {'Uma Outra Olhadela em '+(code 'puts')}
    para do <<-END_PARAGRAPH
      Há alguma coisa estranha no nosso método favorito... Dê uma olhadinha:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 20
      puts 20.to_s
      puts '20'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Por que é que essas três imprimem a mesma coisa? Tudo bem, as duas
      últimas deveriam mesmo, já que #{code '20.to_s'} <em>é</em>
      #{code "'20'"}. Mas e a primeira, o inteiro #{code '20'}? Falando nisso,
      faz algum sentido escrever <em>o inteiro</em> 20? Quando você escreve
      um <em>2</em> e depois um <em>0</em> num papel, você está escrevendo
      uma string, não um inteiro. <em>O inteiro</em> 20 é o número de dedos
      que eu possuo, e não um <em>2</em> seguido de um <em>0</em>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      O nosso amigo #{code 'puts'} carrega um grande segredo: antes de tentar
      escrever um objeto, #{code 'puts'} usa #{code 'to_s'} para obter a
      versão string do mesmo. Na verdade, o <em>s</em> em #{code 'puts'}
      está lá representando <em>string</em>; #{code 'puts'} na verdade
      significa <dfn>put string</dfn> (colocar string).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Isso pode não parecer muito animador agora, mas há muitos,
      <em>muitos</em> tipos de objetos em Ruby (você vai até aprender
      a fazer o seu próprio!), e é bom saber o que vai acontecer
      se você tentar usar #{code 'puts'} num objeto muito estranho,
      como uma foto da sua avó, ou um arquivo de música ou algo assim.
      Mas isso vem depois...
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Até lá, nós temos mais alguns métodos para você, e eles permitem
      que escrevamos um bando de programas divertidos...
      END_PARAGRAPH
    end
    h2 {'Os Métodos '+(code 'gets')+' e '+(code 'chomp')}
    para do <<-END_PARAGRAPH
      Se #{code 'puts'} significa <dfn>colocar string</dfn> (N.T.: put significa
      "colocar"), acho que você pode adivinhar o que #{code 'gets'} quer dizer
      (N.T.: get, em inglês, entre várias acepções, significa pegar, obter).
      E assim como #{code 'puts'} sempre cospe strings, #{code 'gets'} vai apenas
      obter strings. E de onde ele as pega?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      De você! Tudo bem, do seu teclado. Já que seu teclado só produz strings,
      isso funciona muito bem. O que acontece, na verdade, é que #{code 'gets'}
      fica lá esperando, lendo o que você digita até que você pressione
      <kbd>Enter</kbd>. Vamos experimentar:
      END_PARAGRAPH
    end
    prog ['Tem um eco aqui?'] do <<-END_CODE
      puts gets
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Claro, tudo que você digitar vai ser repetido para você. Rode
      algumas vezes e tente digitar coisas diferentes.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Agora podemos fazer programas interativos! Neste, digite
      o seu nome para que ele lhe saude:
      END_PARAGRAPH
    end
    prog ['Chris'], '<em>Eca!</em> Eu acabei de rodá-lo&mdash;escrevi meu nome&mdash;e aconteceu isto:' do <<-END_CODE
      puts 'Olá, qual é o seu nome?'
      name = gets
      puts 'Seu nome é ' + name + '?  Que nome bonito!'
      puts 'Prazer em conhecê-lo, ' + name + '.  :)'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Hmmm... parece que quando eu digitei as letras <kbd>C</kbd>,
      <kbd>h</kbd>, <kbd>r</kbd>, <kbd>i</kbd>, <kbd>s</kbd>, e pressionei
      <kbd>Enter</kbd>, #{code 'gets'} obteve todas as letras do meu nome
      <em>e</em> o <kbd>Enter</kbd>! Felizmente, existe um método exatamente
      pra esse tipo de coisa: #{code 'chomp'}. Ele retira qualquer
      <kbd>Enter<kbd> que esteja lá de bobeira no fim da sua string. Vamos
      testar aquele programa de novo, mas com #{code 'chomp'} para ajudar:
      END_PARAGRAPH
    end
    prog ['Chris'] do <<-END_CODE
      puts 'Olá, qual é o seu nome?'
      name = gets.chomp
      puts 'Seu nome é ' + name + '?  Que nome bonito!'
      puts 'Prazer em conhecê-lo, ' + name + '.  :)'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Muito melhor! Perceba que já que #{code 'name'} aponta para 
      #{code 'gets.chomp'}, não temos que dizer #{code 'name.chomp'};
      #{code 'name'} já foi #{code 'mastiga'}do (N.T.: chomp, em Inglês
      é "mastigar").
      END_PARAGRAPH
    end
    h2 {'Umas Coisinhas Para Tentar'}
    para do <<-END_PARAGRAPH
      &bull; Escreva um programa que peça o nome de uma pessoa, depois
      o sobrenome. Por fim, faça com que ele cumprimente a pessoa usando seu nome completo.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Escreva um programa que pergunte pelo número favorito de uma
      pessoa. Some um ao número, e sugira o resultado como um número favorito
      <em>muito melhor</em> (tenha tato ao fazê-lo).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Assim que você terminar esses dois programas (e quaisquer outros que
      você queira tentar), aprenderemos mais #{makeLink('métodos', :generateMethods)} (e mais coisas sobre eles).
      END_PARAGRAPH
    end
  end
end
