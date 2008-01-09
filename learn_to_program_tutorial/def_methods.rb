module DefMethods
  #
  #  WRITING METHODS
  #
  
  def generateDefMethod
    para do <<-END_PARAGRAPH
      As we've seen, loops and iterators allow us to do the
      same thing (run the same code) over and over again.
      However, sometimes we want to do the same thing a
      number of times, but from different places in the program.
      For example, let's say we were writing a questionnaire
      program for a psychology student.  From the psychology
      students I have known and the questionnaires they have
      given me, it would probably go something like this:
      END_PARAGRAPH
    end
    prog ['yes','yes','no way!','NO','yes','yes'] do <<-END_CODE
      puts 'Hello, and thank you for taking the time to'
      puts 'help me with this experiment.  My experiment'
      puts 'has to do with the way people feel about'
      puts 'Mexican food.  Just think about Mexican food'
      puts 'and try to answer every question honestly,'
      puts 'with either a "yes" or a "no".  My experiment'
      puts 'has nothing to do with bed-wetting.'
      puts
      
      #  We ask these questions, but we ignore their answers.
      
      goodAnswer = false
      while (not goodAnswer)
        puts 'Do you like eating tacos?'
        answer = gets.chomp.downcase
        if (answer == 'yes' or answer == 'no')
          goodAnswer = true
        else
          puts 'Please answer "yes" or "no".'
        end
      end
      
      goodAnswer = false
      while (not goodAnswer)
        puts 'Do you like eating burritos?'
        answer = gets.chomp.downcase
        if (answer == 'yes' or answer == 'no')
          goodAnswer = true
        else
          puts 'Please answer "yes" or "no".'
        end
      end
      
      #  We pay attention to *this* answer, though.
      goodAnswer = false
      while (not goodAnswer)
        puts 'Do you wet the bed?'
        answer = gets.chomp.downcase
        if (answer == 'yes' or answer == 'no')
          goodAnswer = true
          if answer == 'yes'
            wetsBed = true
          else
            wetsBed = false
          end
        else
          puts 'Please answer "yes" or "no".'
        end
      end
      
      goodAnswer = false
      while (not goodAnswer)
        puts 'Do you like eating chimichangas?'
        answer = gets.chomp.downcase
        if (answer == 'yes' or answer == 'no')
          goodAnswer = true
        else
          puts 'Please answer "yes" or "no".'
        end
      end
      
      puts 'Just a few more questions...'
      
      goodAnswer = false
      while (not goodAnswer)
        puts 'Do you like eating sopapillas?'
        answer = gets.chomp.downcase
        if (answer == 'yes' or answer == 'no')
          goodAnswer = true
        else
          puts 'Please answer "yes" or "no".'
        end
      end
      
      #  Ask lots of other questions about Mexican food.
      
      puts
      puts 'DEBRIEFING:'
      puts 'Thank you for taking the time to help with'
      puts 'this experiment.  In fact, this experiment'
      puts 'has nothing to do with Mexican food.  It is'
      puts 'an experiment about bed-wetting.  The Mexican'
      puts 'food was just there to catch you off guard'
      puts 'in the hopes that you would answer more'
      puts 'honestly.  Thanks again.'
      puts
      puts wetsBed
      END_CODE
    end
    para do <<-END_PARAGRAPH
      That was a pretty long program, with lots of repetition.
      (All of the sections of code around the questions about Mexican food
      were identical, and the bed-wetting question was only
      slightly different.)
      Repetition is a bad thing.  Still, we can't make it into
      a big loop or iterator, because sometimes we have things
      we want to do between questions.  In situations like these,
      it's best to write a method.  Here's how:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def sayMoo
        puts 'mooooooo...'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Uh... our program didn't #{code 'sayMoo'}.
      Why not?  Because we didn't tell it to.
      We told it <em>how</em> to #{code 'sayMoo'},
      but we never actually said to <em>do</em> it.
      Let's give it another shot:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def sayMoo
        puts 'mooooooo...'
      end
      
      sayMoo
      sayMoo
      puts 'coin-coin'
      sayMoo
      sayMoo
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Ahhh, much better.  (Just in case you don't speak
      French, that was a French duck in the middle of the
      program.  In France, ducks say <em>"coin-coin"</em>.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So we <span class="L2Pkeyword">#{code 'def'}</span>ined
      the method #{code 'sayMoo'}.  (Method names, like
      variable names, start with a lowercase letter.
      There are a few exceptions, though, like #{code '+'}
      or #{code '=='}.)
      But don't methods always have to be associated with
      objects?  Well, yes they do, and in this case (as with
      #{code 'puts'} and #{code 'gets'}), the method is just
      associated with the object representing
      the whole program.  In the next chapter we'll see how to
      add methods to other objects.  But first...
      END_PARAGRAPH
    end
    h2 {'Method Parameters'}
    para do <<-END_PARAGRAPH
      You may have noticed that some methods (like
      #{code 'gets'}, #{code 'to_s'}, #{code 'reverse'}...)
      you can just call on an object.  However, other methods
      (like #{code '+'}, #{code '-'}, #{code 'puts'}...)
      take <dfn>parameters</dfn> to tell the object how to
      do the method.  For example, you wouldn't just say
      #{code '5+'}, right?  You're telling #{code '5'} to
      add, but you aren't telling it <em>what</em>
      to add.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      To add a parameter to #{code 'sayMoo'} (let's say, the
      number of moos), we would do this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def sayMoo numberOfMoos
        puts 'mooooooo...'*numberOfMoos
      end
      
      sayMoo 3
      puts 'oink-oink'
      sayMoo  #  This should give an error because the parameter is missing.
      END_CODE
    end
    para do <<-END_PARAGRAPH
      #{code 'numberOfMoos'} is a variable which points to
      the parameter passed in.  I'll say that again, but it's
      a little confusing:  #{code 'numberOfMoos'} is a variable
      which points to the parameter passed in.  So if I type in
      #{code 'sayMoo 3'}, then the parameter is #{code '3'},
      and the variable #{code 'numberOfMoos'} points to #{code '3'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      As you can see, the parameter is now <em>required</em>.
      After all, what is #{code 'sayMoo'} supposed to multiply
      #{code "'mooooooo...'"} by if you don't give it a
      parameter?  Your poor computer has no idea.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      If objects in Ruby are like nouns in English, and methods
      are like verbs, then you can think of parameters as
      adverbs (like with #{code 'sayMoo'}, where the parameter
      told us <em>how</em> to #{code 'sayMoo'}) or sometimes as
      direct objects (like with #{code 'puts'}, where the
      parameter is <em>what</em> gets #{code 'puts'}ed).
      END_PARAGRAPH
    end
    h2 {'Local Variables'}
    para do <<-END_PARAGRAPH
      In the following program, there are two variables:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def doubleThis num
        numTimes2 = num*2
        puts num.to_s+' doubled is '+numTimes2.to_s
      end
      
      doubleThis 44
      END_CODE
    end
    para do <<-END_PARAGRAPH
      The variables are #{code 'num'} and #{code 'numTimes2'}.
      They both sit inside the method #{code 'doubleThis'}.
      These (and all of the variables you have seen
      so far) are <dfn>local variables</dfn>.  This means
      that they live inside the method, and they cannot leave.
      If you try, you will get an error:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def doubleThis num
        numTimes2 = num*2
        puts num.to_s+' doubled is '+numTimes2.to_s
      end
      
      doubleThis 44
      puts numTimes2.to_s
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Undefined local variable...  In fact, we <em>did</em>
      define that local variable, but it isn't local to where
      we tried to use it; it's local to the method.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      This might seem inconvenient, but it actually quite nice.
      While it does mean that you have no access to variables
      inside methods, it also means that they have no access
      to <em>your</em> variables, and thus can't screw them up:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def littlePest var
        var = nil
        puts 'HAHA!  I ruined your variable!'
      end
      
      var = 'You can\\'t even touch my variable!'
      littlePest var
      puts var
      END_CODE
    end
    para do <<-END_PARAGRAPH
      There are actually <em>two</em> variables in that little
      program named #{code 'var'}:  one inside #{code 'littlePest'},
      and one outside of it.  When we called #{code 'littlePest var'},
      we really just passed the string from one #{code 'var'} to
      the other, so that both were pointing to the same string.
      Then #{code 'littlePest'} pointed its own <em>local</em>
      #{code 'var'} to #{code 'nil'}, but that did nothing to the
      #{code 'var'} outside the method.
      END_PARAGRAPH
    end
    h2 {'Return Values'}
    para do <<-END_PARAGRAPH
      You may have noticed that some methods give you something
      back when you call them.  For example, #{code 'gets'}
      <dfn>returns</dfn> a string (the string you typed in),
      and the #{code '+'} method in #{code '5+3'}, (which is
      really #{code '5.+(3)'}) returns #{code '8'}.  The
      arithmetic methods for numbers return numbers, and the
      arithmetic methods for strings return strings.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      It's important to understand the difference between methods
      returning a value to where the method was called, and
      your program outputting information to your screen, like
      #{code 'puts'} does.  Notice that #{code '5+3'} returns
      #{code '8'}; it does <strong>not</strong> output
      #{output '8'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So what <em>does</em> #{code 'puts'} return?  We never cared
      before, but let's look at it now:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      returnVal = puts 'This puts returned:'
      puts returnVal
      END_CODE
    end
    para do <<-END_PARAGRAPH
      So the first #{code 'puts'} returned #{code 'nil'}.  Though
      we didn't test it, the second #{code 'puts'} did, too;
      #{code 'puts'} always returns #{code 'nil'}.  Every method
      has to return something, even if it's just #{code 'nil'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Take a quick break and write a program
      to find out what #{code 'sayMoo'} returned.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Were you surprised?  Well, here's how it works:  the value
      returned from a method is simply the last line of the method.  In
      the case of #{code 'sayMoo'}, this means it returns
      #{code "puts 'mooooooo...'*numberOfMoos"}, which is just
      #{code 'nil'} since #{code 'puts'} always returns
      #{code 'nil'}.  If we wanted all of our methods to
      return the string #{code "'yellow submarine'"}, we
      would just need to put <em>that</em> at the end of
      them:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def sayMoo numberOfMoos
        puts 'mooooooo...'*numberOfMoos
        'yellow submarine'
      end
      
      x = sayMoo 2
      puts x
      END_CODE
    end
    para do <<-END_PARAGRAPH
      So, let's try that psychology experiment again,
      but this time we'll write a method to ask the questions for us.
      It will need to take the question as a parameter, and return
      #{code 'true'} if they answered #{input 'yes'} and
      #{code 'false'} if they answered #{input 'no'}.  (Even though
      most of the time we just ignore the answer, it's still a
      good idea for our method to return the answer.  This way we
      can use it for the bed-wetting question, too.)
      I'm also going to shorten the greeting and the debriefing,
      just so this is easier to read:
      END_PARAGRAPH
    end
    prog ['yes','yes','no way!','NO','yes','yes','yes','yes','yes'] do <<-END_CODE
      def ask question
        goodAnswer = false
        while (not goodAnswer)
          puts question
          reply = gets.chomp.downcase
          
          if (reply == 'yes' or reply == 'no')
            goodAnswer = true
            if reply == 'yes'
              answer = true
            else
              answer = false
            end
          else
            puts 'Please answer "yes" or "no".'
          end
        end
        
        answer  #  This is what we return (true or false).
      end
      
      puts 'Hello, and thank you for...'
      puts
      
      ask 'Do you like eating tacos?'      #  We ignore this return value.
      ask 'Do you like eating burritos?'
      wetsBed = ask 'Do you wet the bed?'  #  We save this return value.
      ask 'Do you like eating chimichangas?'
      ask 'Do you like eating sopapillas?'
      ask 'Do you like eating tamales?'
      puts 'Just a few more questions...'
      ask 'Do you like drinking horchata?'
      ask 'Do you like eating flautas?'
      
      puts
      puts 'DEBRIEFING:'
      puts 'Thank you for...'
      puts
      puts wetsBed
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Not bad, huh?  We were able to add more questions (and
      adding questions is <em>easy</em> now), but our program
      is still quite a bit shorter!  It's a big improvement
      &mdash; a lazy programmer's dream.
      END_PARAGRAPH
    end
    h2 {'One More Big Example'}
    para do <<-END_PARAGRAPH
      I think another example method would be helpful here.
      We'll call this one #{code 'englishNumber'}.
      It will take a number, like #{code '22'},
      and return the english version of it (in this case,
      the string #{code "'twenty-two'"}).  For now, let's have it
      only work on integers from #{code '0'} to #{code '100'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      <em>(<strong>NOTE:</strong>  This method uses a new trick
      to return from a method early using the </em>#{code 'return'}<em>
      keyword, and introduces a new twist on branching:
      </em>#{code 'elsif'}<em>.  It should be clear in context
      how these work.)</em>
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def englishNumber number
        #  We only want numbers from 0-100.
        if number < 0
          return 'Please enter a number zero or greater.'
        end
        if number > 100
          return 'Please enter a number 100 or lesser.'
        end
        
        numString = ''  #  This is the string we will return.
        
        #  "left" is how much of the number we still have left to write out.
        #  "write" is the part we are writing out right now.
        #  write and left... get it?  :)
        left  = number
        write = left/100          #  How many hundreds left to write out?
        left  = left - write*100  #  Subtract off those hundreds.
        
        if write > 0
          return 'one hundred'
        end
        
        write = left/10          #  How many tens left to write out?
        left  = left - write*10  #  Subtract off those tens.
        
        if write > 0
          if write == 1  #  Uh-oh...
            #  Since we can't write "tenty-two" instead of "twelve",
            #  we have to make a special exception for these.
            if    left == 0
              numString = numString + 'ten'
            elsif left == 1
              numString = numString + 'eleven'
            elsif left == 2
              numString = numString + 'twelve'
            elsif left == 3
              numString = numString + 'thirteen'
            elsif left == 4
              numString = numString + 'fourteen'
            elsif left == 5
              numString = numString + 'fifteen'
            elsif left == 6
              numString = numString + 'sixteen'
            elsif left == 7
              numString = numString + 'seventeen'
            elsif left == 8
              numString = numString + 'eighteen'
            elsif left == 9
              numString = numString + 'nineteen'
            end
            #  Since we took care of the digit in the ones place already,
            #  we have nothing left to write.
            left = 0
          elsif write == 2
            numString = numString + 'twenty'
          elsif write == 3
            numString = numString + 'thirty'
          elsif write == 4
            numString = numString + 'forty'
          elsif write == 5
            numString = numString + 'fifty'
          elsif write == 6
            numString = numString + 'sixty'
          elsif write == 7
            numString = numString + 'seventy'
          elsif write == 8
            numString = numString + 'eighty'
          elsif write == 9
            numString = numString + 'ninety'
          end
          
          if left > 0
            numString = numString + '-'
          end
        end
        
        write = left  #  How many ones left to write out?
        left  = 0     #  Subtract off those ones.
        
        if write > 0
          if    write == 1
            numString = numString + 'one'
          elsif write == 2
            numString = numString + 'two'
          elsif write == 3
            numString = numString + 'three'
          elsif write == 4
            numString = numString + 'four'
          elsif write == 5
            numString = numString + 'five'
          elsif write == 6
            numString = numString + 'six'
          elsif write == 7
            numString = numString + 'seven'
          elsif write == 8
            numString = numString + 'eight'
          elsif write == 9
            numString = numString + 'nine'
          end
        end
        
        if numString == ''
          #  The only way "numString" could be empty is if
          #  "number" is 0.
          return 'zero'
        end
        
        #  If we got this far, then we had a number somewhere
        #  in between 0 and 100, so we need to return "numString".
        numString
      end
      
      puts englishNumber(  0)
      puts englishNumber(  9)
      puts englishNumber( 10)
      puts englishNumber( 11)
      puts englishNumber( 17)
      puts englishNumber( 32)
      puts englishNumber( 88)
      puts englishNumber( 99)
      puts englishNumber(100)
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Well, there are certainly a few things about this program
      I don't like.  First, it has too much repetition.  Second,
      it doesn't handle numbers greater than 100.  Third, there
      are too many special cases, too many #{code 'return'}s.
      Let's use some arrays and try to clean it up a bit:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def englishNumber number
        if number < 0  #  No negative numbers.
          return 'Please enter a number that isn\\'t negative.'
        end
        if number == 0
          return 'zero'
        end
        
        #  No more special cases!  No more returns!
        
        numString = ''  #  This is the string we will return.
        
        onesPlace = ['one',     'two',       'three',    'four',     'five',
                     'six',     'seven',     'eight',    'nine']
        tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
                     'sixty',   'seventy',   'eighty',   'ninety']
        teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
                     'sixteen', 'seventeen', 'eighteen', 'nineteen']
        
        #  "left" is how much of the number we still have left to write out.
        #  "write" is the part we are writing out right now.
        #  write and left... get it?  :)
        left  = number
        write = left/100          #  How many hundreds left to write out?
        left  = left - write*100  #  Subtract off those hundreds.
        
        if write > 0
          #  Now here's a really sly trick:
          hundreds  = englishNumber write
          numString = numString + hundreds + ' hundred'
          #  That's called "recursion".  So what did I just do?
          #  I told this method to call itself, but with "write" instead of
          #  "number".  Remember that "write" is (at the moment) the number of
          #  hundreds we have to write out.  After we add "hundreds" to "numString",
          #  we add the string ' hundred' after it.  So, for example, if
          #  we originally called englishNumber with 1999 (so "number" = 1999),
          #  then at this point "write" would be 19, and "left" would be 99.
          #  The laziest thing to do at this point is to have englishNumber
          #  write out the 'nineteen' for us, then we write out ' hundred',
          #  and then the rest of englishNumber writes out 'ninety-nine'.
          
          if left > 0
            #  So we don't write 'two hundredfifty-one'...
            numString = numString + ' '
          end
        end
        
        write = left/10          #  How many tens left to write out?
        left  = left - write*10  #  Subtract off those tens.
        
        if write > 0
          if ((write == 1) and (left > 0))
            #  Since we can't write "tenty-two" instead of "twelve",
            #  we have to make a special exception for these.
            numString = numString + teenagers[left-1]
            #  The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.
            
            #  Since we took care of the digit in the ones place already,
            #  we have nothing left to write.
            left = 0
          else
            numString = numString + tensPlace[write-1]
            #  The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
          end
          
          if left > 0
            #  So we don't write 'sixtyfour'...
            numString = numString + '-'
          end
        end
        
        write = left  #  How many ones left to write out?
        left  = 0     #  Subtract off those ones.
        
        if write > 0
          numString = numString + onesPlace[write-1]
          #  The "-1" is because onesPlace[3] is 'four', not 'three'.
        end
        
        #  Now we just return "numString"...
        numString
      end
      
      puts englishNumber(  0)
      puts englishNumber(  9)
      puts englishNumber( 10)
      puts englishNumber( 11)
      puts englishNumber( 17)
      puts englishNumber( 32)
      puts englishNumber( 88)
      puts englishNumber( 99)
      puts englishNumber(100)
      puts englishNumber(101)
      puts englishNumber(234)
      puts englishNumber(3211)
      puts englishNumber(999999)
      puts englishNumber(1000000000000)
      END_CODE
    end
    para do <<-END_PARAGRAPH
      <em>Ahhhh....</em> That's much, much better.  The program is
      fairly dense, which is why I put in so many comments.  It
      even works for large numbers... though not quite as nicely
      as one would hope.  For example, I think #{code "'one trillion'"}
      would be a nicer return value for that last number, or even
      #{code "'one million million'"} (though all three are correct).
      In fact, you can do that right now...
      END_PARAGRAPH
    end
    h2 {'A Few Things to Try'}
    para do <<-END_PARAGRAPH
      &bull; Expand upon #{code 'englishNumber'}.  First, put in
      thousands.  So it should return #{code "'one thousand'"}
      instead of #{code "'ten hundred'"} and #{code "'ten thousand'"}
      instead of #{code "'one hundred hundred'"}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Expand upon #{code 'englishNumber'} some more.
      Now put in millions, so you get #{code "'one million'"}
      instead of #{code "'one thousand thousand'"}.  Then try adding
      billions and trillions.  How high can you go?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; How about #{code 'weddingNumber'}?  It should
      work almost the same as #{code 'englishNumber'}, except
      that it should insert the word "and" all over the place,
      returning things like #{code "'nineteen hundred and seventy and two'"},
      or however wedding invitations are supposed to look.  I'd give you more
      examples, but I don't fully understand it myself.  You might
      need to contact a wedding coordinator to help you.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; <em>"Ninety-nine bottles of beer..."</em>
      Using #{code 'englishNumber'} and your old program, write out the
      lyrics to this song the <em>right</em> way this time.
      Punish your computer:  have it start at 9999.  (Don't pick
      a number too large, though, because writing all of that to
      the screen takes your computer quite a while.  A hundred
      thousand bottles of beer takes some time; and if you pick
      a million, you'll be punishing yourself as well!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Congratulations!  At this point, you are a true
      programmer!  You have learned
      everything you need to build huge programs from scratch.
      If you have ideas for programs you would like to write
      for yourself, give them a shot!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Of course, building everything from scratch can be a
      pretty slow process.  Why spend time writing code that
      someone else already wrote?  
      Would you like your program to send some email?
      Would you like to save and load files on your computer?
      How about generating web pages for a tutorial where
      the code samples are actually being run every time the
      web page is loaded?  ;) Ruby has many different
      #{makeLink 'kinds of objects', :generateClasses}
      we can use to help us write better programs faster.
      END_PARAGRAPH
    end
  end
end