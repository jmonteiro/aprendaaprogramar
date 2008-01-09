module Main
  #
  #  MAIN PAGE GENERATION
  #
  
  def generate
    srand
    chapNum   = @cgi.params['Chapter'][0]
    chapter   = @chapters[chapNum]
    chapTitle = 'Learn to Program, by Chris Pine'
    if chapter
      chapTitle = chapNum + '.&nbsp;&nbsp;' if chapNum < 'A'
      chapTitle.sub! /^0/, ''
      chapTitle += chapter[0]
    end
    
    puts '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">'
    html(:lang=>'en') do
      head do
        link(:href=>'/stylesheets/pine.css', :rel=>'Stylesheet', :type=>'text/css', :media=>'screen')
        link(:href=>LINKADDR+'tutorial.css', :rel=>'Stylesheet', :type=>'text/css', :media=>'screen')
        title { chapTitle }
        script(:language=>'JavaScript', :src=>'http://www.gvisit.com/record.php?sid=6941c11eba5c874197e2096f9c854106', :type=>'text/javascript') {}
      end # head
      body do
      div(:id=>'pageWidth') do
        div(:id=>'headerBar') do
          div(:id=>'titlePicContainer') do
            puts '<a href="'+LINKADDR+'">'
            img(:id=>'titlePic', :width=>'418', :height=>'108', :src=>'/images/titleLTP.gif', :alt=>'Learn to Program')
            puts '</a>'
          end
          puts '<a href="'+LINKADDR+'">'
          puts '  <img id="locket" width="82" height="82" alt="just a cute picture"'
          puts '    src="/images/locketLTP.png" />'
          puts '</a>'
        end
        div(:id=>'menuPane') do
          img(:id=>'menuSpearTop', :width=>'35', :height=>'38', :src=>'/images/spearup_sm.gif')
          
          menuBookLink
          
          img(:width=>'64', :height=>'21', :style=>'padding: 30px;', :src=>'/images/swirly.gif')
          
          menuTOC
          
          img(:id=>'menuSpearBottom', :width=>'36', :height=>'40', :src=>'/images/speardown_sm.gif')
        end
        div(:id=>'contentPane') do
          if chapter
            h1 {chapTitle}
            puts @@HLINE
            method(chapter[1]).call
          else # TOC
            h2 { 'A Place to Start for the Future&nbsp;Programmer' }
            para do <<-END_PARAGRAPH
              I guess this all began back in 2002.  I was thinking
              about teaching programming, and what a great language
              Ruby would be for learning how to program.  I mean, we were
              all excited about Ruby because it was powerful, elegant, and
              really just fun, but it seemed to me that it would also
              be a great way to get into programming in the first place.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Unfortunately, there wasn't much Ruby documentation
              geared for newbies at the time.  Some of us
              in the community were talking about what such a
              "Ruby for the Nuby" tutorial would
              need, and more generally, how to teach programming at all.
              The more I thought about this, the more I had to say (which
              surprised me a bit).  Finally, someone said, "Chris,
              why don't you just write a tutorial instead of talking about
              it?"  So I did.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              And it wasn't very good.  I had all these ideas that were good
              <em>in theory</em>, but the actual task of making a great
              tutorial for non-programmers was vastly more challenging than
              I had realized.  (I mean, it seemed good to me, but I already
              knew how to program.)
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              What saved me was that I made it really easy for people to
              contact me, and I always tried to help people when they got
              stuck.  When I saw a lot of people getting stuck in one place,
              I'd rewrite it.  It was a lot of work, but it slowly got better
              and better.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              A couple of years later, it was getting pretty good.  :-)  So
              good, in fact, that I was ready to pronounce it finished, and
              move on to something else.  And right about then came an
              opportunity to turn the tutorial into a book.  Since it was
              already basically done, I figured this would be no problem.
              I'd just clean up a few spots, add some more exercises, maybe
              some more examples, a few more chapters, run it by 50 more
              reviewers...
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              It took me another year, but now I think it's really
              <em>really</em> good, mostly because of the hundreds of
              brave souls who have helped me write it.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              What's here on this site is the original tutorial, more or less
              unchanged since 2004.  For the latest and greatest, you'll
              want to check out <a href="#{FRLTP_ADDR}">the book</a>.
              END_PARAGRAPH
            end
            puts @@HLINE
            h2 { 'Thoughts For Teachers' }
            para do <<-END_PARAGRAPH
              There were a few guiding principles that I tried to stick to.
              I think they make the learning process much smoother;
              learning to program is hard enough as it is.  If you're
              teaching or guiding someone on the road to hackerdom, these
              ideas might help you, too.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              First, I tried to separate concepts as much as possible,
              so that the student would only have to learn
              one concept at a time.  This was difficult at first, but a little
              <em>too</em> easy after I had some practice.  Some things must be
              taught before others, but I was amazed at how little of
              a precedence hierarchy there really is.  Eventually, I just had to
              pick an order, and I tried to arrange things so that each
              new section was motivated by the previous ones.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Another principle I've kept in mind is to teach only one way
              to do something.  It's an obvious benefit in a tutorial for
              people who have never programmed before.  For one thing,
              one way to do something is easier to learn than two.  Perhaps
              the more important benefit, though, is that the fewer things
              you teach a new programmer, the more creative and clever
              they have to be in their programming.  Since so much of programming
              is problem solving, it's crucial to encourage that as much
              as possible at every stage.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              I have tried to piggy-back programming concepts onto concepts
              the new programmer already has; to present ideas in such a way
              that their intuition will carry the load, rather than the
              tutorial.  Object-Oriented programming lends itself to this
              quite well.  I was able to begin referring to "objects" and
              different "kinds of objects" pretty early in the tutorial,
              slipping those phrases in at the most innocent of moments.
              I wasn't saying anything like "everything in Ruby is an
              object," or "numbers and strings are kinds of objects,"
              because these statements really don't mean anything to
              a new programmer.  Instead, I would talk about strings
              (not "string objects"), and sometimes I would refer to
              "objects", simply meaning "the things in these programs."
              The fact that all these <em>things</em> in Ruby <em>are</em> objects
              made this sort of sneakiness on my part work so well.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Although I wanted to avoid needless OO jargon, I wanted
              to make sure that, if they did need to learn a word, they
              learned the right one.  (I don't want them to have to learn
              it twice, right?)  So I called them "strings," not "text."  Methods
              needed to be called something, so I called them "methods."
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              As far as the exercises are concerned, I think I came up
              with some good ones, but you can never have too many.
              Honestly, I bet I spent half of my time just trying to
              come up with fun, interesting exercises.
              Boring exercises absolutely kill any desire
              to program, while the perfect exercise creates an itch
              the new programmer can't help but scratch.  In short,
              you just can't spend too much time coming up with good
              exercises.
              END_PARAGRAPH
            end
            puts @@HLINE
            h2 { 'About the Original Tutorial' }
            para do <<-END_PARAGRAPH
              The pages of the tutorial (and even this page) are generated by a
              <a href="#{LINKADDR}?ShowTutorialCode=true">big Ruby program</a>,
              of course.  :-)
              As such, it has some neat features.  For example, all of the
              code samples are actually being run every time you view
              the page, and the output shown is the output they generate.
              I think this is the best, easiest, and
              certainly the coolest way to make sure that all of the
              code I present works <em>exactly</em> as I say it does.
              You don't have to worry that I might have copied the output
              of one of the examples
              wrong, or forgotten to test some of the code; it's all tested
              every time you see it.  So in the section on random number
              generators, if you reload the page you will see the numbers
              change each time... <em>nice</em>.
              (I used a similar trick for the example code when writing
              the book, but it's obviously more apparent with the tutorial.)
              END_PARAGRAPH
            end
            para do
              '<a href="http://ruby-lang.org">'+
                '<img src="/images/PoweredByRuby.png" alt="powered by Ruby" width="234" height="60" />'+
              '</a>'
            end
            puts @@HLINE
            h2 { 'Acknowledgements' }
            para do <<-END_PARAGRAPH
              Finally, I'd like to thank everyone on the ruby-talk mailing list
              for their thoughts and encouragement, all of my wonderful
              reviewers for their help in making the book far better than
              I could have alone, my dear wife especially
              for being my main reviewer/tester/guinea pig/muse,
              Matz for creating this fabulous language, and the Pragmatic Programmers
              for telling me about it&mdash;and, of course, for publishing
              my book!
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              If you notice any errors or typos, or have any comments or
              suggestions or good exercises I could include, please
              <a href="mailto:chris@pine.fm">let me know</a>.
              END_PARAGRAPH
            end
          end
          
          puts @@HLINE
          para(:style=>'padding-bottom: 20px;') { "&copy; 2003-#{Time.now.year} Chris Pine" }
        end # contentPane
      end # pageWidth
      end # body
    end # html
  end
end