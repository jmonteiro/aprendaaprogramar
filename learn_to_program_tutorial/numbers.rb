module Numbers
  #
  #  NUMBERS
  #
  
  def generateNumbers
    para do <<-END_PARAGRAPH
      Now that you've gotten everything #{makeLink('setup', :generateSetup)},
      let's write a program!  Open up your favorite text
      editor and type in the following:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 1+2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Save your program (yes, that's a program!) as #{input 'calc.rb'}
      (the <strong>.rb</strong> is what we usually put at the end of
      programs written in Ruby).  Now run your program by typing #{input 'ruby calc.rb'}
      into your command line.  It should have put a #{output '3'} on your screen.
      See, programming isn't so hard, now is it?
      END_PARAGRAPH
    end
    h2 {'Introduction to '+(code 'puts')}
    para do <<-END_PARAGRAPH
      So what's going on in that program?  I'm sure you can guess what the
      #{code '1+2'} does; our program is basically the same as:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 3
      END_CODE
    end
    para do <<-END_PARAGRAPH
      #{code 'puts'} simply writes onto the screen whatever comes after it.
      END_PARAGRAPH
    end
    h2 {'Integer and Float'}
    para do <<-END_PARAGRAPH
      In most programming languages (and Ruby is no exception)
      numbers without decimal points are called <dfn>integers</dfn>, and
      numbers with decimal points are usually called
      <dfn>floating-point numbers</dfn>,
      or more simply, <dfn>floats</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Here are some integers:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      5
      -205
      9999999999999999999999999
      0
      END_CODE
    end
    para do <<-END_PARAGRAPH
      And here are some floats:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      54.321
      0.001
      -205.3884
      0.0
      END_CODE
    end
    para do <<-END_PARAGRAPH
      In practice, most programs don't use floats; only integers.
      (After all, no one wants to look at 7.4 emails, or browse 1.8
      webpages, or listen to 5.24 of their favorite songs...)
      Floats are used more for academic purposes (physics experiments and such)
      and for 3D graphics.  Even most money programs use integers; they just
      keep track of the number of pennies!
      END_PARAGRAPH
    end
    h2 {'Simple Arithmetic'}
    para do <<-END_PARAGRAPH
      So far, we've got all the makings of a simple calculator.
      (Calculators always use floats, so if you want your computer
      to act just like a calculator, you should also use floats.)  For addition
      and subtraction, we use <kbd>+</kbd> and <kbd>-</kbd>,
      as we saw.  For multiplication, we use <kbd>*</kbd>,
      and for division we use <kbd>/</kbd>.  Most keyboards have
      these keys in the numeric keypad on the far right side.
      If you have a smaller keyboard or a laptop, though, you can just use
      <kbd>Shift 8</kbd> and <kbd>/</kbd> (same key as the
      <kbd>?</kbd> key).  Let's try to expand our calc.rb program a little.
      Type in the following and then run it.
      END_PARAGRAPH
    end
    prog [], 'This is what the program returns:' do <<-END_CODE
      puts 1.0 + 2.0
      puts 2.0 * 3.0
      puts 5.0 - 8.0
      puts 9.0 / 2.0
      END_CODE
    end
    para do <<-END_PARAGRAPH
      (The spaces in the program are not important; they just make
      the code easier to read.)  Well, that wasn't too surprising.
      Now let's try it with integers:
      END_PARAGRAPH
    end
    prog [], 'Mostly the same, right?' do <<-END_CODE
      puts 1+2
      puts 2*3
      puts 5-8
      puts 9/2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Uh... except for that last one!
      But when you do arithmetic with integers, you'll get integer answers.
      When your computer can't get the "right" answer, it always rounds down.
      (Of course, #{output '4'} <em>is</em> the right answer in integer arithmetic
      for #{code '9/2'}; just maybe not the answer you were expecting.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Perhaps you're wondering what integer division is good for.  Well, let's
      say you're going to the movies, but you only have $9.  Here in
      Portland, you can see a movie at the Bagdad for 2 bucks.  How many movies
      can you see there?  #{code '9/2'}... #{output '4'} movies.  4.5
      is definitely <em>not</em> the right answer in this case; they will
      not let you watch half of a movie, or let half of you in to
      see a whole movie... some things just aren't divisible.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So now experiment with some programs of your own!  If you want
      to write more complex expressions, you can use parentheses.
      For example:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 5 * (12-8) + -15
      puts 98 + (59872 / (13*8)) * -52
      END_CODE
    end
    h2 {'A Few Things to Try'}
    para do
      puts 'Write a program which tells you:'
    end
    ul do
      li {'how many hours are in a year?'}
      li {'how many minutes are in a decade?'}
      li {'how many seconds old are you?'}
      li {'how many chocolates do you hope to eat in your life? <br />'+
          '<em><strong>Warning:</strong>  This part of the program could take a while to compute!</em>'}
    end
    para do
      puts "Here's a tougher question:"
    end
    ul do
      li {"If I am #{(Time.now - Time.mktime(1976,8,3)).to_i / 1000000} million seconds old, how old am I?"}
    end
    para do <<-END_PARAGRAPH
      When you're done playing around with numbers, let's have a look
      at some #{makeLink('letters', :generateLetters)}.
      END_PARAGRAPH
    end
  end
end