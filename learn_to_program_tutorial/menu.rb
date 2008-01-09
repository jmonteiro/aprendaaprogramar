module Menu
  #  menu helpers
  
  def menuBookLink
    para(:class=>'funnyMenuText fancyMenuText', :style=>'font-size: 12px; font-family: times, serif;') { 'the' }
    para(:class=>'funnyMenuText fancyMenuText', :style=>'font-size: 12px; font-family: times, serif;') { '<em>improved</em>' }
    para(:class=>'funnyMenuText fancyMenuText', :style=>'font-size: 12px; font-family: times, serif; letter-spacing: 6px; font-variant: small-caps;') { 'expanded' }
    para(:class=>'funnyMenuText fancyMenuText', :style=>'font-size: 12px; font-family: times, serif;') { 'version' }
    puts "<a href=\"#{FRLTP_ADDR}\">"
      img(:width=>'100', :height=>'120', :src=>'/images/LTP_cover.jpg')
    puts '</a>'
  end
  
  def menuTOC
    para(:class=>'funnyMenuText') { '&laquo; the original tutorial &raquo;' }
    
    ol(:start=>'0', :style=>'padding-top: 15px; padding-bottom: 15px;') do
      @chapters.sort_by{|x| x[0]}.each do |aChapNum, aChapter|
        if aChapNum != 'format'
          li { makeLink(aChapter[0],aChapter[1]) }
        end
      end
    end
    
    para do <<-END_PARAGRAPH
      (<a href="http://www1.tf.chiba-u.jp/~shin/tutorial/">Japanese translation</a>
      by&nbsp;Shin&nbsp;Nishiyama.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      (<a href="http://www.ruby-doc.org/docs/ApprendreProgrammer/Apprendre_%E0_Programmer.pdf">French translation</a>
      by&nbsp;Jean&#8209;Pierre&nbsp;ANGHEL.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      (<a href="http://www.shokhirev.com/mikhail/ruby/ltp/title.html">Russian translation</a>
      by&nbsp;Mikhail&nbsp;Shokhirev.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      (<a href="http://gcarst.googlepages.com/komgodtigang">Danish translation</a>
      by&nbsp;Gunner&nbsp;Carstens.)
      END_PARAGRAPH
    end
  end
end