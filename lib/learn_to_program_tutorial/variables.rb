module Variables
  #
  #  VARIABLES
  #
  
  def generateVariables
    para do <<-END_PARAGRAPH
      Até agora, sempre que usamos #{code 'puts'} numa string ou número,
      o que imprimimos some. O que eu quero dizer é, se quiséssemos imprimir
      algo duas vezes, teríamos que digitar duas vezes:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts '...você pode dizer aquilo de novo...'
      puts '...você pode dizer aquilo de novo...'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Seria legal se pudéssemos digitá-lo uma única vez e mantê-lo por perto...
      guardá-lo em algum lugar.
      Bom, nós podemos, é claro&mdash;caso contrário eu não teria tocado no assunto!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Para guardar a string na memória de seu computador, precisamos dar
      um nome a ela. Normalmente os programadores chamam esse processo de
      <dfn>atribuição</dfn>, e chamam os nomes de <dfn>variáveis</dfn>. A
      variável pode ser praticamente qualquer seqüência de letras e números,
      mas o primeiro caracter tem de ser uma letra minúscula. Vamos rodar
      o último programa de novo, mas desta vez eu darei à string o nome de
      #{code 'minhaString'} (ainda que eu pudesse tê-la chamado de 
      #{code 'str'} ou #{code 'minhaStringzinha'} ou #{code 'pedroPrimeiro'}).
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      minhaString = '...você pode dizer aquilo de novo...'
      puts minhaString
      puts minhaString
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Sempre que você tentou fazer algo com #{code 'minhaString'}, o programa
      fez com #{code "'...você pode dizer aquilo de novo'"} no lugar. Você
      pode pensar na variável #{code 'minhaString'} como "apontando para" a 
      string #{code "'...você pode dizer aquilo de novo...'"}. Eis um exemplo
      um pouquinho mais interessante:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      nome = 'Patricia Rosanna Jessica Mildred Oppenheimer'
      puts 'Meu nome é ' + nome + '.'
      puts 'Nossa!  ' + nome + ' é um nome bem longo!'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Assim como podemos <em>atribuir</em> um objeto a uma variável,
      podemos <em>reatribuir</em> um objeto diferente à mesma variável (e
      é por isso que nós as chamamos de variáveis: porque a coisa para
      a qual apontam pode variar).
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      compositor = 'Mozart'
      puts compositor + ' era "sensa", na sua época.'
      
      compositor = 'Beethoven'
      puts 'Mas eu, pessoalmente, prefiro ' + compositor + '.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Variáveis podem, é claro, apontar para qualquer tipo de objeto, não
      só strings:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      var = 'só mais uma ' + 'string'
      puts var
      
      var = 5 * (1+2)
      puts var
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Na verdade, variáveis podem apontar para qualquer coisa...
      que não outras variáveis. 
      Então o que acontece se tentarmos?
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      var1 = 8
      var2 = var1
      puts var1
      puts var2
      
      puts ''
      
      var1 = 'oito'
      puts var1
      puts var2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Primeiro, quando tentamos apontar #{code 'var2'} para #{code 'var1'},
      #{code 'var2'} apontou para #{code '8'} (exatamente como #{code 'var1'}
      apontava). Aí fizemos #{code 'var1'} apontar para #{code "'oito'"}, mas
      como #{code 'var2'} nunca apontou de verdade para #{code 'var1'}, ela
      se mantém apontando para #{code '8'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Agora que temos variáveis, números e strings, vamos aprender como
      #{makeLink 'misturar todos eles', :generateConversion}!
      END_PARAGRAPH
    end
  end
end
