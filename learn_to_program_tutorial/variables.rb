module Variables
  #
  #  VARIABLES
  #
  
  def generateVariables
    para do <<-END_PARAGRAPH
      So far, whenever we have #{code 'puts'}ed a string or a number, the thing
      we #{code 'puts'}ed is gone.  What I mean is, if we wanted to print
      something out twice, we would have to type it in twice:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      puts '...you can say that again...'
      puts '...you can say that again...'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      It would be nice if we could just type it in once and then hang on to it...
      store it somewhere.
      Well, we can, of course&mdash;otherwise, I wouldn't have brought it up!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      To store the string in your computer's memory, we need to
      give the string a name.  Programmers often refer to this process
      as <dfn>assignment</dfn>,
      and they call the names <dfn>variables</dfn>.  This variable can be just
      about any sequence of letters and numbers, but the first character
      needs to be a lowercase letter.  Let's try that last program again,
      but this time I will give the string the name #{code 'myString'} (though I could
      just as well have named it #{code 'str'} or
      #{code 'myOwnLittleString'} or #{code 'henryTheEighth'}).
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      myString = '...you can say that again...'
      puts myString
      puts myString
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Whenever you tried to do something to #{code 'myString'}, the program did it
      to #{code "'...you can say that again...'"} instead.  You can think of the
      variable #{code 'myString'} as "pointing to" the string
      #{code "'...you can say that again...'"}.  Here's a slightly more interesting example:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      name = 'Patricia Rosanna Jessica Mildred Oppenheimer'
      puts 'My name is ' + name + '.'
      puts 'Wow!  ' + name + ' is a really long name!'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Also, just as we can <em>assign</em> an object to a variable,
      we can <em>reassign</em> a different object to that variable.
      (This is why we call them variables:  because what they
      point to can vary.)
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      composer = 'Mozart'
      puts composer + ' was "da bomb", in his day.'
      
      composer = 'Beethoven'
      puts 'But I prefer ' + composer + ', personally.'
      END_CODE
    end
    para do <<-END_PARAGRAPH
      Of course, variables can point to any kind of object, not just strings:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      var = 'just another ' + 'string'
      puts var
      
      var = 5 * (1+2)
      puts var
      END_CODE
    end
    para do <<-END_PARAGRAPH
      In fact, variables can point to just about anything...
      except other variables.
      So what happens if we try?
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      var1 = 8
      var2 = var1
      puts var1
      puts var2
      
      puts ''
      
      var1 = 'eight'
      puts var1
      puts var2
      END_CODE
    end
    para do <<-END_PARAGRAPH
      So first, when we tried to point #{code 'var2'} to #{code 'var1'}, it really
      pointed to #{code '8'} instead (just like #{code 'var1'}
      was pointing to).  Then we had #{code 'var1'} point to
      #{code "'eight'"}, but since #{code 'var2'} was never really
      pointing at #{code 'var1'}, it stays pointing at #{code '8'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      So now that we've got variables, numbers, and strings, let's learn how to
      #{makeLink 'mix them all up', :generateConversion}!
      END_PARAGRAPH
    end
  end
end