module LearnToProgram
  @@HLINE = '<div class="fleur"><div class="fleur_stem">&nbsp;</div></div>'
  
  #  If you decide to change coloring or formatting of this tutorial,
  #  you'll want to change these to something appropriate.
  @@NUMBER_COLOR  = 'verde'
  @@STRING_COLOR  = 'vermelho'
  @@KEYWORD_COLOR = 'azul'
  @@INPUT_DESC    = 'caixa branca'
  @@OUTPUT_DESC   = 'caixa azul'
  
  #  Delimiter for input to sample code, since it comes out
  #  right alongside the output.  Must not be html escapable.
  @@INPUT = "%%%'f'o'o'"
  
  
  def initialize (cgi)
    @cgi = cgi
    @depth = 0
    @page  = []
    
    #  'format' is a hidden page for testing formatting.
    @chapters = {'format'=>['Formatting Page',          		:generateFormattingPage]}
    @chapters['00'     ] = ['Iniciando',                		:generateSetup]
    @chapters['01'     ] = ['Números',                  		:generateNumbers]
    @chapters['02'     ] = ['Letras',                   		:generateLetters]
    @chapters['03'     ] = ['Variáveis e Associação',   		:generateVariables]
    @chapters['04'     ] = ['Misturando',               		:generateConversion]
    @chapters['05'     ] = ['Mais Sobre Métodos',   		  	:generateMethods]
    @chapters['06'     ] = ['Controle de Fluxo',      		 	:generateFlowControl]
    @chapters['07'     ] = ['Arrays e Iteradores',       		:generateArrays]
    @chapters['08'     ] = ['Escrevendo seus Próprios Métodos', :generateDefMethod]
    @chapters['09'     ] = ['Classes',                 			:generateClasses]
    @chapters['10'     ] = ['Blocos and Processos',        		:generateBlocksProcs]
    @chapters['11'     ] = ['Além deste Tutorial',	     		:generateBeyond]
  end
  
  def getChapter (method)
    @chapters.each do |num, chapter|
      return num if (method == chapter[1])
    end
    'Main'
  end
  
  def selfLink (chap = nil)
    #  REQUEST_URI includes "?Chapter=Foo"
    LINKADDR+'?Chapter='+(chap ? getChapter(chap) : '')
  end
  
  def makeLink (name, methodName)
    '<a href="'+selfLink(methodName)+'">'+name+'</a>'
  end
  
  def out
    @cgi.out { @page.join("\n")+"\n" }
  end
  
  def puts (string, escapeThis=false)
    if escapeThis
      string = CGI::escapeHTML string
    end
    @page << '  '*@depth+string
  end
  
  def escapeOutputNotInput (output)
    md = /#{@@INPUT}.*?#{@@INPUT.reverse}/.match output
    if md
      CGI::escapeHTML(md.pre_match) +
      CGI::escapeHTML(md[0]).sub(/#{@@INPUT}/,'<span class="L2Pinput">').sub(/#{@@INPUT.reverse}/,'</span>') +
      escapeOutputNotInput(md.post_match)
    else
      CGI::escapeHTML output
    end
  end
  
  def syntaxColor (str)  #  str has probably already been html-escaped.
    lines = str.split /\n/
    #  L2Pcomment
    #  L2Pstring
    #  L2Pnumber
    #  L2Pkeyword
    #  L2Pdefinition
    
    lines.collect! do |line|
      #line += ' '  #  for splitting... Do we need this?
      md = /'|#/.match line
      if md  #  Comment or string.
        syntaxColor(md.pre_match) + 
        if (md[0] == '#')
          '<span class="L2Pcomment">' + md[0] + md.post_match + '</span>'
        else  #  Big string time...
          md2 = /(.*?)(^|[^\\])((\\\\)*)'/.match md.post_match
          if (md2)
            md[0] + '<span class="L2Pstring">' + $1 + $2 + $3 +
                    '</span>' + "'" + syntaxColor(md2.post_match)
          else
            md[0]
          end
        end
      else  #  No comment nor string.
        keywords = %w[__FILE__ and end in or self unless __LINE__
                      begin ensure redo super until BEGIN break do
                      false next rescue then when END case else for
                      nil retry true while alias elsif if not
                      return undef yield]
        
        keywords.each do |keyword|
          line.gsub!(/(\W|^)(#{keyword})(\W|$)/) do
            $1+'<span class="L2Pkeyword">'+$2+'</span>'+$3
          end
        end
        
        ['def', 'class', 'module'].each do |keyword|
          line.gsub!(/(\W|^)(#{keyword}) +([\w?]+)/) do
            $1+'<span class="L2Pkeyword">'   +$2+'</span>'+
              ' <span class="L2Pdefinition">'+$3+'</span>'
          end
        end
        
        line.gsub!(/(^|[-{\[( ^+%*\/?;])(\d+(\.\d+)?|\.\d+)/) do
          $1+'<span class="L2Pnumber">'+$2+'</span>'
        end
        
        line
      end
    end
    
    lines.join "\n"
  end
  
  
  def input (str)
    str = CGI::escapeHTML str
    str.gsub!(/ /, '&nbsp;')
    '<span class="L2Pinput">'+str+'</span>'
  end
  
  def code (str)
    str = CGI::escapeHTML str
    str.gsub!(/ /, '&nbsp;')
    str = syntaxColor  str
    '<span class="L2Pcode">'+str+'</span>'
  end
  
  def output (str)
    str = CGI::escapeHTML str
    str.gsub!(/ /, '&nbsp;')
    '<span class="L2Pcode L2PcodeBG" style="padding-right: 3px; padding-left: 3px;">'+str+'</span>'
  end
  
  #  This is the cool part...
  def executeCode (code, input)
    #  Wrap code to catch errors and to stop SystemExit.
    code = <<-END_CODE
      begin
        #{code}
      rescue SystemExit
      rescue Exception => error
        puts error.inspect
      end
    END_CODE
    
    strIO = StringIO.new
    
    if !input.empty?
      input = input.join("\n")+"\n"
      input = StringIO.new(input, "r")
      class << strIO; self; end.module_eval do
        ['gets', 'getc', 'read'].each do |meth|
          define_method(meth) do |*params|
            inStr = input.method(meth).call(*params)
            puts @@INPUT+inStr.chomp+(@@INPUT.reverse)  #  Echo input.
            inStr
          end
        end
      end
    end
    
    #  Pass these methods to strIO:
    kernelMethods = ['puts', 'putc', 'gets']
    
    #  Swap out Kernel methods...
    kernelMethods.each do |meth|
      Kernel.module_eval "alias __temp__tutorial__#{meth}__ #{meth}"
      Kernel.module_eval do
        define_method(meth) do |*params|
          strIO.method(meth).call(*params)
        end
      end
    end
    
    begin
      strIO.instance_eval code
    rescue Exception => error  #  Catch parse errors.
      return error.inspect
    end
    
    #  ...and swap them back in.
    kernelMethods.each do |meth|
      Kernel.module_eval "alias #{meth} __temp__tutorial__#{meth}__"
    end
    
    strIO.string
  end
  
  
  #  Tags (or similar)
  
  def para (attributes = {}, &block)
    method_missing(:p, attributes, &block)
  end
  
  def prog (execute = [], remark = nil, fakeOutput = nil, &block)
    if !execute
      return progN(&block)
    end
    
    run = {:input => execute}
    run[:remark    ] = remark     if remark
    run[:fakeOutput] = fakeOutput if fakeOutput
    progN(run, &block)
  end
  
  def progN (*trialRuns)
    code = yield
    
    #  Trim leading whitespace.
    lines = code.split $/
    numSpaces = lines[0].length - lines[0].sub(/ */, '').length
    lines.each do |line|
      line.sub!(/ {0,#{numSpaces}}/, '')
    end
    code = lines.join($/)
    
    prettyCode = syntaxColor(CGI::escapeHTML(code))
    
    #  Spit it out.
    puts '<pre class="L2PcodeBlock">'+prettyCode+'</pre>'
    
    trialRuns.each do |run|
      if run[:fakeOutput]
        puts '<pre class="L2PoutputBlock">'+CGI::escapeHTML(run[:fakeOutput])+'</pre>'
      end
      if run[:remark]
        puts '<p>'+run[:remark]+'</p>'
      end
      output = escapeOutputNotInput(executeCode(code,run[:input]))
      puts '<pre class="L2PoutputBlock">'+$/+output+'</pre>'
    end
    nil
  end
  
  #  Makes a tag.
  def method_missing (methodSymbol, attributes = {})
    methodName = methodSymbol.to_s
    
    attribString = ''
    attributes.each do |key, val|
      raise methodName if (key.nil? || val.nil?)
      attribString += ' '+key.to_s+'="'+val+'"'
    end
    if (!block_given?)
      puts '<'+methodName+attribString+' />'
    else
      puts '<'+methodName+attribString+'>'
      @depth += 1
      blockReturn = yield
      puts blockReturn if (blockReturn.kind_of?(String))
      @depth -= 1
      puts '</'+methodName+'>'
    end
    nil
  end
  
  def self.included(base)
    base.extend(LearnToProgram::ClassMethods)
  end
  
  module ClassMethods
    def handle_request cgi
      begin
        if cgi.params['ShowTutorialCode'][0]
          tutorialSource = File.read __FILE__
          cgi.out('text/plain') { tutorialSource }
        else
          page = self.new cgi
          page.generate
          page.out
        end
      rescue Exception => e
        error_msg = <<-END_ERROR
          <html><head><title>ERROR</title></head>
          <body><h3>ERROR:  email Chris or Katy with this page's address</h3>
          <pre><strong>#{e.class}:  #{CGI::escapeHTML(e.message)}</strong>
          #{e.backtrace.join("\n")}
          </pre>
          </body></html>
        END_ERROR
        cgi.out { error_msg }
      end
    end
  end
end