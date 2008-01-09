module FlowControl
  #
  #  FLOW CONTROL
  #
  
  def generateFlowControl
    para do <<-END_PARAGRAPH
      Ahhhh, flow control.  This is where it all comes together.  Even though
      this chapter is shorter and easier than the #{makeLink 'methods', :generateMethods}
      chapter, it will open up a whole world of programming possibilities.
      After this chapter, we'll be able to write truly interactive
      programs; in the past we have made programs which <em>say</em> different
      things depending on your keyboard input, but after this chapter
      they will actually <em>do</em> different things, too.  But
      before we can do that, we need to be
      able to compare the objects in our programs.  We need...
      END_PARAGRAPH
    end
    h2 {'Comparison Methods'}
    para do <<-END_PARAGRAPH
      Let's rush through this part so we can get to the next
      section, <strong>Branching</strong>, where all the cool
      stuff happens.  So, to see if one object is greater than
      or less than another, we use the methods #{code '>'}
      and #{code '<'}, like this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 1 > 2
      puts 1 < 2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      No problem.  Likewise, we can find out if an object is
      greater-than-or-equal-to another (or less-than-or-equal-to)
      with the methods #{code '>='} and #{code '<='}
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 5 >= 5
      puts 5 <= 4
      END_CODE
    end
    para do <<-END_PARAGRAPH
      And finally, we can see if two objects are equal or not
      using #{code '=='} (which means "are these equal?")
      and #{code '!='} (which means "are these different?").
      It's important not to confuse #{code '='} with #{code '=='}.
      #{code '='} is for telling a variable to point at an object
      (assignment), and #{code '=='} is for asking the question:  "Are
      these two objects equal?"
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 1 == 1
      puts 2 != 1
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Of course, we can compare strings, too.  When strings
      get compared, they compare their <dfn>lexicographical ordering</dfn>,
      which basically means their dictionary ordering.  #{code 'cat'}
      comes before #{code 'dog'} in the dictionary, so:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'cat' < 'dog'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      There's a catch, though:  the way computers usually do things,
      they order capital letters as coming before lowercase letters.
      (That's how they store the letters in fonts, for example:
      all the capital letters first, then the lowercase ones.)
      This means that it will think #{code "'Zoo'"} comes before #{code "'ant'"}, so if you
      want to figure out which word would come first in a real dictionary,
      make sure to use #{code 'downcase'} (or #{code 'upcase'} or
      #{code 'capitalize'}) on both words before you try to compare them.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      One last note before <strong>Branching</strong>:  The comparison
      methods aren't giving us the strings #{code "'true'"} and
      #{code "'false'"}; they are giving us the special objects #{code 'true'} and
      #{code 'false'}.  (Of course, #{code 'true.to_s'} gives us
      #{code "'true'"}, which is why #{code 'puts'} printed #{code "'true'"}.)
      #{code 'true'} and #{code 'false'} are used all the time in...
      END_PARAGRAPH
    end
    h2 {'Branching'}
    para do <<-END_PARAGRAPH
      Branching is a simple concept, but powerful.  In fact, it's so simple
      that I bet I don't even have to explain it at all; I'll just show you:
      END_PARAGRAPH
    end
    run1 = {:input => ['Chris']}
    run2 = {:input => ['Chewbacca'], :remark => 'But if we put in a different name...'}
    progN run1, run2 do <<-END_CODE
      puts 'Hello, what\\'s your name?'
      name = gets.chomp
      puts 'Hello, ' + name + '.'
      if name == 'Chris'
        puts 'What a lovely name!'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      And that is branching.  If what comes after the #{code 'if'} is
      #{code 'true'}, we run the code between the
      #{code 'if'} and the #{code 'end'}.  If what comes after the
      #{code 'if'} is #{code 'false'}, we don't.  Plain and simple.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      I indented the code between the #{code 'if'} and the #{code 'end'}
      just because I think it's easier to keep track of the
      branching that way.  Almost all
      programmers do this, regardless of what language they are
      programming in.  It may not seem much help in this simple
      example, but when things get more complex, it makes a big
      difference.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Often, we would like a program to do one thing if an expression
      is #{code 'true'}, and another if it is #{code 'false'}.  That's
      what #{code 'else'} is for:
      END_PARAGRAPH
    end
    run1 = {:input => ['Chris']}
    run2 = {:input => ['Ringo'], :remark => 'Now let\'s try a different name...'}
    progN run1, run2 do <<-END_CODE
      puts 'I am a fortune-teller.  Tell me your name:'
      name = gets.chomp
      if name == 'Chris'
        puts 'I see great things in your future.'
      else
        puts 'Your future is... Oh my!  Look at the time!'
        puts 'I really have to go, sorry!'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Branching is kind of like coming to a fork in the code:  Do
      we take the path for people whose #{code "name == 'Chris'"},
      or #{code 'else'} do we take the other path?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      And just like the branches of a tree, you can have branches
      which themselves have branches:
      END_PARAGRAPH
    end
    run1 = {:input => ['chris', 'yes']}
    run2 = {:input => ['Chris'], :remark => 'Fine, I\'ll capitalize it...'}
    progN run1, run2 do <<-END_CODE
      puts 'Hello, and welcome to 7th grade English.'
      puts 'My name is Mrs. Gabbard.  And your name is...?'
      name = gets.chomp
      
      if name == name.capitalize
        puts 'Please take a seat, ' + name + '.'
      else
        puts name + '?  You mean ' + name.capitalize + ', right?'
        puts 'Don\\'t you even know how to spell your name??'
        reply = gets.chomp
        
        if reply.downcase == 'yes'
          puts 'Hmmph!  Well, sit down!'
        else
          puts 'GET OUT!!'
        end
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Sometimes it might get confusing trying to figure out
      where all of the #{code 'if'}s, #{code 'else'}s, and
      #{code 'end'}s go.  What I do is write the #{code 'end'}
      <em>at the same time</em> I write the #{code 'if'}.  So
      as I was writing the above program, this is how it looked
      first:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Hello, and welcome to 7th grade English.'
      puts 'My name is Mrs. Gabbard.  And your name is...?'
      name = gets.chomp
      
      if name == name.capitalize
      else
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Then I filled it in with <dfn>comments</dfn>, stuff
      in the code the computer will ignore:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Hello, and welcome to 7th grade English.'
      puts 'My name is Mrs. Gabbard.  And your name is...?'
      name = gets.chomp
      
      if name == name.capitalize
        #  She's civil.
      else
        #  She gets mad.
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Anything after a #{code '#'} is
      considered a comment (unless, of course, you
      are in a string).  After that, I replaced the comments
      with working code.  Some people like to leave the comments
      in; personally, I think well-written code usually speaks
      for itself.  I used to use more comments, but the more
      "fluent" in Ruby I become, the less I use them.  I actually
      find them distracting much of the time.  It's a personal
      choice; you'll find your own (usually evolving) style.
      So my next step looked like this:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Hello, and welcome to 7th grade English.'
      puts 'My name is Mrs. Gabbard.  And your name is...?'
      name = gets.chomp
      
      if name == name.capitalize
        puts 'Please take a seat, ' + name + '.'
      else
        puts name + '?  You mean ' + name.capitalize + ', right?'
        puts 'Don\\'t you even know how to spell your name??'
        reply = gets.chomp
        
        if reply.downcase == 'yes'
        else
        end
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Again, I wrote down the #{code 'if'}, #{code 'else'}, and
      #{code 'end'} all at the same time.  It really helps me keep
      track of "where I am" in the code.  It also makes the job
      seem easier because I can focus on one small part, like
      filling in the code between the #{code 'if'} and the
      #{code 'else'}.  The other benefit of doing it this way
      is that the computer can understand the program at any
      stage.  Every one of the unfinished versions of the
      program I showed you would run.  They weren't finished,
      but they were working programs.  That way I could test it
      as I wrote it, which helped to see how it was coming along
      and where it still needed work.  When it passed all
      of the tests, that's how I knew I was done!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      These tips will help you write programs with branching,
      but they also help with the other main type of flow control:
      END_PARAGRAPH
    end
    h2 {'Looping'}
    para do <<-END_PARAGRAPH
      Often, you'll want your computer to do the same thing over and
      over again&mdash;after all, that's what computers are supposed to
      be so good at.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      When you tell your computer to keep repeating something,
      you also need to tell it when to stop.  Computers never get bored,
      so if you don't tell it to stop, it won't.  We make sure this
      doesn't happen by telling the computer to repeat certain parts
      of a program #{code 'while'} a certain condition is true.  This
      works very similarly to how #{code 'if'} works:
      END_PARAGRAPH
    end
    prog ['Hello?', 'Hi!', 'Very nice to meet you.', 'Oh... how sweet!', 'bye'] do <<-END_CODE
      command = ''
      
      while command != 'bye'
        puts command
        command = gets.chomp
      end
      
      puts 'Come again soon!'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      And that's a loop.  (You may have noticed the blank line at the
      beginning of the output; it's from the first #{code 'puts'}, before
      the first #{code 'gets'}.  How would you change the program to get
      rid of this first line.  Test it!  Did it work <em>exactly</em>
      like the program above, other than that first blank line?)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Loops allow you to do all kinds of interesting things, as I'm sure
      you can imagine.  However, they can also cause problems if you
      make a mistake.  What if your computer gets trapped in an infinite
      loop?  If you think this may have happened, just hold down the
      <kbd>Ctrl</kbd> key and press <kbd>C</kbd>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Before we start playing around with loops, though,
      let's learn a few things to make our job easier.
      END_PARAGRAPH
    end
    h2 {'A Little Bit of Logic'}
    para do <<-END_PARAGRAPH
      Let's take a look at our first branching program again.  What if
      my wife came home, saw the program, tried it out, and it didn't
      tell her what a lovely name <em>she</em> had?  I wouldn't want to
      hurt her feelings (or sleep on the couch), so let's rewrite it:
      END_PARAGRAPH
    end
    prog ['Katy'] do <<-END_CODE
      puts 'Hello, what\\'s your name?'
      name = gets.chomp
      puts 'Hello, ' + name + '.'
      if name == 'Chris'
        puts 'What a lovely name!'
      else
        if name == 'Katy'
          puts 'What a lovely name!'
        end
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Well, it works... but it isn't a very pretty program.  Why not?
      Well, the best
      rule I ever learned in programming was the <dfn>DRY</dfn> rule:
      <dfn>Don't Repeat Yourself</dfn>.  I could probably write a small
      book just on why that is such a good rule.  In our case, we
      repeated the line #{code "puts 'What a lovely name!'"}.  Why is
      this such a big deal?  Well, what if I made a spelling mistake
      when I rewrote it?  What if I wanted to change it from
      #{code "'lovely'"} to #{code "'beautiful'"} on both lines?
      I'm lazy, remember?  Basically, if
      I want the program to do the same thing when it gets
      #{code "'Chris'"} or #{code "'Katy'"}, then it should really
      <em>do the same thing</em>:
      END_PARAGRAPH
    end
    prog ['Katy'] do <<-END_CODE
      puts 'Hello, what\\'s your name?'
      name = gets.chomp
      puts 'Hello, ' + name + '.'
      if (name == 'Chris' or name == 'Katy')
        puts 'What a lovely name!'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Much better.  In order to make it work, I used #{code 'or'}.
      The other <em>logical operators</em> are #{code 'and'} and 
      #{code 'not'}.  It is always a good idea to use parentheses
      when working with these.  Let's see how they work:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      iAmChris  = true
      iAmPurple = false
      iLikeFood = true
      iEatRocks = false
      
      puts (iAmChris  and iLikeFood)
      puts (iLikeFood and iEatRocks)
      puts (iAmPurple and iLikeFood)
      puts (iAmPurple and iEatRocks)
      puts
      puts (iAmChris  or iLikeFood)
      puts (iLikeFood or iEatRocks)
      puts (iAmPurple or iLikeFood)
      puts (iAmPurple or iEatRocks)
      puts
      puts (not iAmPurple)
      puts (not iAmChris )
      END_CODE
    end
    para do <<-END_PARAGRAPH
      The only one of these which might trick you is
      #{code 'or'}.  In English, we often use "or" to mean
      "one or the other, but not both."  For example, your
      mom might say, "For dessert, you can have pie or cake."
      She did <em>not</em> mean you could have them both!
      A computer, on the other hand, uses #{code 'or'} to mean "one or the other,
      or both."  (Another way of saying it is, "at least one of
      these is true.")  This is why computers are more fun than
      moms.
      END_PARAGRAPH
    end
    h2 {'A Few Things to Try'}
    para do <<-END_PARAGRAPH
      &bull; <em>"99 bottles of beer on the wall..."</em>  Write a program
      which prints out the lyrics to that beloved classic, that
      field-trip favorite: "99 Bottles of Beer on the Wall."
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Write a Deaf Grandma program.  Whatever you say
      to grandma (whatever you type in), she should respond with
      #{output 'HUH?!  SPEAK UP, SONNY!'}, unless you shout it (type in
      all capitals).  If you shout, she can hear you (or at least
      she thinks so) and yells back, #{output 'NO, NOT SINCE 1938!'}  To
      make your program <em>really</em> believable, have grandma
      shout a different year each time; maybe any year at random
      between 1930 and 1950.  (This part is optional, and would be
      much easier if you read the section on Ruby's random number
      generator at the end of the #{makeLink 'methods', :generateMethods}
      chapter.)  You can't stop talking to grandma
      until you shout #{input 'BYE'}.<br />
      <em><strong>Hint:</strong>  Don't forget about
      </em>#{code 'chomp'}<em>!  </em>#{code "'BYE'"}<em>with an
      Enter is not the same as </em>#{code "'BYE'"}<em> without
      one!</em><br />
      <em><strong>Hint 2:</strong>  Try to think about what parts
      of your program should happen over and over again.  All
      of those should be in your </em>#{code 'while'}<em> loop.</em>
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Extend your Deaf Grandma program:  What if grandma
      doesn't want you to leave?  When you shout #{input 'BYE'}, she
      could pretend not to hear you.  Change your previous
      program so that you have to shout #{input 'BYE'} three times
      <em>in a row</em>.  Make sure to test your program:
      if you shout #{input 'BYE'} three times, but not in a row, you
      should still be talking to grandma.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      &bull; Leap Years.  Write a program which will ask for
      a starting year and an ending year, and then #{code 'puts'}
      all of the leap years between them (and including them,
      if they are also leap years).  Leap years are years divisible
      by four (like 1984 and 2004).  However, years divisible
      by 100 are <em>not</em> leap years (such as 1800 and
      1900) <strong><em>unless</em></strong> they are divisible
      by 400 (like 1600 and 2000, which were in fact leap years).
      <em>(Yes, it's all pretty
      confusing, but not as confusing has having July in the
      middle of the winter, which is what would eventually
      happen.)</em>
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      When you finish those, take a break!  You've learned a lot
      already.  Congratulations!  Are you surprised at the number
      of things you can tell a computer to do?  A few more chapters
      and you'll be able to program just about anything.  Seriously!
      Just look at all the things you can do now that you couldn't
      do without looping and branching.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Now let's learn about a new kind of
      object, one which keeps track of lists of other objects:
      #{makeLink 'arrays', :generateArrays}.
      END_PARAGRAPH
    end
  end
end