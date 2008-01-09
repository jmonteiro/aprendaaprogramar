module FormattingPage
  #
  #  TEST PAGE FOR FORMATTING
  #
  
  def generateFormattingPage
    h1 { 'Heading 1' }
    h2 { 'Heading 2' }
    h3 { 'Heading 3' }
    h4 { 'Heading 4' }
    
    para {'Here\'s some code with fake output:'}
    prog [], '...just kidding, dude...', 'FUNKADELIC!' do <<-'END_CODE'
      #  Here is some 'Ruby' code.
      #  5 is better than 6.
      #  def wilma do end if not in, dude.
      #'
      
      '#This shouldn\'t cause any problems.'
      'Neither # should this\\'
      'do end if elsif else case when then while def class'
      'or and not next in'
      'to 3 or not to 3, that is 3.7'
      '' + 'x'+''+''+'..'
               '' +'o'
      
      8
      0.09
      9.9
      5.times {}
      
      puts 'I love cheese.' # yo 'g'
      puts 5.02 + 8 + 0.002  # s'up, muva
      
      jimmy = ['yoyoyo', 66]
      jimmy.each do |item|
        puts item.inspect
      end
      
      puts case 'pumpkin'
        when String then 'yep'
        when Fixnum then 'nope'
        else 'maybe'
      end
      
      def yummy
        if (4 <= 5)
          'Yummm!'
        elsif (4 == 5)
          'Huh?'
        else
          while (1 == 2)
            puts 'What?'
          end
        end
      end
      
      class JustSomeClass
        def initialize
          @var = 5
        end
      end
      
      puts Math::PI  #  Should work.
      puts PI        #  Shouldn't work.
      END_CODE
    end
    para {'Here\'s some code with input and output:'}
    prog ['"Chris"', '&26', '<red>'] do <<-END_CODE
      puts 'yoyo...wuddup?'
      puts 'NAME:'
      name = gets.chomp
      puts 'AGE:'
      age = gets.chomp
      puts 'FAVORITE COLOR'
      color = gets.chomp
      puts 'Hello, '+name+', the '+age+' year-old '+color+' lover.'
      END_CODE
    end
    
    para do <<-END_PARAGRAPH
      Hello there.  I love #{input 'inputting VARIOUS things'}.  I also get a kick
      out of #{code 'coding various things'}.  There's such a thrill in
      seeing all of the exciting #{output 'output you can get'} from a
      well-written program.
      END_PARAGRAPH
    end
  end
end