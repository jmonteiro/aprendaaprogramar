module Classes
    #
    #  CLASSES
    #

    def generateClasses
      para do <<-END_PARAGRAPH
        Até agora nós vimos vários tipos diferentes, ou
        <dfn>classes</dfn>, de objetos:
        strings, integers, floats, arrays, e alguns objetos especiais
        (#{code 'true'}, #{code 'false'}, e #{code 'nil'}) que
        iremos falar mais sobre mais tarde.
        Em Ruby, essas classes tem sempre a primeira letra maiúscula:  #{code 'String'},
        #{code 'Integer'}, #{code 'Float'}, #{code 'Array'}... etc.
        Em geral, se queremos criar um novo objeto de uma
        certa classe, nós usamos #{code 'new'}:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        a = Array.new  + [12345]  #  Adição em Array.
        b = String.new + 'hello'  #  Adição em String.
        c = Time.new

        puts 'a = '+a.to_s
        puts 'b = '+b.to_s
        puts 'c = '+c.to_s
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Pelo fato de querermos criar arrays e strings usando
        #{code '[...]'} e #{code "'...'"} respectivamente, nós raramente os criamos 
        usando #{code 'new'}.  (Embora realmente não seja óbvio
        pelo exemplo acima, #{code 'String.new'} cria 
        uma string vazia, e #{code 'Array.new'} cria um array
        vazio.)  Além disso, números são excessões especiais:  você não pode
        criar um Inteiro com #{code 'Integer.new'}.  Você tem que
        escrever o Inteiro.
        END_PARAGRAPH
      end
      h2 {"The #{code 'Time'} Class"}
      para do <<-END_PARAGRAPH
        Portanto qual é a história da classe #{code 'Time'}?
        Objetos #{code 'Time'} representam momentos no tempo. Você pode
        adicionar (ou subtrair) numbers para (ou de) tempos para ter novos tempos:
        adicionando #{code '1.5'} a um tempo faz um novo tempo um segundo e meio
        depois:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        time  = Time.new   #  The moment you got this web page.
        time2 = time + 60  #  One minute later.

        puts time
        puts time2
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Você pode também criar um tempo para um momento específico usando
        #{code 'Time.mktime'}:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        puts Time.mktime(2000, 1, 1)          #  Y2K.
        puts Time.mktime(1976, 8, 3, 10, 11)  #  When I was born.
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Aviso:  that's when I was born in Pacific Daylight Savings
        Time (PDT).  When Y2K struck, though, it was Pacific
        Standard Time (PST), at least to us West Coasters.  The
        parentheses are to group the parameters to #{code 'mktime'}
        together.  The more parameters you add, the more accurate your
        time becomes.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Você pode comparar tempos usando métodos de comparação
        (um tempo recente é <em>menor</em> que um tempo futuro),
        e se você subtrair um tempo do outro, você terá o
        número de segundos entre eles.  Divirta-se com isso!
        END_PARAGRAPH
      end
      h2 {'A Few Things to Try'}
      para do <<-END_PARAGRAPH
        &bull; Um bilhão de segundos...  Descubra o exato segundo que você
        nasceu (se você puder).  Descubra quando você terá (ou
        talvez quando você teve?) um bilhão de segundos de idade. Então
        marque em seu calendário.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        &bull; Feliz Aniversário! Pergunte em que ano uma pessoa nasceu,
        o mês e o dia. Descruba a idade dela
        e de um grande #{output 'SPANK!'} para cada aniversário
        que ela já fez.
        END_PARAGRAPH
      end
      h2 {"The #{code 'Hash'} Class"}
      para do <<-END_PARAGRAPH
        Outra classe útil é a classe #{code 'Hash'}.  Hashes
        são muito parecidos com arrays: eles tem uma série de variáveis que
        podem apontar para objetos. Entretanto, no array, as
        variáveis estão em sequência como uma linha, e cada uma é numerada
        (começando em zero). Em um hash, as variáveis não estão 
        numa linha (como se estivessem unidos mas de forma desordenada), e você
        pode usar <em>qualquer</em> objeto para se referir a variável, não somente
        um número.  É bom usar hashes hashes quado você tem uma série
        de coisa que quer manter em ordem , mas elas não estão exatamente
        em uma lista ordenada.  Por exemplo, as cores que uso para diferentes
        partes do código que criam este tutorial:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        colorArray = []  #  mesmo que Array.new
        colorHash  = {}  #  mesmo que Hash.new

        colorArray[0]         = '#{STRING_COLOR}'
        colorArray[1]         = '#{NUMBER_COLOR}'
        colorArray[2]         = '#{KEYWORD_COLOR}'
        colorHash['strings']  = '#{STRING_COLOR}'
        colorHash['numbers']  = '#{NUMBER_COLOR}'
        colorHash['keywords'] = '#{KEYWORD_COLOR}'

        colorArray.each do |color|
          puts color
        end
        colorHash.each do |codeType, color|
          puts codeType + ':  ' + color
        end
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Se eu uso um array, tenho que me lembrar que a variável #{code '0'} é para
        strings, slot #{code '1'} é para números, etc.  Mas se eu usar um hash, é
        fácil!  Variável #{code "'strings'"} contém a cor das strings, é claro.
        Nada para se lembrar.  Você deve ter notado que quando nós usamos
        #{code 'each'}, os objetos em um hash não vieram na mesma
        ordem que colocamos.  (Ao menos não quando eu escrevi isso.
        Talvez eles venham agora... nunca se sabe com hashes.)  Arrays
        são para manter as coisas em ordem, não hashes.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Embora as pessoas costumem usar strings para nomear as variáveis de um hash, você
        poderia usar qualquer tipo de objeto, até mesmo arrays e outras hashes (mas eu não consigo
        pensar porque você faria isso...):
        END_PARAGRAPH
      end
      prog false do <<-END_CODE
        weirdHash = Hash.new

        weirdHash[12] = 'monkeys'
        weirdHash[[]] = 'emptiness'
        weirdHash[Time.new] = 'no time like the present'
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Hashes e arrays são bons em coisas diferentes; cabe
        a você decidir qual é melhor para o problema que for resolver.
        END_PARAGRAPH
      end
      h2 {'Extending Classes'}
      para do <<-END_PARAGRAPH
        No fim do capítulo passado, você escreveu um método para mostrar
        o equivalente em Português de um determinado Inteiro. Entretanto, não era um método 
        inteiro; era somente um método de "programa" genérico.  Não seria
        bom se você pudesse escrever algo como #{code '22.to_eng'}
        ao invés de #{code 'englishNumber 22'}?  Aqui está como você faria
        isso:
        END_PARAGRAPH
      end
      #  ALERT HACKER !!!  (Eu não posso pegar o namespace global trasparentemente
      #                  de dentro de um objeto StringIO em um script mod_ruby.)
      integerClassHack = <<-END_CODE
          def to_eng
            if self == 5
              english = 'five'
            else
              english = 'fifty-eight'
            end

            english
          end
        END_CODE

      Integer.module_eval integerClassHack  #  Esta é a real definição do método.
      #  Os seguintes definem um método em "outra" classe inteira:
      #  FIM DO ALERTA HACKER!!!
      prog do <<-END_CODE
        class Integer

  #{integerClassHack}
        end

        #  Eu testo melhor com um par de números...
        puts 5.to_eng
        puts 58.to_eng
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Bem , eu testei isso; Parece funcionar.  ;)
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Portanto nós definimos um método inteiro entrando na classe
        #{code 'Integer'}, definindo o método lá,
        e saindo.  Agora todos os inteiros tem esse
        (algo como incompleto) método.  De fato, se você não
        gosta da forma que um método como
        #{code 'to_s'} trabalha, você pode 
        redefini-lo da mesma forma... mas eu não recomendo
        isso!  É melhor manter os métodos antigos e criar 
        novos quando você quer fazer algo novo.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        So... confused yet?  Let me go over that last program
        some more.  So far, whenever we executed any code or
        defined any methods, we did it in the default
        "program" object.  In our last program, we left that
        object for the first time and went into the class
        #{code 'Integer'}.  We defined a method there (which
        makes it an integer method) and all integers can
        use it.  Inside that method we use #{code 'self'}
        to refer to the object (the integer) using the method.
        END_PARAGRAPH
      end
      h2 {'Creating Classes'}
      para do <<-END_PARAGRAPH
        We've seen a number of different classes of objects.
        However, it's easy to come up with kinds of objects
        that Ruby doesn't have.  Luckily, creating a new
        class is as easy as extending an old one.  Let's say
        we wanted to make some dice in Ruby.  Here's how we
        could make the Die class:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Die

          def roll
            1 + rand(6)
          end

        end

        #  Let's make a couple of dice...
        dice = [Die.new, Die.new]

        #  ...and roll them.
        dice.each do |die|
          puts die.roll
        end
        END_CODE
      end
      para do <<-END_PARAGRAPH
        (If you skipped the section on random numbers,
        #{code 'rand(6)'} just gives a random number between
        #{code '0'} and #{code '5'}.)
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        And that's it!  Objects of our very own.  Roll the dice
        a few times (with your reload button) and watch what
        turns up.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        We can define
        all sorts of methods for our objects... but there's
        something missing.  Working with these objects feels
        a lot like programming before we learned about
        variables.  Look at our dice, for example.  We can
        roll them, and each time we do they give us a different
        number.  But if we wanted to hang on to that number, we
        would have to create a variable to point to the number.
        It seems like any decent die should be able to <em>have</em>
        a number, and that rolling the die should change the number.
        If we keep track of the die, we shouldn't also have to keep track
        of the number it is showing.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        However, if we try to store the number we rolled in a (local)
        variable in #{code 'roll'}, it will be gone as soon as
        #{code 'roll'} is finished.  We need to store the number in
        a different kind of variable:
        END_PARAGRAPH
      end
      h2 {'Instance Variables'}
      para do <<-END_PARAGRAPH
        Normally when we want to talk about a string, we will just
        call it a <dfn>string</dfn>.  However, we could also call
        it a <dfn>string object</dfn>.  Sometimes programmers might
        call it <dfn>an instance of the class #{code 'String'}</dfn>, but this
        is just a fancy (and rather long-winded) way of saying
        <dfn>string</dfn>.  An <dfn>instance</dfn> of a class is just an
        object of that class.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        So instance variables are just an object's variables.  A
        method's local variables last until the method is finished.
        An object's instance variables, on the other hand, will
        last as long as the object does.  To tell instance variables
        from local variables, they have #{code '@'} in front of
        their names:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Die

          def roll
            @numberShowing = 1 + rand(6)
          end

          def showing
            @numberShowing
          end

        end

        die = Die.new
        die.roll
        puts die.showing
        puts die.showing
        die.roll
        puts die.showing
        puts die.showing
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Very nice!  So #{code 'roll'} rolls the die and
        #{code 'showing'} tells us which number is showing.
        However, what if we try to look at what's showing before
        we've rolled the die (before we've set #{code '@numberShowing'})?
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Die

          def roll
            @numberShowing = 1 + rand(6)
          end

          def showing
            @numberShowing
          end

        end

        #  Since I'm not going to use this die again,
        #  I don't need to save it in a variable.
        puts Die.new.showing
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Hmmm... well, at least it didn't give us an error.  Still,
        it doesn't really make sense for a die to be "unrolled", or
        whatever #{output 'nil'} is supposed to mean here.  It would
        be nice if we could set up our new die object right when it's
        created.  That's what #{code 'initialize'} is for:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Die

          def initialize
            #  I'll just roll the die, though we
            #  could do something else if we wanted
            #  to, like setting the die with 6 showing.
            roll
          end

          def roll
            @numberShowing = 1 + rand(6)
          end

          def showing
            @numberShowing
          end

        end

        puts Die.new.showing
        END_CODE
      end
      para do <<-END_PARAGRAPH
        When an object is created, its #{code 'initialize'}
        method (if it has one defined) is always called.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Our dice are just about perfect.  The only thing that
        might be missing is a way to set which side of a die
        is showing... why don't you write a #{code 'cheat'}
        method which does just that!  Come back when you're
        done (and when you tested that it worked, of course).
        Make sure that someone can't set the die to have a
        #{code '7'} showing!
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        So that's some pretty cool stuff we just covered.  It's tricky,
        though, so let me give another, more interesting example.
        Let's say we want to make a simple virtual pet, a baby
        dragon.  Like most babies, it should be able to eat, sleep,
        and poop, which means we will need to be able to feed it,
        put it to bed, and take it on walks.  Internally, our dragon
        will need to keep track of if it is hungry, tired, or needs
        to go, but we won't be able to see that when we interact
        with our dragon, just like you can't ask a human baby,
        "Are you hungry?".  We'll also add a few other fun ways
        we can interact with our baby dragon, and when he is born
        we'll give him a name.  (Whatever you pass into the
        #{code 'new'} method is passed into the #{code 'initialize'}
        method for you.)  Alright, let's give it a shot:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        class Dragon

          def initialize name
            @name = name
            @asleep = false
            @stuffInBelly     = 10  #  He's full.
            @stuffInIntestine =  0  #  He doesn't need to go.

            puts @name + ' is born.'
          end

          def feed
            puts 'You feed ' + @name + '.'
            @stuffInBelly = 10
            passageOfTime
          end

          def walk
            puts 'You walk ' + @name + '.'
            @stuffInIntestine = 0
            passageOfTime
          end

          def putToBed
            puts 'You put ' + @name + ' to bed.'
            @asleep = true
            3.times do
              if @asleep
                passageOfTime
              end
              if @asleep
                puts @name + ' snores, filling the room with smoke.'
              end
            end
            if @asleep
              @asleep = false
              puts @name + ' wakes up slowly.'
            end
          end

          def toss
            puts 'You toss ' + @name + ' up into the air.'
            puts 'He giggles, which singes your eyebrows.'
            passageOfTime
          end

          def rock
            puts 'You rock ' + @name + ' gently.'
            @asleep = true
            puts 'He briefly dozes off...'
            passageOfTime
            if @asleep
              @asleep = false
              puts '...but wakes when you stop.'
            end
          end

          private

          #  "private" means that the methods defined here are
          #  methods internal to the object.  (You can feed
          #  your dragon, but you can't ask him if he's hungry.)

          def hungry?
            #  Method names can end with "?".
            #  Usually, we only do this if the method
            #  returns true or false, like this:
            @stuffInBelly <= 2
          end

          def poopy?
            @stuffInIntestine >= 8
          end

          def passageOfTime
            if @stuffInBelly > 0
              #  Move food from belly to intestine.
              @stuffInBelly     = @stuffInBelly     - 1
              @stuffInIntestine = @stuffInIntestine + 1
            else  #  Our dragon is starving!
              if @asleep
                @asleep = false
                puts 'He wakes up suddenly!'
              end
              puts @name + ' is starving!  In desperation, he ate YOU!'
              exit  #  This quits the program.
            end

            if @stuffInIntestine >= 10
              @stuffInIntestine = 0
              puts 'Whoops!  ' + @name + ' had an accident...'
            end

            if hungry?
              if @asleep
                @asleep = false
                puts 'He wakes up suddenly!'
              end
              puts @name + '\\'s stomach grumbles...'
            end

            if poopy?
              if @asleep
                @asleep = false
                puts 'He wakes up suddenly!'
              end
              puts @name + ' does the potty dance...'
            end
          end

        end

        pet = Dragon.new 'Norbert'
        pet.feed
        pet.toss
        pet.walk
        pet.putToBed
        pet.rock
        pet.putToBed
        pet.putToBed
        pet.putToBed
        pet.putToBed
        END_CODE
      end
      para do <<-END_PARAGRAPH
        <em>Whew!</em>  Of course, it would be nicer if this was
        an interactive program, but you can do that part later.
        I was just trying to show the parts directly relating to
        creating a new dragon class.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        We saw a few new things in that example.  The first is
        simple:  #{code 'exit'} terminates the program right
        then and there.  The second is the word #{code 'private'}
        which we stuck right in the middle of our class definition.
        I could have left it out, but I wanted to enforce the idea
        of certain methods being things you can do to a dragon, and
        others which simply happen within the dragon.  You can think
        of these as being "under the hood":  unless you are an
        automobile mechanic, all you really need to know is the gas
        pedal, the brake pedal, and the steering wheel.  A programmer
        might call those the <dfn>public interface</dfn> to your car.
        How your airbag knows when to deploy, however, is internal to
        the car; the typical user (driver) doesn't need to know about
        this.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Actually, for a bit more concrete example along those lines,
        let's talk about how you might represent a car in a video
        game (which happens to be my line of work).  First, you would
        want to decide what you want your public interface to look like;
        in other words, which methods should people be able to call on
        one of your car objects?  Well, they need to be able to push
        the gas pedal and the brake pedal, but they would also need to
        be able to specify how hard they are pushing the pedal.  (There's
        a big difference between flooring it and tapping it.)  They would
        also need to be able to steer, and again, they would need to be
        able to say how hard they are turning the wheel.  I suppose you
        could go further and add a clutch, turn signals, rocket launcher,
        afterburner, flux capacitor, etc... it depends
        on what type of game you are making.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Internal to a car object, though, there would need to be much
        more going on; other things a car would need are a speed,
        a direction, and a position (at the most basic).  These attributes
        would be modified by pressing on the gas or brake pedals and
        turning the wheel, of course, but the user would not be able
        to set the position directly (which would be like warping).
        You might also want to keep track of skidding or damage, if
        you have caught any air, and so on.  These would all be internal
        to your car object.
        END_PARAGRAPH
      end
      h2 {'A Few Things to Try'}
      para do <<-END_PARAGRAPH
        &bull; Make an #{code 'OrangeTree'} class.  It should have a
        #{code 'height'} method which returns its height, and a
        #{code 'oneYearPasses'} method, which, when called, ages the tree
        one year.  Each year the tree grows taller (however much you think
        an orange tree should grow in a year), and after some number of
        years (again, your call) the tree should die.  For the first few
        years, it should not produce fruit, but after a while it should,
        and I guess that older trees produce more each year than younger
        trees... whatever you think makes most sense.  And, of course,
        you should be able to #{code 'countTheOranges'} (which returns
        the number of oranges on the tree), and #{code 'pickAnOrange'}
        (which reduces the #{code '@orangeCount'} by one and returns a
        string telling you how delicious the orange was, or else it just
        tells you that there are no more oranges to pick this year).
        Make sure that any oranges you don't pick one year fall off
        before the next year.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        &bull; Write a program so that you can interact with your
        baby dragon.  You should be able to enter commands like
        #{input 'feed'} and #{input 'walk'}, and have those methods
        be called on your dragon.  Of course, since what you are
        inputting are just strings, you will have to have some sort
        of <dfn>method dispatch</dfn>, where your program checks
        which string was entered, and then calls the appropriate method.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        And that's just about all there is to it!  But wait a second...
        I haven't told you about any of those classes for doing things
        like sending an email, or saving and loading files on your
        computer, or how to create windows and buttons, or 3D worlds,
        or anything!  Well, there are just <em>so many</em> classes
        you can use that I can't possibly show you them all; I don't
        even know what most of them are!  What I <em>can</em> tell
        you is where to find out more about them, so you can learn
        about the ones you want to program with.  Before I send you
        off, though, there is just one more feature of Ruby you should
        know about, something most languages don't have, but which I
        simply could not live without:
        #{makeLink 'blocks and procs', :generateBlocksProcs}.
        END_PARAGRAPH
      end

    end
end