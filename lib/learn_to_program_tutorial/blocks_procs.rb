module BlocksProcs
    #
    #  BLOCKS AND PROCS
    #

    def generateBlocksProcs
      para do <<-END_PARAGRAPH
        Este é, definitivamente, um dos recursos mais legais de Ruby. Algumas
        outras linguagens têm esse recurso, porém elas podem chamar isso
        de formas diferentes (como <dfn>closures</dfn>), mas muitas
        das mais populares não, o que é uma pena.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Então o que é essa nova coisa legal? É a habilidade de pegar
        um <dfn>bloco</dfn> de código (código entre #{code 'do'}
        e #{code 'end'}), amarrar tudo em um objeto (chamado de
        <dfn>proc</dfn>), armazenar isso em uma variável e passar isso
        para um método, e rodar o código do bloco quando você quiser
        (mais de uma vez, se você quiser). Então, é como se fosse um método,
        exceto pelo fato de que isso não está em um objeto (isso <em>é</em> um objeto),
        e você pode armazená-lo ou passá-lo adiante, como com qualquer outro objeto.
        Acho que é hora de um exemplo:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        saudacao = Proc.new do
          puts 'Olá!'
        end

        saudacao.call
        saudacao.call
        saudacao.call
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Eu criei uma proc (eu acho que é abreviatura para "procedimento",
        mas o que importa é que rima com "block") que tem um bloco de código, então
        eu chamei (#{code 'call'}) a proc três vezes.
        Como você pode ver, parece, em muito, com um método.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Atualmente, é muito mais parecido com um método do que eu mostrei para você,
        porque blocos podem receber parâmetros:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        VoceGostade = Proc.new do |umaBoaCoisa|
          puts 'Eu *realmente* gosto de '+umaBoaCoisa+'!'
        end

        VoceGostade.call 'chocolate'
        VoceGostade.call 'ruby'
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Certo, então nós vimos o que blocos e procs são e como os usar, mas e daí?
        Por que não usar apenas métodos? Bem, isso é porque existem algumas coisas
        que você não pode fazer com métodos. Particularmente, você não pode passar
        métodos para outros métodos (mas você pode passar procs para métodos), e
        métodos não podem retornar outros métodos (mas podem retornar procs). É apenas
        por isso que procs são objetos; métodos não.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        (De qualquer forma, isso parece familiar? Sim, você já viu blocos antes... quando
        você aprendeu sobre iteradores. Mas vamos voltar a falar disso daqui a pouco.)
        END_PARAGRAPH
      end
      h2 { 'Métodos que Recebem Procs' }
      para do <<-END_PARAGRAPH
        Quando passamos uma proc em um método, nós podemos controlar como, se ou quantas vezes
        nós vamos chamar a proc. Por exemplo, posso dizer que há uma coisa que nós queremos
        fazer antes e depois que um código é executado:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def FacaUmaCoisaImportante umaProc
          puts 'Todo mundo apenas ESPERE! Eu tenho uma coisa a fazer...'
          umaProc.call
          puts 'Certo pessoal, Eu terminei. Voltem a fazer o que estavam fazendo.'
        end

        digaOla = Proc.new do
          puts 'olá'
        end

        digaTchau = Proc.new do
          puts 'tchau'
        end

        FacaUmaCoisaImportante digaOla
        FacaUmaCoisaImportante digaTchau
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Talvez isso não pareça tão fabuloso... mas é. :-)
        É muito comum em programação que alguns requesitos críticos sejam executados.
        Se você grava um arquivo, por exemplo, você deve abrir o arquivo, escrever
        o que quiser lá dentro e então fechar o arquivo. Se você se esquecer de fechar o arquivo,
        Coisas Ruins(tm) podem acontecer. Mas toda a vez que você quiser salvar ou carregar um arquivo,
        você deve fazer a mesma coisa: abrir o arquivo, fazer o que você <em>realmente</em> quiser com ele
        e então fechar o arquivo. Isso é entediante e fácil de esquecer. Em Ruby, salvar (ou carregar)
        arquivos funciona similarmente com o código anterior, então você não precisa se preocupar
        com nada além de o que você quer salvar (ou carregar) (No próximo capítulo eu vou lhe
        mostrar como fazer coisas como salvar e carregar arquivos).
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Você pode também escrever métodos que vão determinar quantas vezes, ou mesmo
        <em>se</em> uma proc será chamada. Aqui está um método que irá chamar uma proc
        metade do tempo, e outra que irá chamar a proc duas vezes.
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def talvezFaca umaProc
          if rand(2) == 0
            umaProc.call
          end
        end

        def FacaDuasVezes umaProc
          umaProc.call
          umaProc.call
        end

        piscar = Proc.new do
          puts '<piscada>'
        end

        olhandofixamente = Proc.new do
          puts '<olhando fixamente>'
        end

        talvezFaca piscar
        talvezFaca olhandofixamente
        FacaDuasVezes piscar
        FacaDuasVezes olhandofixamente
        END_CODE
      end
      para do <<-END_PARAGRAPH
        (Se você recarregar essa página algumas vezes, você verá que a saída muda)
        Esses são alguns dos usos mais comuns de procs, que nos possibilita fazer coisas que nós
        simplesmente não poderíamos fazer usando apenas métodos. Claro, você pode escrever um método
        que "pisque" duas vezes, mas você não pode escrever um que apenas faça <em>qualquer coisa</em> duas vezes!
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Antes de seguirmos adiante, vamos olhar um último exemplo. Até agora,
        as procs que nós usamos foram muito similares umas às outras. Agora,
        elas serão um pouco diferentes, assim você poderá ver como um método
        depende das procs que lhe são passadas. Nosso método irá receber
        um objeto e uma proc e irá chamar essa proc naquele objeto. Se a
        proc retornar falso, nós saímos; caso contrário, nós chamamos a proc
        com o objeto retornado. Nós vamos continuar fazendo isso até que a proc
        retorne falso (o que é o melhor a fazer eventualmente, ou o programá irá
        travar). O método irá retornar o último valor não falso retornado pela proc.
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def facaAteFalso primeiraEntrada, umaProc
          entrada = primeiraEntrada
          saida   = primeiraEntrada

          while saida
            entrada = saida
            saida   = umaProc.call entrada
          end

          entrada
        end

        construindoVetorDeQuadrados = Proc.new do |vetor|
          ultimoNumero = vetor.last
          if ultimoNumero <= 0
            false
          else
            vetor.pop                            # Jogue fora o último número...
            vetor.push ultimoNumero*ultimoNumero # ... e o substitua com esse quadrado...
            vetor.push ultimoNumero-1            # ... seguido pelo número imediatamente anterior.
          end
        end

        sempreFalso = Proc.new do |apenasIgnoreme|
          false
        end

        puts facaAteFalso([5], construindoVetorDeQuadrados).inspect
        puts facaAteFalso('Estou escrevendo isso às 3:00; alguém me derrube!', sempreFalso)
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Certo, esse foi um exemplo estranho, eu admito. Mas isso mostra como nosso método
        age diferentemente quando recebe diferentes procs.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        O método #{code 'inspect'} é muito parecido com o #{code 'to_s'}, exceto
        pelo fato de que a string retornada tenta mostrar para você o código em ruby
        que está construindo o objeto que você passou. Aqui ele nos mostra todo o vetor
        retornado pela nossa primeira chamada a #{code 'facaAteFalso'}. Você também deve
        ter notado que nós nunca elevamos aquele #{code '0'} ao quadrado, no fim do vetor. Já que
        #{code '0'} elevado ao quadrado continua apenas #{code '0'}, nós não precisamos fazer isso.
        E já que #{code 'sempreFalso'} foi, você sabe, sempre #{code 'falso'},
        #{code 'facaAteFalso'} não fez nada na segunda vez que a chamamos; apenas retornou o que
        lhe foi passada.
        END_PARAGRAPH
      end
      h2 { 'Métodos que Retornam Procs' }
      para do <<-END_PARAGRAPH
        Uma das outras coisas legais que você pode fazer com procs é
        criá-las em métodos e retorná-las. Isso permite toda uma variedade
        de poderes de programação malucos (coisas com nomes impressionantes,
        como <dfn>avaliação preguiçosa</dfn>, <dfn>estrutura de dados infinita</dfn>,
        e <dfn>temperando com curry</dfn>), mas o fato é de que eu nunca faço isso
        na prática e eu não me lembro de ter visto ninguém fazendo isso. Eu acho
        que isso é o tipo de coisa que você acaba não fazendo em Ruby, ou talvez
        Ruby apenas encoraje-o a achar outras soluções: eu não sei. De qualquer forma,
        eu vou tocar no assunto apenas brevemente.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Nesse exemplo, #{code 'compor'} recebe duas procs e retorna uma nova proc
        que, quando chamada, chama uma terceira proc e passa seu resultado
        para a segunda proc.
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def compor proc1, proc2
          Proc.new do |x|
            proc2.call(proc1.call(x))
          end
        end

        quadrado = Proc.new do |x|
          x * x
        end

        dobre = Proc.new do |x|
          x + x
        end

        dobreeEleve = compor dobre, quadrado
        eleveeDobre = compor quadrado, dobre

        puts dobreeEleve.call(5)
        puts eleveeDobre.call(5)
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Note que a chamada para #{code 'proc1'} deve ser inserida
        entre parenteses dentro de #{code 'proc2'}, para que seja executada primeiro.
        END_PARAGRAPH
      end
      h2 { 'Passando Blocos (E Não Procs) para Métodos' }
      para do <<-END_PARAGRAPH
        Certo, isso foi muito interessante academicamente, mas de pouca
        utilidade prática. Uma porção desse problema é que há três passos
        que você deve seguir (definir o método, construir a proc e chamar
        o método com a proc), quando eles podem ser resumidos em apenas
        dois (definir o método e passar o <em>bloco</em> diretamente ao método,
        sem usar uma proc), uma vez que na maior parte das vezes você não
        vai querer usar a proc ou o bloco depois que o passar para um método.
        Bem, você não sabe, mas Ruby tem isso para nós! Na verdade,
        você já estava fazendo isso todas as vezes que usou iteradores.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Eu vou mostrar a você um exemplo rápido, então nós vamos falar sobre isso.
        END_PARAGRAPH
      end
      #  HACK ALERT!!!  (Eu não posso chegar a um namespace global transparentemente
      #                  de dentro do objeto StringIO em um script mod_ruby.)
      arrayClassHack = <<-END_CODE
          def cadaComparacao(&eraUmBloco_agoraUmaProc)
            eIgual = true  # Nós começamos com "verdadeiro" porque vetores começam com 0, mesmo se iguais.

            self.each do |objeto|
              if eIgual
                eraUmBloco_agoraUmaProc.call objeto
              end

              eIgual = (not eIgual)  # Comutando entre igual para diferente, ou de diferente para igual.
            end
          end
        END_CODE

      Array.module_eval arrayClassHack  #  Esta é a definição real do método.
      #  A seguir é definido um método em "outra" classe de inteiros:
      #  FIM HACK ALERT!!!
      prog do <<-END_CODE
        class Array

  #{arrayClassHack}
        end

        ['maçã', 'maçã podre', 'cereja', 'mamona'].cadaComparacao do |fruta|
          puts 'Hum! Eu adoro tortas de '+fruta+', você não?'
        end

        #  Lembre-se, nós estamos pegando os mesmos elementos numerados
        #  do array, todos que se relacionam com os outros números,
        #  apenas porque gosto de causar esse tipo de problema.
        [1, 2, 3, 4, 5].cadaComparacao do |bola_estranha|
          puts bola_estranha.to_s+' não é um número!'
        end
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Para passar um bloco para #{code 'cadaComparacao'}, tudo o que temos que fazer
        é anexar o bloco após o método. Você pode passar um bloco para qualquer método
        dessa maneira, apesar de que muitos métodos vão apenas ignorar o bloco. Para
        fazer seu método <em>não</em> ignorar o bloco, mas pegá-lo e transformá-lo em
        uma proc, ponha o nome da proc no começo da lista dos parâmetros do seu método,
        precedido por um 'e' comercial (#{code '&'}). Essa parte é um pequeno truque,
        mas não é tão ruim, e você apenas precisa fazer isso uma vez (quando você
        define o método). Então você pode usar o método de novo, e de novo e de novo,
        assim como os métodos da linguagem que aceitam blocos, como o #{code 'each'}
        e o #{code 'times'} (Lembra-se do #{code '5.times do'}...?).
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Se você estiver confuso, apenas lembre-se do que supostamente o método
        #{code 'cadaComparacao'} faz: chama o bloco passado como parâmetro para
        cada elemento no vetor. Depois que você o escrever e ele estiver funcionando,
        você não vai precisar pensar sobre o que está acontecendo realmente por baixo
        dos panos ("qual bloco é chamado quando??"); na verdade, é exatamente <em>por isso</em>
        que escrevemos métodos assim: nós nunca mais vamos precisar pensar sobre
        como eles funcionam novamente. Nós vamos apenas usar-los.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Eu lembro que uma vez eu quis cronometrar quanto tempo cada
        seção do meu código estava demorando (Isso é algo conhecido como
        <dfn>sumarizar</dfn> o código). Então, eu escrevi um método que
        pegava o tempo antes de executar o código, o executava e então
        fazia uma nova medição do tempo e me retornava a diferença. Eu
        não estou conseguindo achar o código agora, mas eu não preciso disso:
        provavelmente é um código parecido com esse:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def sumario descricaoDoBloco, &bloco
          tempoInicial = Time.now

          bloco.call

          duracao = Time.now - tempoInicial

          puts descricaoDoBloco+': '+duracao.to_s+' segundos'
        end

        sumario 'dobrando 25000 vezes' do
          numero = 1

          25000.times do
            numero = numero + numero
          end

          puts numero.to_s.length.to_s+' dígitos'  #  É isso mesmo: o número de dígitos nesse número ENORME.
        end

        sumario 'contando até um milhão' do
          numero = 0

          1000000.times do
            numero = numero + 1
          end
        end
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Que simplicidade! Que elegância! Com aquele pequeno método
        eu posso, agora, facilmente cronometrar qualquer seção, de qualquer
        programa, que eu queira, eu apenas preciso jogar o código para um bloco
        e enviar ele para o #{code 'sumario'}.
        O que poderia ser mais simples? Em muitas linguagens, eu teria que
        adicionar explicitamente o código de cronometragem (tudo o que está
        em #{code 'sumario'}) em volta de qualquer seção que eu queira medir.
        Em Ruby, porém, eu deixo tudo em um só lugar, e (o mais importante)
        fora do meu caminho!
        END_PARAGRAPH
      end
      h2 {'Algumas Coisinhas Para Tentar'}
      para do <<-END_PARAGRAPH
        &bull; <em>Relógio Cuco</em>. Escreva um método que pegue um bloco
        e o chame de hora em hora. Assim, se eu passar o bloco #{code "do puts 'DONG!' end"},
        ele deve tocar como um relógio cuco. Teste seu método com diferentes
        blocos (inclusive o que eu mostrei para você).
        <em><strong>Dica:</strong> Você pode usar
        </em>#{code 'Time.now.hour'}<em> para pegar a hora atual.
        Porém, isso retorna um número entre </em>#{code '0'}<em> e </em>#{code '23'}<em>,
        então você deve alterar esses números para os números de um relógio normal, entre
        (</em>#{code '1'}<em> e </em>#{code '12'}<em>).</em>
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        &bull; <em>Logger do programa</em>. Escreva um método chamado #{code 'log'}, que
        pegue uma string como descrição de um bloco e, é claro, um bloco. Similarmente ao
        #{code 'FacaUmaCoisaImportante'}, essa deve retornar (#{code 'puts'}) uma string
        dizendo que o bloco foi iniciado e outra string ao fim, dizendo que é o fim da
        execução do bloco, e também dizendo o que o bloco retornou. Teste seu método
        enviando um bloco de código. Dentro do bloco, coloque <em>outra</em> chamada para
        #{code 'log'}, passando outro bloco para o mesmo (isto é chamado de <dfn>nesting</dfn>).
        Em outras palavras, sua saída deve se parecer com isso:
        END_PARAGRAPH
      end
      puts '<pre class="L2PoutputBlock">' +
            'Começando "bloco externo"...' + $/ +
            'Começando "um bloco um pouco menor"...' + $/ +
            '..."um bloco um pouco menor" terminou retornando:  5' + $/ +
            'Começando "um outro bloco"...' + $/ +
            '..."um outro bloco" terminou retornando: Eu gosto de comida tailandesa!' + $/ +
            '..."bloco externo" terminou retornando: false' + $/ +
            '</pre>'
      para do <<-END_PARAGRAPH
        &bull; <em>Um Logger aperfeiçoado</em>. A saída do último logger é muito difícil de
        ler, e fica muito pior a medida que você for usando. Seria muito mais fácil de ler
        se você identasse as linhas para os blocos internos. Para fazer isso, você vai precisar
        saber quão profundamente aninhado você está toda vez que for escrever algo no log. Para
        fazer isso, use uma <dfn>variável global</dfn>, uma variável que você possa ver de
        qualquer lugar de seu código. Para instânciar uma variável global, você deve
        precedê-la com um #{code '$'}, assim: #{code '$global'}, #{code '$nestingDepth'},
        e #{code '$bigTopPeeWee'}.
        Enfim, seu logger deve ter uma saída parecida com essa:
        END_PARAGRAPH
      end
      puts '<pre class="L2PoutputBlock">' +
            'Começando "bloco externo"...' + $/ +
            '  Começando "um pequeno bloco"...' + $/ +
            '    Começando "pequenino bloco"...' + $/ +
            '    ..."pequenino bloco" terminou retornando: muito amor' + $/ +
            '  ..."um pequeno bloco" terminou retornando: 42' + $/ +
            '  Começando "um outro bloco"...' + $/ +
            '  ..."um outro bloco" terminou retornando: Eu adoro comida indiana!' + $/ +
            '..."bloco externo" terminou retornando: true' + $/ +
            '</pre>'
      para do <<-END_PARAGRAPH
        Bem, isso é tudo que você aprendeu com esse tutorial.
        Parabéns! Você aprendeu <em>muito</em>. Talvez você sinta
        como se não lembrasse de nada, ou talvez você tenha
        pulado algumas partes... Relaxe. Programação não é o que
        você sabe, e sim o que você faz. À medida que você for
        aprendendo onde procurar as coisas que você esquecer,
        você estará indo bem. Eu espero que você não ache que eu
        escrevi tudo isso sem ficar conferindo a cada minuto!
        Porque eu fiz isso. Eu também tive muita ajuda com os
        códigos que rodam em todos os exemplos desse tutorial.
        Mas onde <em>eu</em> estava pesquisando tudo e a quem
        <em>eu</em> estava pedindo ajuda?
        #{makeLink 'Deixe-me conhecê-lo...', :generateBeyond}
        END_PARAGRAPH
      end
    end
end
