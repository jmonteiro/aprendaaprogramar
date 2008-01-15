module Classes
    #
    #  CLASSES
    #

    def generateClasses
      para do <<-END_PARAGRAPH
        Até agora, nós vimos muitos tipos diferentes
        de objetos, ou <dfn>classes</dfn>:
        strings, inteiros, ponto flutuante, vetores
        e alguns objetos especiais (#{code 'true'}, #{code 'false'} e #{code 'nil'}),
        que vamos voltar a falar mais tarde.
        Em Ruby, todas essas classes sempre começam
        com maiúsculas: #{code 'String'}, #{code 'Integer'} (Inteiros),
        #{code 'Float'} (Ponto Flutuante), #{code 'Array'} (Vetores) e etc.
        Geralmente, se queremos criar um novo objeto
        de uma certa classe, nós usamos o #{code 'new'}:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        a = Array.new  + [12345]  #  Adição de Vetores.
        b = String.new + 'olá'  #  Adição com Strings.
        c = Time.new

        puts 'a = '+a.to_s
        puts 'b = '+b.to_s
        puts 'c = '+c.to_s
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Como nós podemos criar vetores e strings usando
        #{code '[...]'} e #{code "'...'"}, respectivamente,
        nós raramente usamos o #{code 'new'} para isso (De qualquer
        forma, não está muito claro, no exemplo anterior, que #{code 'String.new'}
        cria uma string vazia e que #{code 'Array.new'} cria um
        vetor vazio). Números, porém, são uma exceção: você não
        pode criar um inteiro usando #{code 'Integer.new'}. Você
        apenas tem que digitar o número.
        END_PARAGRAPH
      end
      h2 {"A classe #{code 'Time'}"}
      para do <<-END_PARAGRAPH
        Está bem, e a classe #{code 'Time'}?
        Objetos #{code 'Time'} representam momentos de tempo.
        Você pode adicionar (ou subtrair) números para (ou de)
        tempos para conseguir novos instantes: adicionando
        #{code '1.5'} a um instante, retorna um novo instante
        de um segundo e meio depois:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        tempo  = Time.new    #  O instante em que você carrega esta página.
        tempo2 = tempo + 60  #  Um minuto depois.

        puts tempo
        puts tempo2
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Você pode, também, fazer um tempo para um momento
        específico usando #{code 'Time.mktime'}:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        puts Time.mktime(2000, 1, 1)          #  Ano 2000.
        puts Time.mktime(1976, 8, 3, 10, 11)  #  Ano em que nasci.
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Nota: quando eu nasci, estava em uso o Horário de Verão
        do Pacífico (PDT, em Inglês). Quanto o ano 2000
        chegou, porém, estava em uso o Horário Padrão do Pacífico
        (PST, em Inglês), pelo menos para nós, da costa Oeste.
        Os parênteses servem para agrupar os parâmetros para o
        #{code 'mktime'}. Quanto mais parâmetros você adicionar,
        mais preciso o seu instante se tornará.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Você pode comparar dois tempos utilizando os métodos
        de comparação (um tempo anterior é <em>menor que</em
        um tempo futuro), e se você subtrair um tempo de outro
        você terá a diferença, em segundos, entre ambos.
        Vamos brincar com isso um pouco!
        END_PARAGRAPH
      end
      h2 {'Algumas Coisinhas Para Tentar'}
      para do <<-END_PARAGRAPH
        &bull; Um bilhão de segundos... Encontre o segundo exato
        do seu nascimento (se você puder). Descubra quando você
        fará (ou quando você fez?) um bilhão de segundos de idade.
        Então vá marcar na sua folhinha.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        &bull; Feliz Aniversário! Pergunte o ano de nascimento em
        que uma pessoa nasceu. Então pergunte o mês e, finalmente,
        o dia. Então descubra a idade dessa pessoa e lhe dê um
        #{output 'PUXÃO DE ORELHA!'} para cada aniverśario
        que ela fez.
        END_PARAGRAPH
      end
      h2 {"A Classe #{code 'Hash'}"}
      para do <<-END_PARAGRAPH
        Outra classe muito útil é a classe #{code 'Hash'}. Hashes
        são muito parecidos com vetores: eles têm um monte de
        espaços que podem conter vários objetos. Porém, em um
        vetor, os espaços são dispostos em uma linha, e cada um
        é numerado (iniciando pelo zero). Em um Hash, porém, os
        espaços não estão dispostos em uma linha (eles estão apenas
        juntos), e você pode usar <em>qualquer</em> objeto para se
        referir a um espaço, não apenas um número. É bom usar
        hashes quando você tem uma porção de coisas que você quer
        armazenar, mas que não têm, realmente, uma ordem. Por exemplo,
        as cores que eu uso em diversas partes desse tutorial:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        colorArray = []  #  o mesmo que Array.new
        colorHash  = {}  #  o mesmo que Hash.new

        colorArray[0]         = '#{::STRING_COLOR}'
        colorArray[1]         = '#{::NUMBER_COLOR}'
        colorArray[2]         = '#{::KEYWORD_COLOR}'
        colorHash['strings']  = '#{::STRING_COLOR}'
        colorHash['numbers']  = '#{::NUMBER_COLOR}'
        colorHash['keywords'] = '#{::KEYWORD_COLOR}'

        colorArray.each do |color|
          puts color
        end
        colorHash.each do |codeType, color|
          puts codeType + ':  ' + color
        end
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Se eu usar um vetor, eu tenho que me lembrar que o espaço #{code '0'}
        é para strings, o slot #{code '1'} é para números e etc. Mas se eu
        usar um Hash, fica fácil! O espaço #{code "'strings'"} armazena a cor
        das strings, claro. Nada para lembrar.  Você deve ter notado que quando
        eu usei o #{code 'each'}, os objetos no hash não vieram na mesma ordem
        que eu os coloquei (Pelo menos não quando eu escrevi isso. Talvez agora
        esteja em ordem... você nunca sabe a ordem com os hashes). Vetores servem
        para colocar as coisas em ordem, os Hashes não.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Apesar das pessosas normalmente usarem strings para nomear os
        espaços em um hash, você pode usar qualquer tipo de objeto, até
        mesmo vetores e outros hashes (apesar de eu não conseguir achar
        uma razão para você fazer isso...):
        END_PARAGRAPH
      end
      prog false do <<-END_CODE
        hashBizarro = Hash.new

        hashBizarro[12] = 'macacos'
        hashBizarro[[]] = 'totalmente vazio'
        hashBizarro[Time.new] = 'nada melhor que o Presente'
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Hashes e vetores são bons para coisas diferentes: a
        escolha sobre qual resolve o seu problema melhor é sua,
        e diferente para todos os problemas que você tiver.
        END_PARAGRAPH
      end
      h2 {'Expandindo Classes'}
      para do <<-END_PARAGRAPH
        No fim do último capítulo, você escreveu um método para
        retornar um número por extenso. Porém, esse não era um
        método de inteiros: era um método genérico do programa.
        Não seria mais legal se você pudesse escrever #{code '22.ext'}
        ao invés de #{code 'porExtenso 22'}? Olha só como você
        pode fazer isso:
        END_PARAGRAPH
      end
      #  HACK ALERT!!!  (Eu não posso chegar a um namespace global transparentemente
      #                  de dentro do objeto StringIO em um script mod_ruby.)
      integerClassHack = <<-END_CODE
          def ext
            if self == 5
              porExtenso = 'cinco'
            else
              porExtenso = 'cinqüenta e oito'
            end

            porExtenso
          end
        END_CODE

      Integer.module_eval integerClassHack  #  Esta é a definição real do método.
      #  A seguir é definido um método em "outra" classe de inteiros:
      #  FIM HACK ALERT!!!
      prog do <<-END_CODE
        class Integer

  #{integerClassHack}
        end

        #  Eu prefiro testar sempre em duplas...
        puts 5.ext
        puts 58.ext
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Bem, eu testei; e nada explodiu. :)
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Nós definimos um método inteiro apenas "pulando"
        dentro da classe #{code 'Integer'}, definindo o
        método lá dentro e caindo fora. Agora todos os
        inteiros tem esse sensacional (incompleto) método.
        Na verdade, se você não gostar da forma como o
        método nativo #{code 'to_s'} faz as coisas, você
        pode simplesmente redefini-lo da mesma forma...
        mas eu não recomendo isso! É melhor deixar os métodos
        antigos quietos em seu canto e fazer novos quando
        você precisar de uma coisa nova.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Confuso ainda? Deixe-me voltar até o último programa
        mais um pouco. Até agora, quando nós executamos qualquer
        código ou definido um método, nós o fizemos no objeto
        "programa" padrão. No nosso último programa, nós saímos
        daquele objeto pela primeira vez e fomos para dentro
        da classe #{code 'Integer'}. Nós definimos um método
        lá (o que o tornou um método inteiro) e todos os inteiros
        podem usar ele. Dentro daquele métodos, nós usamos o
        #{code 'self'} para nos referir ao objeto (o inteiro)
        que estiver usando o método.
        END_PARAGRAPH
      end
      h2 {'Criando Classes'}
      para do <<-END_PARAGRAPH
        Nós já vimos um monte de objetos de classes diferentes.
        Porém, é fácil criar tipos de objeto que o Ruby não
        tenha. Por sorte, criar uma classe nova é tão fácil
        como expandir uma classe já existente. Vamos supor
        que eu queira rodar alguns dados no Ruby. Olhe
        como podemos fazer uma classe chamada Dado:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Dado

          def rolar
            1 + rand(6)
          end

        end

        #  Vamos fazer dois dados...
        dados = [Dado.new, Dado.new]

        #  ...e rolar cada um deles.
        dados.each do |dado|
          puts dado.rolar
        end
        END_CODE
      end
      para do <<-END_PARAGRAPH
        (Se você pulou a parte que falava sobre números
        aleatórios, #{code 'rand(6)'} apenas devolve
        um número aleatório entre #{code '0'} e #{code '5'}).
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Só isso! Objetos de nossa própria autoria. Role os dados
        algumas vezes (utilizando o botão de "Atualizar" do seu
        navegador) e veja o que acontece.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Nós podemos definir todo o tipo de métodos para
        os nossos objetos... mas tem alguma coisa errada.
        Trabalhando com esses objetos não mudou grande
        coisa desde que aprendemos a mexer com variáveis.
        Olhe o nosso dado, por exemplo. Cada vez que rolamos
        ele, nós temos um número diferente. Mas se nós quisermos
        salvar aquele número, nós temos que criar uma variável
        e apontar para aquele número. E qualquer dado que
        preste deve <em>ter</em> um número, e rolando o dado
        deve mudar o número. Se nós armazenarmos o dado, nós
        não temos como saber qual número ele está mostrando.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Porém, se nós tentarmos armazenar o número que nós tirmaos
        no dado em uma variável (local) dentro de #{code 'rolar'},
        o valor será perdido assim que o #{code 'rolar'} acabar.
        Nós precisamos salvar esse número em um tipo diferente
        de variável:
        END_PARAGRAPH
      end
      h2 {'Variáveis de Instância'}
      para do <<-END_PARAGRAPH
        Normalmente quando falamos sobre strings, nós apenas nos
        referimos a elas como <dfn>strings</dfn>. Porém, nós
        poderíamos chamá-las de <dfn>Objetos do tipo String</dfn>.
        Algumas vezes, alguns programadores podem chamá-las de
        <dfn>instâncias da classe #{code 'String'}</dfn>, mas essa
        é uma forma exagerada (e muito longa) de dizer <dfn>string</dfn>.
        Uma <dfn>instância</dfn> de uma classe é apenas um objeto
        daquela classe.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Portanto, variáveis de instância são como variáveis de
        objeto. Uma variável local de um método ficam vivas até
        que o método termine. Uma variável de instância de um
        objeto, por outro lado, ficará viva enquanto o objeto
        estiver vivo. Para diferenciar variáveis de instância
        de variáveis locais, elas têm uma #{code '@'} na frente
        dos seus nomes:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Dado

          def rolar
            @numeroMostrado = 1 + rand(6)
          end

          def mostrado
            @numeroMostrado
          end

        end

        dado = Dado.new
        dado.rolar
        puts dado.mostrado
        puts dado.mostrado
        dado.rolar
        puts dado.mostrado
        puts dado.mostrado
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Muito legal! Agora o #{code 'rolar'} rola o dado
        e o #{code 'mostrado'} nos diz qual é o número
        que saiu.
        Mas e se quisermos ver qual número saiu antes
        de rolar o dado (antes de termos definido
        #{code '@numeroMostrado'})?
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Dado

          def rolar
            @numeroMostrado = 1 + rand(6)
          end

          def mostrado
            @numeroMostrado
          end

        end

        #  Já que eu não vou mais usar esse dado,
        #  eu não preciso salvá-lo em uma variável.
        puts Dado.new.mostrado
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Hum... Bem, pelo menos não deu erro. Espera aí, não faz
        muito sentido um dado "não-rolado" ou o que quer que
        #{output 'nil'} signifique aqui. Seria muito mais
        bacana se nós pudessemos rolar o dado assim que ele
        for criado. É isso que o #{code 'initialize'} faz:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Dado

          def initialize
            #  Eu vou apenas rolar o dado, apesar de
            #  podermos fazer qualquer coisa que
            #  queiramos fazer, como colocar a face '6'
            #  para cima
            rolar
          end

          def rolar
            @numeroMostrado = 1 + rand(6)
          end

          def mostrado
            @numeroMostrado
          end

        end

        puts Dado.new.mostrado
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Quando um objeto é criado, o método #{code 'initialize'}
        (se foi definido) é sempre chamado.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Nosso dado está quase perfeito. A única coisa que falta
        é uma maneira de arrumar qual número está sendo mostrado...
        Por que você não escreve o método #{code 'trapaca'}
        que faça isso? Volte quando tiver terminado (e quando
        você testar e funcionar, lógico). Apenas tenha certeza
        de que ninguém pode fazer com o que o dado mostre
        um #{code '7'}!
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Foi muito legal o que fizemos até agora. Mas foi apenas uma
        brincadeira, mesmo assim. Deixe-me mostrar um exemplo mais
        interessante. Vamos fazer um bichinho virtual, um dragão bebê.
        Assim como todos os bebês, ele deve conseguir comer, dormir e
        "atender à natureza", o que significa que vamos ter que ter
        como alimentá-lo, colocá-lo pra dormir e levar ele até o quintal.
        Internamente, o nosso dragão precisa saber se está com fome,
        cansado ou se precisa ir lá fora, mas nós não poderemos ver
        isso enquanto estivermos interagindo com ele, assim como você
        não pode perguntar a um bebê "você está com fome?". Então
        nós vamos adicionar algumas maneiras legais para interagir
        com nosso dragão bebê, e quando ele nascer nós vamos dar um
        nome para ele (Qualquer coisa que você passe como parâmetro
        para o método #{code 'new'} será passado para o método
        #{code 'initialize'} para você). Certo, vamos tentar:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Dragao

          def initialize nome
            @nome = nome
            @dormindo = false
            @comidaEstomago  = 10 #  Ele está cheio
            @comidaIntestino =  0 #  Ele não precisa ir ao quintal

            puts @nome + ' nasceu.'
          end

          def alimentar
            puts 'Você alimentou o ' + @nome + '.'
            @comidaEstomago = 10
            passagemDeTempo
          end

          def quintal
            puts 'Você levou o ' + @nome + ' até o quintal.'
            @comidaIntestino = 0
            passagemDeTempo
          end

          def colocarNaCama
            puts 'Você colocou o ' + @nome + ' na cama.'
            @dormindo = true
            3.times do
              if @dormindo
                passagemDeTempo
              end
              if @dormindo
                puts @nome + ' está roncando e enchendo o quarto de fumaça.'
              end
            end
            if @dormindo
              @dormindo = false
              puts @nome + ' está acordando.'
            end
          end

          def jogar
            puts 'Você joga o ' + @nome + ' no ar.'
            puts 'Ele dá uma risadinha e queima suas sobrancelhas.'
            passagemDeTempo
          end

          def balancar
            puts 'Você balança o ' + @nome + ' gentilmente.'
            @dormindo = true
            puts 'Ele começa a cochilar...'
            passagemDeTempo
            if @dormindo
              @dormindo = false
              puts '...mas acorda quando você pára.'
            end
          end

          private

          #  "private" significa que os métodos definidos aqui
          #  são métodos internos do objeto. (Você pode
          #  alimentá-lo, mas você não pode perguntar se
          #  ele está com fome.)

          def comFome?
            #  Nomes de métodos podem acabar com "?".
            #  Normalmente, nós fazemos isso apenas
            #  se o métodos retorna verdadeiro ou falso,
            #  como esse:
            @comidaEstomago <= 2
          end

          def precisaSair?
            @comidaIntestino >= 8
          end

          def passagemDeTempo
            if @comidaEstomago > 0
              #  Mover a comida do estômago para o intestino.
              @comidaEstomago  = @comidaEstomago  - 1
              @comidaIntestino = @comidaIntestino + 1
            else  #  Nosso dragão está faminto!
              if @dormindo
                @dormindo = false
                puts 'Ele está acordando!'
              end
              puts @nome + ' está faminto! Em desespero, ele comeu VOCÊ!'
              exit  #  Isso sai do programa.
            end

            if @comidaIntestino >= 10
              @comidaIntestino = 0
              puts 'Ops!  ' + @nome + ' teve um acidente...'
            end

            if comFome?
              if @dormindo
                @dormindo = false
                puts 'Ele está acordando!'
              end
              puts 'O estômago do ' + @nome + ' está roncando...'
            end

            if precisaSair?
              if @dormindo
                @dormindo = false
                puts 'Ele está acordando!'
              end
              puts @nome + ' faz a dança para ir ao quintal...'
            end
          end

        end

        bichinho = Dragao.new 'Norbert'
        bichinho.alimentar
        bichinho.jogar
        bichinho.quintal
        bichinho.colocarNaCama
        bichinho.balancar
        bichinho.colocarNaCama
        bichinho.colocarNaCama
        bichinho.colocarNaCama
        bichinho.colocarNaCama
        END_CODE
      end
      para do <<-END_PARAGRAPH
        <em>UAU!</em> Claro que seria muito mais legal se 
        esse fosse um programa interativo, mas você pode
        fazer essa parte depois. Eu apenas estava tentando
        mostrar as partes relacionadas diretamente a criar
        uma nova classe do tipo Dragão.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Nós dissemos um monte de coisas novas nesse exemplo.
        A primeira é simples: #{code 'exit'} termina o
        programa onde estiver. A segunda é a palavra #{code 'private'},
        que nós colocamos bem no meio da nossa classe. Eu
        podia ter deixado ela de fora, mas eu apenas quis
        reforçar a idéia de que certos métodos você podia
        fazer com um dragão, enquanto que outros aconteciam
        com o dragão. Você pode pensar nisso como "coisas por trás dos panos":
        a não ser que você seja um mecânico de automóveis, tudo
        o que você precisa saber sobre carros é o acelerador,
        o freio e a direção. Um programador chama isso de
        <dfn>interface pública</dfn, para o seu carro.
        Como o seu airbag sabe a hora de funcionar, porém,
        é algo interno ao carro; o usuário típico (o motorista)
        não precisa saber disso.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Agora, para um exemplo mais concreto nessa linha de raciocínio,
        vamos falar um pouco sobre como você representaria um carro
        em um jogo (o que é a minha linha de trabalho). Primeiro,
        você precisa decidir como irá se parecer sua interface pública;
        em outras palavras, quais métodos as pessoas podem chamar
        do seus objetos do tipo carro? Bem, eles devem podem acelerar e
        freiar, mas eles precisam, também, poder definir a força que
        estão aplicando no pedal (Há uma grande diferença entre tocar o
        acelerador e afundar o pé). Eles vão precisar também guiar, e
        novamente, e dizer que força estão aplicando na direção. Eu
        acho que você pode ir ainda mais longe e adicionar uma embreagem,
        piscas, lançador de foguetes, incinerador traseiro, um condensador
        de fluxo e etc... depende do tipo de jogo que você está fazendo.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Os objetos internos a um carro, porém, são mais complexos:
        outras coisas que um carro precisa são a velocidade, a
        direção e a posição (ficando no básico). Esses atributos
        serão modificados pressionando o pedal do acelerador ou o
        de freio e girando o volante, claro, mas o usuário não deve
        poder alterar essas informações diretamente (o que seria uma
        distorção). Você pode querer checar a derrapagem ou o dano,
        a resistência do ar e por aí vai. Tudo isso diz respeito
        apenas ao carro. Tudo isso é interno ao carro.
        END_PARAGRAPH
      end
      h2 {'Algumas Coisinhas Para Tentar'}
      para do <<-END_PARAGRAPH
        &bull; Faça uma classe de #{code 'ArvoreDeLaranja'}. Ela deve
        ter um método #{code 'altura'} que retorne sua altura, um método
        chamado #{code 'passar_um_ano'} que, quando chamado, faz a árvore
        completar mais um ano de vida. Cada ano, a árvore cresce mais magra
        (não importa o quão grande você ache que uma árvore de laranja
        possa crescer em um ano), e depois de alguns anos (novamente,
        você faz as chamadas) a árvore deve morrer. Nos primeiros anos,
        ela não deve produzir frutos, mas depois de um tempo ela deve,
        e eu acho que as árvores mais velhas produzem muito mais frutos
        do que uma mais jovem com o passar dos anos... ou o que você
        achar mais lógico. E, é claro, você deve poder #{code 'contar_as_laranjas'}
        (o número de laranjas na árvore), e #{code 'pegar_uma_laranja'}
        (que irá reduzir o #{code '@numero_de_laranjas'} em um e retornar
        uma string dizendo quão deliciosa a laranja estava, ou então
        irá dizer que não há mais laranjas esse ano). Lembre-se de que
        as laranjas que você não pegar esse ano devem cair antes do
        próximo ano.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        &bull; Escreva um programa para que você possa
        interagir com o seu filhote de dragão. Você deve
        ser capaz de inserir comandos como #{input 'alimentar'}
        e #{input 'quintal'}, e esses métodos devem ser
        chamados no seu dragão. Logicamente que, como toda
        a entrada será por strings, você deve ter uma forma
        de <dfn>repassar os métodos</dfn>, onde seu programa
        deve validar a string digitada e chamar o método
        apropriado.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        E isso é tudo! Mas espere um pouco... Eu não disse nada a
        você sobre classes para fazer coisas como mandar um e-mail,
        ou salvar e carregar arquivos do seu computador, ou
        como criar janelas e botões, ou mundos em 3D ou qualquer coisa!
        Bem, há apenas <em>muitas</em> classes que você pode usar, e
        isso torna impossível que eu mostre todas para você; mesmo eu
        não conheço todas elas. O que eu <em>posso</em> dizer para você
        é onde encontrar mais sobre elas, assim você pode aprender mais
        sobre as que você quiser usar. Mas antes de mandar você embora,
        há mais um recurso do Ruby que você deveria saber, algo que
        a maioria das outras linguagens não tem, mas que eu simplesmente
        não posso viver sem:
        #{makeLink 'blocos e procs', :generateBlocksProcs}.
        END_PARAGRAPH
      end

    end
end
