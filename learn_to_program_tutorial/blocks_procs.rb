module BlocksProcs
    #
    #  BLOCKS AND PROCS
    #

    def generateBlocksProcs
      para do <<-END_PARAGRAPH
        Esta é, definitivamente, um dos recursos mais legais de Ruby. Algumas
        outras linguagens têm esse recurso, porém elas podem chamar isso
        de formas diferentes (como <dfn>closures</dfn>), mas muitas
        das mais populares não, o que é uma vergonha.
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
        toast = Proc.new do
          puts 'Olá!'
        end

        toast.call
        toast.call
        toast.call
        END_CODE
      end
      para do <<-END_PARAGRAPH
        So I created a proc (which I think is supposed to be short for
        "procedure", but far more importantly, it rhymes with "block")
        which held the block of code, then I #{code 'call'}ed the proc
        three times.  As you can see, it's a lot like a method.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Actually, it's even more like a method than I have shown you, because
        blocks can take parameters:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        doYouLike = Proc.new do |aGoodThing|
          puts 'I *really* like '+aGoodThing+'!'
        end

        doYouLike.call 'chocolate'
        doYouLike.call 'ruby'
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Ok, so we see what blocks and procs are, and how to use them, but what's
        the point?  Why not just use methods?  Well, it's because there are some
        things you just can't do with methods.  In particular, you can't pass
        methods into other methods (but you can pass procs into methods), and methods
        can't return other methods (but they can return procs).  This is simply because
        procs are objects; methods aren't.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        (By the way, is any of this looking familiar?  Yep, you've seen blocks before... when
        you learned about iterators.  But let's talk more about that in a bit.)
        END_PARAGRAPH
      end
      h2 { 'Methods Which Take Procs' }
      para do <<-END_PARAGRAPH
        When we pass a proc into a method, we can control how, if, or how many times we call
        the proc.  For example, let's say there's something we want to do before and after
        some code is run:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def doSelfImportantly someProc
          puts 'Everybody just HOLD ON!  I have something to do...'
          someProc.call
          puts 'Ok everyone, I\\'m done.  Go on with what you were doing.'
        end

        sayHello = Proc.new do
          puts 'hello'
        end

        sayGoodbye = Proc.new do
          puts 'goodbye'
        end

        doSelfImportantly sayHello
        doSelfImportantly sayGoodbye
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Maybe that doesn't appear particulary fabulous... but it is.  :-)
        It's all too common in programming to have strict requirements about what
        must be done when.  If you want to save a file, for example, you have to
        open the file, write out the information you want it to have, and then close
        the file.  If you forget to close the file, Bad Things(tm) can happen.  But
        each time you want to save or load a file, you have to do the same thing:
        open the file, do what you <em>really</em> want to do, then close the file.
        It's tedious and easy to forget.  In Ruby, saving (or loading) files works
        similarly to the code above, so you don't have to worry about anything but
        what you actually want to save (or load).  (In the next chapter I'll show you
        where to find out how to do things like save and load files.)
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        You can also write methods which will determine how many times, or even
        <em>if</em> to call a proc.  Here's a method which will call the proc passed in
        about half of the time, and another which will call it twice:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def maybeDo someProc
          if rand(2) == 0
            someProc.call
          end
        end

        def twiceDo someProc
          someProc.call
          someProc.call
        end

        wink = Proc.new do
          puts '<wink>'
        end

        glance = Proc.new do
          puts '<glance>'
        end

        maybeDo wink
        maybeDo glance
        twiceDo wink
        twiceDo glance
        END_CODE
      end
      para do <<-END_PARAGRAPH
        (If you reload this page a few times, you'll see the output change.)  These are some of
        the more common uses of procs which enable us to do things we simply could not have done
        using methods alone.  Sure, you could write a method to wink twice, but you couldn't write
        one to just do <em>something</em> twice!
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        Before we move on, let's look at one last example.  So far the procs
        we have passed in have been fairly similar to each other.  This time
        they will be quite different, so you can see how much such a method
        depends on the procs passed into it.  Our
        method will take some object and a proc, and will call the proc
        on that object.  If the proc returns false, we quit; otherwise
        we call the proc with the returned object.  We keep doing this
        until the proc returns false (which it had better do eventually,
        or the program will crash).  The method will return the last
        non-false value returned by the proc.
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def doUntilFalse firstInput, someProc
          input  = firstInput
          output = firstInput

          while output
            input  = output
            output = someProc.call input
          end

          input
        end

        buildArrayOfSquares = Proc.new do |array|
          lastNumber = array.last
          if lastNumber <= 0
            false
          else
            array.pop                         #  Take off the last number...
            array.push lastNumber*lastNumber  #  ...and replace it with its square...
            array.push lastNumber-1           #  ...followed by the next smaller number.
          end
        end

        alwaysFalse = Proc.new do |justIgnoreMe|
          false
        end

        puts doUntilFalse([5], buildArrayOfSquares).inspect
        puts doUntilFalse('I\\'m writing this at 3:00 am; someone knock me out!', alwaysFalse)
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Ok, so that was a pretty weird example, I'll admit.  But it shows how differently
        our method acts when given very different procs.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        The #{code 'inspect'} method is a lot like #{code 'to_s'}, except
        that the string it returns tries to show you the ruby code for
        building the object you passed it.  Here it shows us the whole
        array returned by our first call to #{code 'doUntilFalse'}.  Also, you might
        notice that we never actually squared that #{code '0'} on the end of that
        array, but since #{code '0'} squared is still just #{code '0'}, we didn't have to.
        And since #{code 'alwaysFalse'} was, you know, always #{code 'false'},
        #{code 'doUntilFalse'} didn't do anything at all the second time we
        called it; it just returned what was passed in.
        END_PARAGRAPH
      end
      h2 { 'Methods Which Return Procs' }
      para do <<-END_PARAGRAPH
        One of the other cool things you can do with procs is to create
        them in methods and return them.  This allows all sorts of crazy
        programming power (things with impressive names, like
        <dfn>lazy evaluation</dfn>, <dfn>infinite data structures</dfn>,
        and <dfn>currying</dfn>),
        but the fact is that I almost never do this in practice, nor
        can I remember seeing anyone else do this in their code.  I think
        it's the kind of thing you don't usually end up having to do in Ruby,
        or maybe Ruby just encourages you to find other solutions; I don't
        know.  In any case, I will only touch on this briefly.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        In this example, #{code 'compose'} takes two procs and returns a new
        proc which, when called, calls the first proc and passes its result
        into the second proc.
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def compose proc1, proc2
          Proc.new do |x|
            proc2.call(proc1.call(x))
          end
        end

        squareIt = Proc.new do |x|
          x * x
        end

        doubleIt = Proc.new do |x|
          x + x
        end

        doubleThenSquare = compose doubleIt, squareIt
        squareThenDouble = compose squareIt, doubleIt

        puts doubleThenSquare.call(5)
        puts squareThenDouble.call(5)
        END_CODE
      end
      para do <<-END_PARAGRAPH
        Notice that the call to #{code 'proc1'} had to be inside the
        parentheses for #{code 'proc2'} in order for it to be done first.
        END_PARAGRAPH
      end
      h2 { 'Passing Blocks (Not Procs) into Methods' }
      para do <<-END_PARAGRAPH
        Ok, so this has been sort of academically interesting, but also
        sort of a hassle to use.  A lot of the problem is that there are
        three steps you have to go through (defining the method, making
        the proc, and calling the method with the proc), when it sort of
        feels like there should only be two (defining the method, and
        passing the <em>block</em> right into the method, without using
        a proc at all), since most of the time you don't want to use the
        proc/block after you pass it into the method.  Well, wouldn't you
        know, Ruby has it all figured out for us!  In fact, you've already
        been doing it every time you use iterators.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        I'll show you a quick example first, then we'll talk about it.
        END_PARAGRAPH
      end
      #  HACK ALERT!!!  (I can't get to the global namespace transparently
      #                  from inside the StringIO object in a mod_ruby script.)
      arrayClassHack = <<-END_CODE
          def eachEven(&wasABlock_nowAProc)
            isEven = true  #  We start with "true" because arrays start with 0, which is even.

            self.each do |object|
              if isEven
                wasABlock_nowAProc.call object
              end

              isEven = (not isEven)  #  Toggle from even to odd, or odd to even.
            end
          end
        END_CODE

      Array.module_eval arrayClassHack  #  This is the real method definition.
      #  The following defines a method in "another" array class:
      #  END HACK ALERT!!!
      prog do <<-END_CODE
        class Array

  #{arrayClassHack}
        end

        ['apple', 'bad apple', 'cherry', 'durian'].eachEven do |fruit|
          puts 'Yum!  I just love '+fruit+' pies, don\\'t you?'
        end

        #  Remember, we are getting the even-numbered elements
        #  of the array, all of which happen to be odd numbers,
        #  just because I like to cause problems like that.
        [1, 2, 3, 4, 5].eachEven do |oddBall|
          puts oddBall.to_s+' is NOT an even number!'
        end
        END_CODE
      end
      para do <<-END_PARAGRAPH
        So to pass in a block to #{code 'eachEven'}, all we had to do was stick
        the block after the method.  You can pass a block into any method this
        way, though many methods will just ignore the block.  In order to make
        your method <em>not</em> ignore the block, but grab it and turn it into
        a proc, put the name of the proc at the end of your method's parameter
        list, preceded by an ampersand (#{code '&'}).  So that part is a little
        tricky, but not too bad, and you only have to do that once (when you
        define the method).  Then you can use the method over and over again,
        just like the built-in methods which take blocks, like #{code 'each'}
        and #{code 'times'}.  (Remember #{code '5.times do'}...?)
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        If you get confused, just remember what #{code 'eachEven'} is supposed to do:  call
        the block passed in with every other element in the array.  Once
        you've written it and it works, you don't need to think about what it's
        actually doing under the hood ("which block is called when??"); in
        fact, that's exactly <em>why</em> we write methods like this:  so we
        never have to think about how they work again.  We just use them.
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        I remember one time I wanted to be able to time how long different
        sections of a program were taking.  (This is also known as
        <dfn>profiling</dfn> the code.)  So I wrote a method which takes
        the time before running the code, then it runs it, then it takes
        the time again at the end and figures out the difference.  I can't
        find the code right now, but I don't need it; it probably
        went something like this:
        END_PARAGRAPH
      end
      prog do <<-END_CODE
        def profile descriptionOfBlock, &block
          startTime = Time.now

          block.call

          duration = Time.now - startTime

          puts descriptionOfBlock+':  '+duration.to_s+' seconds'
        end

        profile '25000 doublings' do
          number = 1

          25000.times do
            number = number + number
          end

          puts number.to_s.length.to_s+' digits'  #  That is, the number of digits in this HUGE number.
        end

        profile 'count to a million' do
          number = 0

          1000000.times do
            number = number + 1
          end
        end
        END_CODE
      end
      para do <<-END_PARAGRAPH
        How simple!  How elegant!  With that tiny method,
        I can now easily time any section of any program that I want to; I
        just throw the code in a block and send it to #{code 'profile'}.
        What could be simpler?  In most languages, I would have to explicitly
        add that timing code (the stuff in #{code 'profile'}) around every
        section which I wanted to time.  In Ruby, however, I get to keep it
        all in one place, and (more importantly) out of my way!
        END_PARAGRAPH
      end
      h2 {'A Few Things to Try'}
      para do <<-END_PARAGRAPH
        &bull; <em>Grandfather Clock</em>.  Write a method which takes a block
        and calls it once for each hour that has passed today.  That way, if I
        were to pass in the block #{code "do puts 'DONG!' end"}, it would chime
        (sort of) like a grandfather clock.  Test your method
        out with a few different blocks (including the one I just gave you).
        <em><strong>Hint:</strong>  You can use
        </em>#{code 'Time.now.hour'}<em> to get the current hour.
        However, this returns a number between </em>#{code '0'}<em> and </em>#{code '23'}<em>,
        so you will have to alter those numbers in order to get ordinary clock-face
        numbers (</em>#{code '1'}<em> to </em>#{code '12'}<em>).</em>
        END_PARAGRAPH
      end
      para do <<-END_PARAGRAPH
        &bull; <em>Program Logger</em>.  Write a method called #{code 'log'}, which
        takes a string description of a block and, of course, a block.  Similar to
        #{code 'doSelfImportantly'}, it should #{code 'puts'} a string telling
        that it has started the block, and another string at the end telling you
        that it has finished the block, and also telling you what the block returned.
        Test your method by sending it a code block.  Inside the block, put <em>another</em>
        call to #{code 'log'}, passing another block to it.  (This is called
        <dfn>nesting</dfn>.)  In other words, your output should look something like this:
        END_PARAGRAPH
      end
      puts '<pre class="L2PoutputBlock">' +
            'Beginning "outer block"...' + $/ +
            'Beginning "some little block"...' + $/ +
            '..."some little block" finished, returning:  5' + $/ +
            'Beginning "yet another block"...' + $/ +
            '..."yet another block" finished, returning:  I like Thai food!' + $/ +
            '..."outer block" finished, returning:  false' + $/ +
            '</pre>'
      para do <<-END_PARAGRAPH
        &bull; <em>Better Logger</em>.  The output from that last logger was kind
        of hard to read, and it would just get worse the more you used it.  It would
        be so much easier to read if it indented the lines in the inner blocks.  To
        do this, you'll need to keep track of how deeply nested you are every time
        the logger wants to write something.  To do this, use a <dfn>global variable</dfn>,
        a variable you can see from anywhere in your code.  To make a global variable,
        just precede your variable name with #{code '$'}, like these:
        #{code '$global'}, #{code '$nestingDepth'}, and #{code '$bigTopPeeWee'}.
        In the end, your logger should output code like this:
        END_PARAGRAPH
      end
      puts '<pre class="L2PoutputBlock">' +
            'Beginning "outer block"...' + $/ +
            '  Beginning "some little block"...' + $/ +
            '    Beginning "teeny-tiny block"...' + $/ +
            '    ..."teeny-tiny block" finished, returning:  lots of love' + $/ +
            '  ..."some little block" finished, returning:  42' + $/ +
            '  Beginning "yet another block"...' + $/ +
            '  ..."yet another block" finished, returning:  I love Indian food!' + $/ +
            '..."outer block" finished, returning:  true' + $/ +
            '</pre>'
      para do <<-END_PARAGRAPH
        Well, that's about all you're going to learn from this tutorial.
        Congratulations!  You've learned a <em>lot</em>!  Maybe you don't feel
        like you remember everything, or you skipped over some parts... really,
        that's just fine.  Programming isn't about what you know; it's about
        what you can figure out.  As long as you know where to find out the
        things you forgot, you're doing just fine.  I hope you don't think
        that I wrote all of this without looking things up every other minute!
        Because I did.  I also got a lot of help with the code which runs all
        of the examples in this tutorial.  But where was <em>I</em> looking
        stuff up, and who was <em>I</em> asking for help?
        #{makeLink 'Let me show you...', :generateBeyond}
        END_PARAGRAPH
      end
    end
end
