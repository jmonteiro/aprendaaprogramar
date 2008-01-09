module Methods
  #
  #  METHODS
  #
  
  def generateMethods
    para do <<-END_PARAGRAPH
      So far we've seen a number of different methods,
      #{code 'puts'} and #{code 'gets'}
      and so on (<em><strong>Pop Quiz:</strong>  List all
      of the methods we have seen so far!
      There are ten of them; the answer is below.</em>),
      but we haven't really talked about what methods are.
      We know what they do, but
      we don't know what they are.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      But really, that <em>is</em> what they are:  things
      that do stuff.  If objects (like strings,
      integers, and floats) are the nouns in the Ruby
      language, then methods are like the verbs.
      And, just like in English, you can't have a
      verb without a noun to <em>do</em> the verb.
      For example, ticking isn't something that just
      happens; a clock (or a watch or something)
      has to do it.  In English we would say, "The
      clock ticks."  In Ruby we would say
      #{code 'clock.tick'} (assuming that #{code 'clock'}
      was a Ruby object, of course).
      Programmers might say we were "calling #{code 'clock'}'s
      #{code 'tick'} method,"
      or that we "called #{code 'tick'} on #{code 'clock'}."
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So, did you take the quiz?  Good.  Well, I'm
      sure you remembered the methods
      #{code 'puts'}, #{code 'gets'}, and #{code 'chomp'},
      since we just covered those.
      You probably also got our conversion methods,
      #{code 'to_i'}, #{code 'to_f'},
      and #{code 'to_s'}.  However, did you get
      the other four?  Why, it's none other
      than our old arithmetic buddies #{code '+'},
      #{code '-'}, #{code '*'}, and #{code '/'}!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So as I was saying, just as every verb needs
      a noun, so every method needs an object.
      It's usually easy to tell which object is
      performing the method:  it's what comes right
      before the dot, like in our #{code 'clock.tick'}
      example, or in #{code '101.to_s'}.
      Sometimes, however, it's not quite as
      obvious; like with the arithmetic methods.  As
      it turns out, #{code '5 + 5'} is really
      just a shortcut way of writing #{code '5.+ 5'}.
      For example:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'hello '.+ 'world'
      puts (10.* 9).+ 9
      END_CODE
    end
    para do <<-END_PARAGRAPH
      It isn't very pretty, so we won't ever write
      it like that; however, it's important to
      understand what is <em>really</em> happening.
      (On my machine, that also gives me a <dfn>warning</dfn>:
      #{output 'warning: parenthesize argument(s) for future version'}.
      It still ran the code just fine, but it's telling me that
      it's having trouble figuring out what I mean, and to use
      more parentheses in the future.)
      This also gives us a deeper understanding
      of why we can do #{code "'pig'*5"} but we
      can't do #{code "5*'pig'"}:  #{code "'pig'*5"} is
      telling #{code "'pig'"} to do the multiplying,
      but #{code "5*'pig'"} is telling #{code '5'}
      to do the multiplying.  #{code "'pig'"} knows how
      to make #{code '5'} copies of itself and
      add them all together; however, #{code '5'}
      will have a much more difficult time of making
      #{code "'pig'"} copies of <em>itself</em>
      and adding them together.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      And, of course, we still have #{code 'puts'}
      and #{code 'gets'} to explain.  Where are their
      objects?  In English, you can sometimes leave
      out the noun; for example, if a villain
      yells "Die!", the implicit noun is whoever
      he is yelling at.  In Ruby, if I say
      #{code "puts 'to be or not to be'"}, what
      I am really saying is
      #{code "self.puts 'to be or not to be'"}.
      So what is #{code 'self'}?  It's a special variable
      which points to whatever object you are in.
      We don't even know how to be <em>in</em>
      an object yet, but until we find out, we
      are always going to be in a big object which
      is... the whole program!  And lucky for us,
      the program has a few methods of its own,
      like #{code 'puts'} and #{code 'gets'}.
      Watch this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      iCantBelieveIMadeAVariableNameThisLongJustToPointToA3 = 3
      puts iCantBelieveIMadeAVariableNameThisLongJustToPointToA3
      self.puts iCantBelieveIMadeAVariableNameThisLongJustToPointToA3
      END_CODE
    end
    para do <<-END_PARAGRAPH
      If you didn't entirely follow all of that,
      that's OK.  The important thing to take away from
      all of this is that every method is being
      done by some object, even if it doesn't have
      a dot in front of it.  If you understand
      that, then you're all set.
      END_PARAGRAPH
    end
    h2 {'Fancy String Methods'}
    para do <<-END_PARAGRAPH
      Let's learn a few fun string methods.  You don't
      have to memorize them all; you can
      just look up this page again if you forget
      them.  I just want to show you a <em>small</em>
      part of what strings can do.  In fact, I
      can't remember even half of the string methods myself&mdash;but
      that's fine, because there are great references
      on the internet with all of the string
      methods listed and explained.  (I will show
      you where to find them at the end of this tutorial.)
      Really, I don't even <em>want</em> to know
      all the string methods; it's kind of like knowing every
      word in the dictionary.  I can speak English
      just fine without knowing every word in
      the dictionary... and isn't that really the whole
      point of the dictionary?  So you don't <em>have</em>
      to know what's in it?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So, our first string method is #{code 'reverse'},
      which gives a backwards version of a string:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      var1 = 'stop'
      var2 = 'stressed'
      var3 = 'Can you pronounce this sentence backwards?'
      
      puts var1.reverse
      puts var2.reverse
      puts var3.reverse
      puts var1
      puts var2
      puts var3
      END_CODE
    end
    para do <<-END_PARAGRAPH
      As you can see, #{code 'reverse'} doesn't reverse the
      original string; it just makes
      a new backwards version of it.  That's why #{code 'var1'}
      is still #{code "'stop'"}
      even after we called #{code 'reverse'} on #{code 'var1'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Another string method is #{code 'length'}, which tells
      us the number of characters (including
      spaces) in the string:
      END_PARAGRAPH
    end
    prog ['Christopher David Pine'] do <<-END_CODE
      puts 'What is your full name?'
      name = gets.chomp
      puts 'Did you know there are ' + name.length + ' characters in your name, ' + name + '?'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Uh-oh!  Something went wrong, and it looks like it happened sometime after the line
      #{code 'name = gets.chomp'}...  Do you see the problem?  See if you can figure it out.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      The problem is with #{code 'length'}:  it gives us a number, but we want a string.  Easy enough,
      we'll just throw in a #{code 'to_s'} (and cross our fingers):
      END_PARAGRAPH
    end
    prog ['Christopher David Pine'] do <<-END_CODE
      puts 'What is your full name?'
      name = gets.chomp
      puts 'Did you know there are ' + name.length.to_s + ' characters in your name, ' + name + '?'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      No, I did not know that.  <strong>Note:</strong>  that's the number of
      <em>characters</em> in my name, not the number of <em>letters</em>
      (count 'em).  I guess we could write a program which
      asks for your first, middle, and last names individually, and then
      adds those lengths together... hey, why don't you do that!  Go ahead,
      I'll wait.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Did you do it?  Good!  It's nice to program, isn't it?
      After a few more chapters, though, you'll be amazed at
      what you can do.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So, there are also a number of string methods which change the case
      (uppercase and lowercase) of your string.  #{code 'upcase'} changes
      every lowercase letter to uppercase, and #{code 'downcase'} changes
      every uppercase letter to lowercase.  #{code 'swapcase'} switches
      the case of every letter in the string, and finally, #{code 'capitalize'}
      is just like #{code 'downcase'}, except that it switches the first
      character to uppercase (if it is a letter).
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      letters = 'aAbBcCdDeE'
      puts letters.upcase
      puts letters.downcase
      puts letters.swapcase
      puts letters.capitalize
      puts ' a'.capitalize
      puts letters
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Pretty standard stuff.  As you can see from the line
      #{code "puts ' a'.capitalize"}, the method #{code 'capitalize'}
      only capitalizes the first <em>character</em>, not the first
      <em>letter</em>.  Also, as we have seen before, throughout all of
      these method calls, #{code 'letters'} remains unchanged.  I don't mean
      to belabor the point, but it's important to understand.  There are
      some methods which <em>do</em> change the associated object, but we haven't
      seen any yet, and we won't for some time.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      The last of the fancy string methods we'll look at
      are for visual formatting.
      The first one, #{code 'center'}, adds spaces to the beginning and
      end of the string to make it centered.  However, just like you have
      to tell #{code 'puts'} what you want it to print, and #{code '+'}
      what you want it to add, you have to tell #{code 'center'} how
      wide you want your centered string to be.  So if I wanted to center
      the lines of a poem, I would do it like this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      lineWidth = 50
      puts(                'Old Mother Hubbard'.center(lineWidth))
      puts(               'Sat in her cupboard'.center(lineWidth))
      puts(         'Eating her curds an whey,'.center(lineWidth))
      puts(          'When along came a spider'.center(lineWidth))
      puts(         'Which sat down beside her'.center(lineWidth))
      puts('And scared her poor shoe dog away.'.center(lineWidth))
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Hmmm... I don't think that's how that nursery rhyme goes, but I'm
      too lazy to look it up.  (Also, I wanted to line up the
      #{code '.center lineWidth'} part, so I put in those extra spaces
      before the strings.  This is just because I think it is prettier
      that way.  Programmers often have strong feelings about what is pretty
      in a program, and they often disagree about it.  The more you
      program, the more you will come into your own style.)  Speaking of
      being lazy, laziness isn't always
      a bad thing in programming.  For example, see how I stored the
      width of the poem in the variable #{code 'lineWidth'}?  This was so that
      if I want to go back later and make the poem wider, I only have to
      change the very top line of the program, instead of every line which
      does centering.  With a very long poem, this could save me a lot of
      time.  That kind of laziness is really a virtue in programming.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So, about that centering... you may have noticed that it isn't quite
      as beautiful as what a word processor would have done.  If you really
      want perfect centering (and maybe a nicer font), then you should just use
      a word processor!  Ruby is a wonderful tool, but no tool is the right
      tool for <em>every</em> job.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      The other two string formatting methods are #{code 'ljust'} and
      #{code 'rjust'}, which stand for <dfn>left justify</dfn> and
      <dfn>right justify</dfn>.  They are similar to #{code 'center'}, except
      that they pad the string with spaces on the right and left sides,
      respectively.  Let's take a look at all three in action:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      lineWidth = 40
      str = '--> text <--'
      puts str.ljust  lineWidth
      puts str.center lineWidth
      puts str.rjust  lineWidth
      puts str.ljust (lineWidth/2) + str.rjust (lineWidth/2)
      END_CODE
    end
    h2 {'A Few Things to Try'}
    para do <<-END_PARAGRAPH
      &bull; Write an Angry Boss program.  It should rudely ask what you want.
      Whatever you answer, the Angry Boss should yell it back to you, and
      then fire you.  For example, if you type in #{input 'I want a raise.'}, it should yell back
      #{output 'WHADDAYA MEAN "I WANT A RAISE."?!?  YOU\'RE FIRED!!'}
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; So here's something for you to do in order to play around more with
      #{code 'center'}, #{code 'ljust'}, and #{code 'rjust'}:  Write a program
      which will display a Table of Contents so that it looks like this:
      END_PARAGRAPH
    end
    puts '<pre class="L2PoutputBlock">' +
          '                Table of Contents                ' + $/ +
          '                                                 ' + $/ +
          'Chapter 1:  Numbers                        page 1' + $/ +
          'Chapter 2:  Letters                       page 72' + $/ +
          'Chapter 3:  Variables                    page 118' + $/ +
          '</pre>'
    h2 {'Higher Math'}
    para do <<-END_PARAGRAPH
      <em>(This section is totally optional.  It assumes a fair degree
      of mathematical knowledge.  If you aren't interested, you
      can go straight to #{makeLink 'Flow Control', :generateFlowControl}
      without any problems.  However, a quick look at the section
      on <strong>Random Numbers</strong> might come in handy.)</em>
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      There aren't nearly as many number methods as there are string methods
      (though I still don't know them all off the top of my head).  Here, we'll
      look at the rest of the arithmetic methods, a random number generator,
      and the #{code 'Math'} object, with its trigonometric and transcendental
      methods.
      END_PARAGRAPH
    end
    h2 {'More Arithmetic'}
    para do <<-END_PARAGRAPH
      The other two arithmetic methods are #{code '**'} (exponentiation)
      and #{code '%'} (modulus).  So if you want to say "five squared"
      in Ruby, you would write it as #{code '5**2'}.  You can also use
      floats for your exponent, so if you want the square root of 5, you
      could write #{code '5**0.5'}.  The modulus method gives you the remainder
      after division by a number.  So, for example, if I divide 7 by 3,
      I get 2 with a remainder of 1.  Let's see it working in a program:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 5**2
      puts 5**0.5
      puts 7/3
      puts 7%3
      puts 365%7
      END_CODE
    end
    para do <<-END_PARAGRAPH
      From that last line, we learn that a (non-leap) year has some number
      of weeks, plus one day.  So if your birthday was on a Tuesday this year,
      it will be on a Wednesday next year.  You can also use floats with the modulus
      method.  Basically, it works the only sensible way it could... but I'll
      let you play around with that.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      There's one last method to mention before we check out the random number
      generator:  #{code 'abs'}.  It just takes the absolute value of the number:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts((5-2).abs)
      puts((2-5).abs)
      END_CODE
    end
    h2 {'Random Numbers'}
    para do <<-END_PARAGRAPH
      Ruby comes with a pretty nice random number generator.  The method to get
      a randomly chosen number is #{code 'rand'}.  If you call #{code 'rand'} just like
      that, you'll get a float greater than or equal to #{code '0.0'} and less
      than #{code '1.0'}.  If you give #{code 'rand'} an integer (#{code '5'}
      for example), it will give you an integer greater than or equal to
      #{code '0'} and less than #{code '5'} (so five possible numbers,
      from #{code '0'} to #{code '4'}).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Let's see #{code 'rand'} in action.  (If you reload this page, these numbers will
      change each time.  You did know I was actually running these programs, didn't you?)
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts rand
      puts rand
      puts rand
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(1))
      puts(rand(1))
      puts(rand(1))
      puts(rand(99999999999999999999999999999999999999999999999999999999999))
      puts('The weatherman said there is a '+rand(101).to_s+'% chance of rain,')
      puts('but you can never trust a weatherman.')
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Note that I used #{code 'rand(101)'} to get back numbers from #{code '0'}
      to #{code '100'}, and that #{code 'rand(1)'} always
      gives back #{code '0'}.  Not understanding the range of possible return
      values is the biggest mistake I see people make with #{code 'rand'}; even professional
      programmers; even in finished products you can buy at the store.  I even
      had a CD player once which, if set on "Random Play," would play every song but
      the last one...  (I wonder what would have happened if I had put in a CD with
      only one song on it?)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Sometimes you might want #{code 'rand'} to return the <em>same</em> random numbers
      in the same sequence on two different runs of your program.  (For example, once I
      was using randomly generated numbers to create a randomly generated world for a computer
      game.  If I found a world that I really liked, perhaps I would want to play on it
      again, or send it to a friend.)  In order to do this, you need to set the
      <em>seed</em>, which you can do with #{code 'srand'}.  Like this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      srand 1776
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts ''
      srand 1776
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      puts(rand(100))
      END_CODE
    end
    para do <<-END_PARAGRAPH
      It will do the same thing every time you seed it with the same number.  If you want
      to get different numbers again (like what happens if you never use
      #{code 'srand'}), then just call #{code 'srand 0'}.  This seeds it with a
      really weird number, using (among other things) the current time on
      your computer, down to the millisecond.
      END_PARAGRAPH
    end
    h2 {"The #{code 'Math'} Object"}
    para do <<-END_PARAGRAPH
      Finally, let's look at the #{code 'Math'} object.  We might as well
      jump right in:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts(Math::PI)
      puts(Math::E)
      puts(Math.cos(Math::PI/3))
      puts(Math.tan(Math::PI/4))
      puts(Math.log(Math::E**2))
      puts((1 + Math.sqrt(5))/2)
      END_CODE
    end
    para do <<-END_PARAGRAPH
      The first thing you noticed was probably the #{code '::'}
      notation.  Explaining the <dfn>scope operator</dfn> (which is what that is)
      is really beyond the, uh... scope of this tutorial.  No pun
      intended.  I swear.  Suffice it to say, you can use
      #{code 'Math::PI'} just like you would expect to.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      As you can see, #{code 'Math'} has all of the things you would
      expect a decent scientific calculator to have.  And as always,
      the floats are <em>really close</em> to being the right answers.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So now let's #{makeLink 'flow', :generateFlowControl}!
      END_PARAGRAPH
    end
  end
end