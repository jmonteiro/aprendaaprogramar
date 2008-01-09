module Letters
  #
  #  LETTERS
  #
  
  def generateLetters
    para do <<-END_PARAGRAPH
      So we've learned all about #{makeLink('numbers', :generateNumbers)},
      but what about letters?  words?  text?
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      We refer to groups of letters in a program as <dfn>strings</dfn>.  (You can
      think of printed letters being strung together on a banner.)
      To make it easier to see just what part of the code is in a string,
      I'll color strings
      <span class="L2Pcode"><span class="L2Pstring">#{@@STRING_COLOR}</span></span>.
      Here are some strings:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      'Hello.'
      'Ruby rocks.'
      '5 is my favorite number... what is yours?'
      'Snoopy says #%^?&*@! when he stubs his toe.'
      '     '
      ''
      END_CODE
    end
    para do <<-END_PARAGRAPH
      As you can see, strings can have punctuation, digits, symbols,
      and spaces in them... more than just letters.  That last string
      doesn't have anything in it at all; we would call that an
      <dfn>empty string</dfn>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      We have been using #{code 'puts'} to print numbers;
      let's try it with some strings:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'Hello, world!'
      puts ''
      puts 'Good-bye.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      That worked out well.  Now try some strings of your own.
      END_PARAGRAPH
    end
    h2 {'String Arithmetic'}
    para do <<-END_PARAGRAPH
      Just as you can do arithmetic on numbers, you can also do
      arithmetic on strings!  Well, sort of... you can add strings, anyway.
      Let's try to add two strings and see what
      #{code 'puts'} does with that.
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'I like' + 'apple pie.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Whoops!  I forgot to put a space between #{code "'I like'"} and #{code "'apple pie.'"}.
      Spaces don't matter usually, but they matter inside strings.
      (It's true what they say:  computers don't do what you <em>want</em>
      them to do, only what you <em>tell</em> them to do.)  Let's try that again:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'I like ' + 'apple pie.'
      puts 'I like' + ' apple pie.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      (As you can see, it didn't matter which string I added the space to.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So you can add strings, but you can also multiply them!
      (By a number, anyway.)  Watch this:
      END_PARAGRAPH
    end
    prog [], '(Just kidding... it really does this:)', 'batting her eyes' do <<-END_CODE
      puts 'blink ' * 4
      END_CODE
    end
    para do <<-END_PARAGRAPH
      If you think about it, this makes perfect sense.  After all,
      #{code '7*3'} really just means #{code '7+7+7'}, so #{code "'moo'*3"} just
      means #{code "'moo'+'moo'+'moo'"}.
      END_PARAGRAPH
    end
    h2 {"#{code '12'} vs #{code "'12'"}"}
    para do <<-END_PARAGRAPH
      Before we get any further, we should make sure we understand the
      difference between <em>numbers</em> and <em>digits</em>.
      #{code '12'} is a number, but #{code "'12'"} is a string of two digits.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Let's play around with this for a while:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts  12  +  12
      puts '12' + '12'
      puts '12  +  12'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      How about this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts  2  *  5
      puts '2' *  5
      puts '2  *  5'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      These examples were pretty straightforward.  However, if you're not too
      careful with how you mix your strings and your numbers, you might run into...
      END_PARAGRAPH
    end
    h2 {'Problems'}
    para do <<-END_PARAGRAPH
      At this point you may have tried out a few things which
      <em>didn't</em> work.  If not, here are a few:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts '12' + 12
      puts '2' * '5'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Hmmm... an error message.  The problem is that you
      can't really add a number to a string, or multiply a
      string by another string.  It doesn't make any more sense than does this:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'Betty' + 12
      puts 'Fred' * 'John'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Something else to be aware of:  you can write #{code "'pig'*5"} in a program,
      since it just means #{code '5'} sets of the string #{code "'pig'"} all added
      together.  However,
      you <em>can't</em> write #{code "5*'pig'"}, since that means #{code "'pig'"}
      sets of the number #{code '5'}, which is just silly.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Finally, what if I want a program to print out
      #{output 'You\'re swell!'}?  We can try this:
      END_PARAGRAPH
    end
    prog false do <<-END_CODE
      puts 'You're swell!'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Well, <em>that</em> won't work; I won't even try to run it.
      The computer thought we were done with the string.
      (This is why it's nice to have a text editor which does
      <dfn>syntax coloring</dfn> for you.)  So how do we let
      the computer know we want to stay in the string?  We have
      to <dfn>escape</dfn> the apostophe, like this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'You\\'re swell!'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      The backslash is the escape character.  In other words, if you have
      a backslash and another character, they are sometimes translated
      into a new character.  The only things the backslash escapes,
      though, are the apostrophe and the backslash itself.  (If you
      think about it, escape characters must always escape themselves.)
      A few examples are in order here, I think:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts 'You\\'re swell!'
      puts 'backslash at the end of a string:  \\\\'
      puts 'up\\\\down'
      puts 'up\\down'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Since the backslash does <em>not</em> escape a #{code "'d'"},
      but <em>does</em> escape itself, those last two strings are
      identical.  They don't look the same in the code, but in your
      computer they really are the same.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      If you have any other questions, just
      #{makeLink('keep reading', :generateVariables)}!  I couldn't
      answer every question on <em>this</em> page, after all.
      END_PARAGRAPH
    end
  end
end