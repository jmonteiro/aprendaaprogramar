module Conversion
  #
  #  CONVERSION
  #
  
  def generateConversion
    para do <<-END_PARAGRAPH
      We've looked at a few different kinds of objects
      (#{makeLink 'numbers', :generateNumbers} and #{makeLink 'letters', :generateLetters}),
      and we made #{makeLink 'variables', :generateVariables} to point to them;
      the next thing we want to do is to get them all to play nicely together.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      We've seen that if we want a program to print #{output '25'}, the following
      <em>does <strong>not</strong></em> work, because you can't add
      numbers and strings:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      var1 = 2
      var2 = '5'
      
      puts var1 + var2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Part of the problem is that your computer doesn't know if you
      were trying to get #{output '7'} (#{code '2 + 5'}), or if you wanted
      to get #{output '25'} (#{code "'2' + '5'"}).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Before we can add these together, we need some way of getting the
      string version of #{code 'var1'}, or to get the integer version
      of #{code 'var2'}.
      END_PARAGRAPH
    end
    h2 {'Conversions'}
    para do <<-END_PARAGRAPH
      To get the string version of an object, we simply write
      #{code '.to_s'} after it:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      var1 = 2
      var2 = '5'
      
      puts var1.to_s + var2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Similarly, #{code 'to_i'} gives the integer version of an object,
      and #{code 'to_f'} gives the float version.  Let's look at what
      these three methods do (and <em>don't</em> do) a little more closely:
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
      Notice that, even after we got the string version of
      #{code 'var1'} by calling #{code 'to_s'}, #{code 'var1'} was always pointing
      at #{code '2'}, and never at #{code "'2'"}.  Unless we explicitly reassign
      #{code 'var1'} (which requires an #{code '='} sign), it will point
      at #{code '2'} for the life of the program.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Now let's try some more interesting (and a few just weird) conversions:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts '15'.to_f
      puts '99.999'.to_f
      puts '99.999'.to_i
      puts ''
      puts '5 is my favorite number!'.to_i
      puts 'Who asked you about 5 or whatever?'.to_i
      puts 'Your momma did.'.to_f
      puts ''
      puts 'stringy'.to_s
      puts 3.to_i
      END_CODE
    end
    para do <<-END_PARAGRAPH
      So, this probably gave some surprises.  The first one is pretty
      standard, giving #{output '15.0'}.
      After that, we converted the string #{code "'99.999'"} to a float and
      to an integer.  The float did what we expected; the integer was, as always, rounded down.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Next, we had some examples of some... <em>unusual</em> strings being converted
      into numbers.  #{code 'to_i'} ignores the first thing it doesn't understand,
      and the rest of the string from that point on.  So the first one
      was converted to #{code '5'}, but the others, since they started with
      letters, were ignored completely... so the computer just picks zero.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Finally, we saw that our last two conversions did nothing at all,
      just as we would expect.
      END_PARAGRAPH
    end
    h2 {'Another Look at '+(code 'puts')}
    para do <<-END_PARAGRAPH
      There's something strange about our favorite method...  Take a look at this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 20
      puts 20.to_s
      puts '20'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Why do these three all print the same thing?  Well, the last two
      should, since #{code '20.to_s'} <em>is</em> #{code "'20'"}.  But what
      about the first one, the integer #{code '20'}?  For that matter, what
      does it even mean to write out <em>the integer</em> 20?  When
      you write a <em>2</em> and then a <em>0</em> on a piece of paper, you
      are writing down a string, not an integer.  <em>The integer</em> 20 is the number of
      fingers and toes I have; it isn't a <em>2</em> followed by a <em>0</em>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Well, here's the big secret behind our friend, #{code 'puts'}:  Before
      #{code 'puts'} tries to write out an object, it uses #{code 'to_s'} to
      get the string version of that object.  In fact, the <em>s</em> in
      #{code 'puts'} stands for <em>string</em>; #{code 'puts'} really means
      <dfn>put string</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      This may not seem too exciting now, but there are many,
      <em>many</em> kinds of objects in Ruby (you'll even learn how
      to make your own!), and it's nice to know what will happen if
      you try to #{code 'puts'} a really weird object,
      like a picture of your grandmother, or a music file or something.
      But that will come later...
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      In the meantime, we have a few more methods for you, and they
      allow us to write all sorts of fun programs...
      END_PARAGRAPH
    end
    h2 {'The Methods '+(code 'gets')+' and '+(code 'chomp')}
    para do <<-END_PARAGRAPH
      If #{code 'puts'} means <dfn>put string</dfn>, I'm sure you can guess
      what #{code 'gets'} stands for.  And just as #{code 'puts'} always
      spits out strings, #{code 'gets'} will only retrieve strings.  And
      whence does it get them?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      From you!  Well, from your keyboard, anyway.  Since your keyboard only
      makes strings, that works out beautifully.  What actually happens
      is that #{code 'gets'} just sits there, reading what you type until
      you press <kbd>Enter</kbd>.  Let's try it out:
      END_PARAGRAPH
    end
    prog ['Is there an echo in here?'] do <<-END_CODE
      puts gets
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Of course, whatever you type in will just get repeated back
      to you.  Run it a few times and try typing in different things.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Now we can make interactive programs!  In this one, type in
      your name and it will greet you:
      END_PARAGRAPH
    end
    prog ['Chris'], '<em>Eek!</em>  I just ran it&mdash;I typed in my name, and this is what happened:' do <<-END_CODE
      puts 'Hello there, and what\\'s your name?'
      name = gets
      puts 'Your name is ' + name + '?  What a lovely name!'
      puts 'Pleased to meet you, ' + name + '.  :)'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Hmmm... it looks like when I typed in the letters <kbd>C</kbd>,
      <kbd>h</kbd>, <kbd>r</kbd>, <kbd>i</kbd>,
      <kbd>s</kbd>, and then pressed <kbd>Enter</kbd>, #{code 'gets'}
      got all of the letters in my name <em>and</em> the
      <kbd>Enter</kbd>!  Fortunately, there's a method just for
      this sort of thing:  #{code 'chomp'}.  It takes off any <kbd>Enter</kbd>s
      hanging out at the end of your string.  Let's try that program again,
      but with #{code 'chomp'} to help us this time:
      END_PARAGRAPH
    end
    prog ['Chris'] do <<-END_CODE
      puts 'Hello there, and what\\'s your name?'
      name = gets.chomp
      puts 'Your name is ' + name + '?  What a lovely name!'
      puts 'Pleased to meet you, ' + name + '.  :)'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Much better!  Notice that since #{code 'name'} is pointing to
      #{code 'gets.chomp'}, we don't ever have to say
      #{code 'name.chomp'};  #{code 'name'} was already
      #{code 'chomp'}ed.
      END_PARAGRAPH
    end
    h2 {'A Few Things to Try'}
    para do <<-END_PARAGRAPH
      &bull; Write a program which asks for a person's first name, then middle,
      then last.  Finally, it should greet the person using their full name.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Write a program which asks for a person's favorite number.
      Have your program add one to the number, then suggest the result
      as a <em>bigger and better</em> favorite number.
      (Do be tactful about it, though.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Once you have finished those two programs (and any others you would like to try),
      let's learn some more (and some more about) #{makeLink('methods', :generateMethods)}.
      END_PARAGRAPH
    end
  end
end