module Arrays
  #
  #  ARRAYS AND ITERATORS
  #
  
  def generateArrays
    para do <<-END_PARAGRAPH
      Let's write a program which asks us to type in as many words
      as we want (one word per line, continuing until we just press
      <kbd>Enter</kbd> on an empty line), and which then repeats
      the words back to us in alphabetical order.  OK?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So... first we'll&mdash;uh... um... hmmm...  Well, we could&mdash;er...
      um...
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      You know, I don't think we can do it.  We need a way to store
      an unknown amount of words, and how to keep track of them all
      together, so they don't get mixed up with other variables.  We
      need to put them in some sort of a list.  We need <dfn>arrays</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      An array is just a list in your computer.  Every slot in
      the list acts like a variable:  you can see what object
      a particular slot points to, and you can make it point to a
      different object.  Let's take a look at some arrays:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      []
      [5]
      ['Hello', 'Goodbye']
      
      flavor = 'vanilla'             #  This is not an array, of course...
      [89.9, flavor, [true, false]]  #  ...but this is.
      END_CODE
    end
    para do <<-END_PARAGRAPH
      So first we have an empty array, then an array holding
      a single number, then an array holding two strings.
      Next, we have a simple assignment; then an
      array holding three objects, the last
      of which is the array #{code '[true, false]'}.  Remember,
      variables aren't objects, so our last array is really
      pointing to float, a <em>string</em>, and an array.  Even if we
      were to set #{code 'flavor'} to
      point to something else, that wouldn't change the
      array.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      To help us find a particular object in an array, each
      slot is given an index number.  Programmers (and, incidentally,
      most mathematicians) start counting from zero, though,
      so the first slot in the array is slot zero.  Here's
      how we would reference the objects in an array:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      names = ['Ada', 'Belle', 'Chris']
      
      puts names
      puts names[0]
      puts names[1]
      puts names[2]
      puts names[3]  #  This is out of range.
      END_CODE
    end
    para do <<-END_PARAGRAPH
      So, we see that #{code 'puts names'} prints each name in
      the array #{code 'names'}.  Then we use #{code 'puts names[0]'}
      to print out the "first" name in the array, and
      #{code 'puts names[1]'} to print the "second"... I'm sure this seems
      confusing, but you <em>do</em> get used to it.  You just have to really
      start <em>thinking</em> that counting begins at zero, and
      stop using words like "first" and "second".
      If you go out to a five-course meal, don't talk about
      the "first" course; talk about course zero
      (and in your head, be thinking #{code 'course[0]'}).
      You have five fingers on your right hand, and their
      numbers are 0, 1, 2, 3, and 4.  My wife and I are
      jugglers.  When we juggle six clubs, we are juggling
      clubs 0-5.  Hopefully in the next few months, we'll
      be able to juggle club 6 (and thus be juggling seven
      clubs between us).  You'll know you've got it when you
      start using the word "zeroth".  :-) Yes, it's a real
      word; ask any programmer or mathematician.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Finally, we tried #{code 'puts names[3]'}, just to see what
      would happen.  Were you expecting an error?  Sometimes when
      you ask a question, your question doesn't make sense (at
      least to your computer); that's when you get an error.
      Sometimes, however, you can ask a question and the answer
      is <em>nothing</em>.  What's in slot three?  Nothing.
      What is #{code 'names[3]'}?  #{code 'nil'}:  Ruby's way
      of saying "nothing".  #{code 'nil'} is a special object
      which basically means "not any other object."
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      If all this funny numbering of array slots is getting to
      you, fear not!  Often, we can avoid them completely by
      using various array methods, like this one:
      END_PARAGRAPH
    end
    h2 {"The Method #{code 'each'}"}
    para do <<-END_PARAGRAPH
      #{code 'each'} allows us to do something (whatever we
      want) to #{code 'each'} object the array points to.  So, if we
      want to say something nice about each language in the array
      below, we'd do this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      languages = ['English', 'German', 'Ruby']
      
      languages.each do |lang|
        puts 'I love ' + lang + '!'
        puts 'Don\\'t you?'
      end
      
      puts 'And let\\'s hear it for C++!'
      puts '...'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      So what just happened?  Well, we were able to go through
      every object in the array without using any numbers, so
      that's definitely nice.  Translating into English, the above
      program reads something like:  For #{code 'each'} object
      in #{code 'languages'}, point the variable #{code 'lang'}
      to the object and then #{code 'do'} everything I tell you to,
      until you come to the #{code 'end'}.  (Just so you know,
      C++ is another programming language.  It's much harder to
      learn than Ruby; usually, a C++ program will be many times
      longer than a Ruby program which does the same thing.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      You might be thinking to yourself, "This is a lot like
      the loops we learned about earlier."  Yep, it's similar.
      One important difference is that the method #{code 'each'}
      is just that:  a method.  #{code 'while'} and #{code 'end'}
      (much like #{code 'do'}, #{code 'if'}, #{code 'else'}, and all the other
      <span class="L2Pcode"><span class="L2Pkeyword">#{KEYWORD_COLOR}</span></span>
      words) are not methods.  They are a fundamental part of the Ruby
      language, just like #{code '='} and parentheses; kind of
      like punctuation marks in English.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      But not #{code 'each'}; #{code 'each'} is just another
      array method.  Methods like #{code 'each'} which "act like"
      loops are often called <dfn>iterators</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      One thing to notice about iterators is that they are
      always followed by #{code 'do'}...#{code 'end'}.
      #{code 'while'} and #{code 'if'} never had a #{code 'do'}
      near them; we only use #{code 'do'} with iterators.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Here's another cute little iterator, but it's not an
      array method... it's an integer method!
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      3.times do
        puts 'Hip-Hip-Hooray!'
      end
      END_CODE
    end
    h2 {'More Array Methods'}
    para do <<-END_PARAGRAPH
      So we've learned #{code 'each'},
      but there are many other array methods... almost as
      many as there are string methods!  In fact, some of
      them (like #{code 'length'}, #{code 'reverse'},
      #{code '+'}, and #{code '*'})
      work just like they do for strings, except that they
      operate on the slots of the array rather than the
      letters of the string.  Others, like #{code 'last'}
      and #{code 'join'}, are specific to arrays.  Still
      others, like #{code 'push'} and #{code 'pop'},
      actually change the array.  And just as with
      the string methods, you don't have to remember
      all of these, as long as you can remember where to
      find out about them (right here).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      First, let's look at #{code 'to_s'} and #{code 'join'}.
      #{code 'join'} works much like #{code 'to_s'} does, except
      that it adds a string in between the array's objects.
      Let's take a look:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      foods = ['artichoke', 'brioche', 'caramel']
      
      puts foods
      puts
      puts foods.to_s
      puts
      puts foods.join(', ')
      puts
      puts foods.join('  :)  ') + '  8)'
      
      200.times do
        puts []
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      As you can see, #{code 'puts'} treats arrays differently
      from other objects:  it just calls #{code 'puts'} on each
      of the objects in the array.  That's why #{code 'puts'}ing
      an empty array 200 times doesn't do anything; the array doesn't
      point to anything, so there's nothing to #{code 'puts'}.  (Doing
      nothing 200 times is still doing nothing.)
      Try #{code 'puts'}ing an array containing other arrays;
      does it do what you expected?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Also, did you notice that I left out the empty strings when
      I wanted to #{code 'puts'} a blank line?  It does the same
      thing.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Now let's take a look at #{code 'push'}, #{code 'pop'},
      and #{code 'last'}.  The methods #{code 'push'} and #{code 'pop'}
      are sort of opposites,
      like #{code '+'} and #{code '-'} are.  #{code 'push'} adds
      an object to the end of your array, and #{code 'pop'}
      removes the last object from the array (and tell you
      what it was).  #{code 'last'} is similar to #{code 'pop'}
      in that it tells you what's at the end of the array,
      except that it leaves the array alone.
      Again, #{code 'push'} and #{code 'pop'} <em>actually
      change the array</em>:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      favorites = []
      favorites.push 'raindrops on roses'
      favorites.push 'whiskey on kittens'
      
      puts favorites[0]
      puts favorites.last
      puts favorites.length
      
      puts favorites.pop
      puts favorites
      puts favorites.length
      END_CODE
    end
    h2 {'A Few Things to Try'}
    para do <<-END_PARAGRAPH
      &bull; Write the program we talked about at the very beginning
      of this chapter.<br />
      <em><strong>Hint:</strong>  There's a lovely
      array method which will give you a sorted version of an
      array:  </em>#{code 'sort'}<em>.  Use it!</em>
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Try writing the above program <em>without</em> using
      the #{code 'sort'} method.  A large part of programming is
      solving problems, so get all the practice you can!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Rewrite your Table of Contents program (from the chapter
      on #{makeLink 'methods', :generateMethods}).  Start the program
      with an array holding all of the information for your Table
      of Contents (chapter names, page numbers, etc.).  Then print
      out the information from the array in a beautifully formatted
      Table of Contents.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So far we have learned quite a number of different methods.
      Now it's time to learn how to
      #{makeLink 'make our own', :generateDefMethod}.
      END_PARAGRAPH
    end
  end
end