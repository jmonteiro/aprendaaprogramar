module Beyond
  #
  #  BEYOND THIS TUTORIAL
  #
  
  def generateBeyond
    para do <<-END_PARAGRAPH
      So where do we go now?  If you have a question, who can you
      ask?  What if you want your program to open a webpage, send
      an email, or resize a digital picture?  Well, there are many,
      many places to find Ruby help.  Unfortunately,
      that's sort of unhelpful, isn't it?  :-)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      For me, there are really only three places I look for Ruby help.
      If it's a small question, and I think I can experiment on my own
      to find the answer, I use <dfn>irb</dfn>.  If it's a bigger question,
      I look it up in my <dfn>pickaxe</dfn>.  And if I just can't figure
      it out on my own, then I ask for help on <dfn>ruby-talk</dfn>.
      END_PARAGRAPH
    end
    h2 {'IRB:  Interactive Ruby'}
    para do <<-END_PARAGRAPH
      If you installed Ruby, then you installed irb.  To use it, just
      go to your command prompt and type #{input 'irb'}.  When you are
      in irb, you can type in any ruby expression you want, and it will tell you
      the value of it.  Type in #{input '1 + 2'}, and it will tell you
      #{output '3'}.  (Note that you don't have to use #{code 'puts'}.)
      It's kind of like a giant Ruby calculator.  When you are done,
      just type in #{input 'exit'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      There's a lot more to irb than this, but you can learn all about
      it in the pickaxe.
      END_PARAGRAPH
    end
    h2 {'The Pickaxe:  "Programming Ruby"'}
    para do <<-END_PARAGRAPH
      Absolutely <em>the</em> Ruby book to get is "Programming Ruby,
      The Pragmatic Programmer's Guide", by David Thomas and Andrew
      Hunt (the Pragmatic Programmers).  While I highly recommend
      picking up the
      <a href="http://www.pragmaticprogrammer.com/titles/ruby/">2nd edition</a>
      of this excellent book, with all of
      the latest Ruby covered, you can also get a slightly older
      (but still mostly relevant) version for free online.
      (Actually, if you installed the
      Windows version of Ruby, you already have it.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      You can find just about everything about Ruby, from the basic
      to the advanced, in this book.  It's easy to read; it's comprehensive;
      it's just about perfect.  I wish every language had a book of
      this quality.  At the back of the book, you'll find a huge section
      detailing every method in every class, explaining it and giving
      examples.  I just love this book!
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      There are a number of places you can get it (including
      the Pragmatic Programmers' own site), but my favorite place
      is at <a href="http://www.ruby-doc.org/docs/ProgrammingRuby/">ruby-doc.org</a>.
      That version has a nice table of contents on the side,
      as well as an index.  (ruby-doc.org has lots of other
      great documentation as well, such as for the Core API and
      Standard Library... basically, it documents everything Ruby
      comes with right out of the box.
      <a href="http://www.ruby-doc.org/">Check it out.</a>)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      And why is it called "the pickaxe"?  Well, there's a picture
      of a pickaxe on the cover of the book.  It's a silly name, I
      guess, but it stuck.
      END_PARAGRAPH
    end
    h2 {'Ruby-Talk:  the Ruby Mailing List'}
    para do <<-END_PARAGRAPH
      Even with irb and the pickaxe, sometimes you still can't figure
      it out.  Or perhaps you want to know if someone already did
      whatever it is you are working on, to see if you could use it
      instead.  In these cases, the place to go is ruby-talk, the Ruby
      Mailing List.  It's full of friendly, smart, helpful people.
      To learn more about it, or to subscribe, look
      <a href="http://www.ruby-lang.org/en/20020104.html">here</a>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      <strong>WARNING:</strong>  There's a <em>lot</em> of mail on the
      mailing list every day.  I have mine automatically sent to a
      different mail folder so that it doesn't get in my way.  If you
      just don't want to deal with all that mail, though, you don't
      have to!  The ruby-talk mailing list is mirrored to the newsgroup
      comp.lang.ruby, and vice versa, so you can see the same messages
      there.  Either way, you see the same messages, just in a slightly
      different format.
      END_PARAGRAPH
    end
    h2 {'Tim Toady'}
    para do <<-END_PARAGRAPH
      Something I have tried to shield you from, but which you will
      surely run in to soon, is the concept of TMTOWTDI (pronounced
      "Tim Toady"):  There's More Than One Way To Do It.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Now some will tell you what a wonderful thing TMTOWTDI is, while
      others feel quite differently.  I don't really have strong feelings
      about it in general, but I think it's a <em>terrible</em> way to
      teach someone how to program.  (As if learning one way to do something
      wasn't challenging and confusing enough!)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      However, now that you are moving beyond this tutorial, you'll
      be seeing much more diverse code.  For example, I can think of
      at least five other ways to make a string (aside from surrounding
      some text in single quotes), and each one works slightly differently.
      I only showed you the simplest of the six.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      And when we talked about branching, I showed you #{code 'if'},
      but I didn't show you #{code 'unless'}.  I'll let you figure
      that one out in irb.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Another nice little shortcut you can use with #{code 'if'},
      #{code 'unless'}, and #{code 'while'}, is the cute one-line version:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      #  These words are from a program I wrote to generate
      #  English-like babble.  Cool, huh?
      puts 'grobably combergearl kitatently thememberate' if 5 == 2**2 + 1**1
      puts 'enlestrationshifter supposine follutify blace' unless 'Chris'.length == 5
      END_CODE
    end
    para do <<-END_PARAGRAPH
      And finally, there is another way of writing methods which take blocks
      (not procs).  We saw the thing where we grabbed the block and turned
      it into a proc using the #{code '&block'} trick in your parameter list
      when you define the function.  Then, to call the block, you just use
      #{code 'block.call'}.  Well, there's a shorter way (though I personally
      find it more confusing).  Instead of this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def doItTwice(&block)
        block.call
        block.call
      end
      
      doItTwice do
        puts 'murditivent flavitemphan siresent litics'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      ...you do this:
      END_PARAGRAPH
    end
    prog do <<-END_CODE
      def doItTwice
        yield
        yield
      end
      
      doItTwice do
        puts 'buritiate mustripe lablic acticise'
      end
      END_CODE
    end
    para do <<-END_PARAGRAPH
      I don't know... what do you think?  Maybe it's just me, but...
      #{code 'yield'}?!  If it was something like #{code 'call_the_hidden_block'}
      or something, that would make a <em>lot</em> more sense to me.
      A lot of people say #{code 'yield'} makes sense to them.  But
      I guess that's what TMTOWTDI is all about:  they do it their way,
      and I'll do it my way.
      END_PARAGRAPH
    end
    h2 {'THE END'}
    para do <<-END_PARAGRAPH
      Use it for good and not evil.  :-)  And if you found this tutorial
      useful (or confusing, or if you found an error),
      <a href="mailto:chris@pine.fm">let me know</a>!
      END_PARAGRAPH
    end

  end
end