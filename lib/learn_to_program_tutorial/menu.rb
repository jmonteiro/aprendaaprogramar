module Menu
  #  menu helpers
  
  def menuBookLink
    para(:class=>'funnyMenuText fancyMenuText', :style=>'font-size: 12px; font-family: times, serif;') { 'a versão' }
    para(:class=>'funnyMenuText fancyMenuText', :style=>'font-size: 12px; font-family: times, serif;') { '<em>melhorada</em>' }
    para(:class=>'funnyMenuText fancyMenuText', :style=>'font-size: 12px; font-family: times, serif; letter-spacing: 6px; font-variant: small-caps;') { 'estendida' }
    puts "<a href=\"#{FRLTP_ADDR}\">"
      img(:width=>'100', :height=>'120', :src=>'images/LTP_cover.jpg')
    puts '</a>'
  end
  
  def menuTOC
    para(:class=>'funnyMenuText') { '&laquo; o tutorial original &raquo;' }
    
    ol(:start=>'0', :style=>'padding-top: 15px; padding-bottom: 15px;') do
      @chapters.sort_by{|x| x[0]}.each do |aChapNum, aChapter|
        if aChapNum != 'format'
          li { makeLink(aChapter[0],aChapter[1]) }
        end
      end
    end
    
    para do <<-END_PARAGRAPH
      (<a href="http://pine.fm/LearnToProgram/">Versão Original</a>
      por&nbsp;Chris&nbsp;Pine.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      (<a href="http://www1.tf.chiba-u.jp/~shin/tutorial/">Tradução em Japonês</a>
      por&nbsp;Shin&nbsp;Nishiyama.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      (<a href="http://www.ruby-doc.org/docs/ApprendreProgrammer/Apprendre_%E0_Programmer.pdf">Tradução em Francês</a>
      por&nbsp;Jean&#8209;Pierre&nbsp;ANGHEL.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      (<a href="http://www.shokhirev.com/mikhail/ruby/ltp/title.html">Tradução em Russo</a>
      por&nbsp;Mikhail&nbsp;Shokhirev.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      (<a href="http://gcarst.googlepages.com/komgodtigang">Tradução em Dinamarquês</a>
      por&nbsp;Gunner&nbsp;Carstens.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      (<a href="http://sites.google.com/site/rubynabosanskom/">Tradução em Bósnio</a>
      por&nbsp;Rusmir&nbsp;Gadžo.)
      END_PARAGRAPH
    end
  end
end