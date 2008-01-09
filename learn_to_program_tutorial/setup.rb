module Setup
  #
  #  SETUP
  #
  
  def generateSetup
    para do <<-END_PARAGRAPH
      When you program a computer, you have to "speak" in a
      language your computer understands:  a programming
      language.  There are lots and lots of different
      languages out there, and many of them are excellent.
      In this tutorial I chose to use my favorite
      programming language, <em>Ruby</em>.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Aside from being my favorite,
      Ruby is also the easiest programming language I have seen
      (and I've seen quite a few).  In fact, that's the real
      reason I'm writing this tutorial:  I didn't decide to write
      a tutorial, and then choose Ruby because it's my favorite;
      instead, I found Ruby to be so easy that I decided there
      really ought to be a good beginner's tutorial which uses
      it.  It's Ruby's simplicity which prompted this tutorial,
      not the fact that it's my favorite.
      (Writing a similar tutorial using
      another language, like C++ or Java, would have required
      hundreds and hundreds of pages.)  But don't think that
      Ruby is a beginner's language just because it is easy!
      It is a powerful, professional-strength programming
      language if ever there was one.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      When you write something in a human language, what is
      written is called text.  When you write something in a computer
      language, what is written is called <dfn>code</dfn>.  I
      have included lots of examples of Ruby code throughout
      this tutorial, most of them complete programs you can
      run on your own computer.  To make the code easier to
      read, I have colored parts of the code different
      colors.  (For example, numbers are always
      <span class="L2Pcode"><span class="L2Pnumber">#{@@NUMBER_COLOR}</span></span>.)
      Anything you are supposed to type in will be in a
      #{input @@INPUT_DESC}, and anything a program prints
      out will be in a #{output @@OUTPUT_DESC}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      If you come across something you don't understand, or you
      have a question which wasn't answered, write it down and
      keep reading!  It's quite possible that the answer will
      come in a later chapter.  However, if your question was
      not answered by the last chapter, I will tell you where
      you can go to ask it.  There are lots of wonderful people
      out there more than willing to help; you just need to know
      where they are.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      But first we need to download and install Ruby onto your
      computer.
      END_PARAGRAPH
    end
    h2 {'Windows Installation'}
    para do <<-END_PARAGRAPH
      The Windows installation of Ruby is a breeze.  First, you
      need to download the
      <a href="http://rubyinstaller.rubyforge.org/">Ruby installer</a>.
      There might be a couple of versions to choose from; this tutorial
      is using version #{RUBY_VERSION}, so make sure what you download is at
      least as recent as that.  (I would just get the latest
      version available.)  Then simply run the installation program.
      It will ask you where you want to install Ruby.  Unless you have
      a good reason for it, I would just install it in the default
      location.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      In order to program, you need to be able to write programs and
      to run programs.  To do this, you will need a text editor and a
      command line.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      The Ruby installer comes with a lovely text editor called SciTE
      (the Scintilla Text Editor).  You can run SciTE by selecting it
      from the start menu.  If you would like your code to be colored
      like the examples in this tutorial, download these files and
      put them in your SciTE folder (<kbd>c:/ruby/scite</kbd> if you chose the
      default location):
      END_PARAGRAPH
    end
    ul do
      li {'<a href="'+LINKADDR+'SciTEGlobal.properties">Global Properties</a>'}
      li {'<a href="'+LINKADDR+'ruby.properties">Ruby Properties</a>'}
    end
    para do <<-END_PARAGRAPH
      It would also be a good idea to create a folder somewhere to keep
      all of your programs.  Make sure that when you save a program,
      you save it into this folder.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      To get to your command line, select Command Prompt from the
      Accessories folder in your start menu.  You will want to
      navigate to the folder where you are keeping your programs.
      Typing #{input 'cd ..'} will take you up one folder, and
      #{input 'cd foldername'} would put you inside the folder
      named <kbd>foldername</kbd>.  To see all of the folders
      in your current folder, type #{input 'dir /ad'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      And that's it!  You're all set to
      #{makeLink 'learn to program', :generateNumbers}.
      END_PARAGRAPH
    end
    h2 {'Macintosh Installation'}
    para do <<-END_PARAGRAPH
      If you have Mac OS X 10.2 (Jaguar), then you already have
      Ruby on your system!  What could be easier?
      Unfortunately, I don't think you can use Ruby on Mac OS X 10.1 and earlier.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      In order to program, you need to be able to write programs and
      to run programs.  To do this, you will need a text editor and a
      command line.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Your command line is accessible through the Terminal
      application (found in Applications/Utilities).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      For a text editor, you can use whatever one you are familiar
      or comfortable with.  If you use TextEdit, however, make sure
      you save your programs as text-only!  Otherwise your programs
      <em>will not work</em>.  Other options for programming are
      emacs, vi, and pico, which are all accessible from the
      command line.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      And that's it!  You're all set to
      #{makeLink 'learn to program', :generateNumbers}.
      END_PARAGRAPH
    end
    h2 {'Linux Installation'}
    para do <<-END_PARAGRAPH
      First, you will want to check and see if you have Ruby installed
      already.  Type #{input 'which ruby'}.  If it says something like
      #{output '/usr/bin/which: no ruby in (...)'}, then you need to
      <a href="http://www.ruby-lang.org/en/20020102.html">download Ruby</a>,
      otherwise see what version of Ruby you are running with
      #{input 'ruby -v'}.  If it is older than the latest stable build
      on the above download page, you might want to upgrade.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      If you are the root user, then you probably don't need any
      instructions for installing Ruby.  If you aren't, you might want
      to ask your system administrator to install it for you.  (That way
      everyone on that system could use Ruby.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Otherwise, you can just install it so that only you can use it.
      Move the file you downloaded to a temporary directory, like
      <kbd>$HOME/tmp</kbd>.  If the name of the file is
      <kbd>ruby-1.6.7.tar.gz</kbd>, you can open it with
      #{input 'tar zxvf ruby-1.6.7.tar.gz'}.  Change directory
      to the directory you just created (in this example,
      #{input 'cd ruby-1.6.7'}).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Configure your installation by typing
      #{input './configure --prefix=$HOME'}).  Next type
      #{input 'make'}, which will build your Ruby interpreter.
      This might take a few minutes.  After that is done, type
      #{input 'make install'} to install it.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Next, you'll want to add <kbd>$HOME/bin</kbd> to your
      command search path by editing your <kbd>$HOME/.bashrc</kbd>
      file.  (You might have to log out and back in again for
      this to take effect.)  After you do that, test your installation:
      #{input 'ruby -v'}.  If that tells you what version of Ruby you
      have, you can now delete the files
      in <kbd>$HOME/tmp</kbd> (or wherever you put them).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      And that's it!  You're all set to
      #{makeLink 'learn to program', :generateNumbers}.
      END_PARAGRAPH
    end
  end
end