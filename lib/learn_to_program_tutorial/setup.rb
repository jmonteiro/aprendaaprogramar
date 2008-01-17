module Setup
  #
  #  SETUP
  #
  
  def generateSetup
    para do <<-END_PARAGRAPH
      Quando você programa um computador, você tem que "falar" em 
      uma língua que o seu computador entenda: uma linguagem de 
      programação. Existem muitas e muitas linguagens por aí, e muitas 
      são excelentes. Neste tutorial eu escolhi usar a minha favorita, 
      <em>Ruby</em>.
      END_PARAGRAPH
    end
    #para do <<-END_PARAGRAPH
    #  When you program a computer, you have to "speak" in a
    #  language your computer understands:  a programming
    #  language.  There are lots and lots of different
    #  languages out there, and many of them are excellent.
    #  In this tutorial I chose to use my favorite
    #  programming language, <em>Ruby</em>.
    #  END_PARAGRAPH
    #end
    para do <<-END_PARAGRAPH
      Além de ser a minha favorita, Ruby também é a linguagem mais
      fácil que eu já vi (e eu já vi uma boa quantidade delas). Aliás,
      esta é a verdadeira razão pela qual estou escrevendo este tutorial:
      Eu não decidi escrever este tutorial e aí escolhi Ruby por ser minha
      favorita; ao invés disso, eu descobri que o Ruby era tão fácil que
      eu decidi que deveria haver um bom tutorial que a usasse voltado
      para iniciantes.
      Foi a simplicidade do Ruby que inspirou este tutorial, não o fato
      dela ser minha favorita.
      (Escrever um tutorial similar usando outra linguagem, C++ ou Java, teria
      tomado centenas e centenas de páginas.) Mas não pense que Ruby é
      uma linguagem para iniciantes só porque é fácil! Ela é uma linguagem
      poderosa, de nível profissional como poucas.
      END_PARAGRAPH
    end 
    #para do <<-END_PARAGRAPH      
    #  Aside from being my favorite,
    #  Ruby is also the easiest programming language I have seen
    #  (and I've seen quite a few).  In fact, that's the real
    #  reason I'm writing this tutorial:  I didn't decide to write
    #  a tutorial, and then choose Ruby because it's my favorite;
    #  instead, I found Ruby to be so easy that I decided there
    #  really ought to be a good beginner's tutorial which uses
    #  it.  It's Ruby's simplicity which prompted this tutorial,
    #  not the fact that it's my favorite.
    #  (Writing a similar tutorial using
    #  another language, like C++ or Java, would have required
    #  hundreds and hundreds of pages.)  But don't think that
    #  Ruby is a beginner's language just because it is easy!
    #  It is a powerful, professional-strength programming
    #  language if ever there was one.
    #  END_PARAGRAPH
    #end
    para do <<-END_PARAGRAPH
      Quando você escreve algo em uma linguagem humana, o que é escrito
      é chamado de texto. Quando você escreve algo em uma linguagem de 
      computador, o que é escrito é chamado de <dfn>código</dfn>. Eu incluí
      vários exemplos de código Ruby por todo este tutorial, a maioria 
      deles programas completos que você pode rodar no seu próprio
      computador. Para deixar o código mais legível, eu colori partes dele
      com cores diferentes. (Por exemplo, números estão sempre em
      <span class="L2Pcode"><span class="L2Pnumber">#{NUMBER_COLOR}</span></span>.)
      Qualquer coisa que você tiver que digitar estará sempre numa
      #{input INPUT_DESC}, e qualquer coisa que o programa imprimir
      estará em uma #{output OUTPUT_DESC}.
      END_PARAGRAPH
    end
    #para do <<-END_PARAGRAPH
    #  When you write something in a human language, what is
    #  written is called text.  When you write something in a computer
    #  language, what is written is called <dfn>code</dfn>.  I
    #  have included lots of examples of Ruby code throughout
    #  this tutorial, most of them complete programs you can
    #  run on your own computer.  To make the code easier to
    #  read, I have colored parts of the code different
    #  colors.  (For example, numbers are always
    #  <span class="L2Pcode"><span class="L2Pnumber">#{NUMBER_COLOR}</span></span>.)
    #  Anything you are supposed to type in will be in a
    #  #{input INPUT_DESC}, and anything a program prints
    #  out will be in a #{output OUTPUT_DESC}.
    #  END_PARAGRAPH
    #end
    para do <<-END_PARAGRAPH
      Se você encontrar algo que não entende, ou se você tiver
      uma pergunta que não foi respondida, tome nota e continue a ler!
      É bem possível que a resposta venha em um capítulo mais adiante.
      Porém, se sua pergunta não for respondida até o último
      capítulo, eu lhe mostrarei onde você pode ir para perguntar.
      Existem muitas pessoas maravilhosas por aí mais que dispostas a
      ajudar; você só precisa saber onde elas estão.
      END_PARAGRAPH
    end
    #para do <<-END_PARAGRAPH
    #  If you come across something you don't understand, or you
    #  have a question which wasn't answered, write it down and
    #  keep reading!  It's quite possible that the answer will
    #  come in a later chapter.  However, if your question was
    #  not answered by the last chapter, I will tell you where
    #  you can go to ask it.  There are lots of wonderful people
    #  out there more than willing to help; you just need to know
    #  where they are.
    #  END_PARAGRAPH
    #end
    para do <<-END_PARAGRAPH
      Mas primeiro nós precisamos baixar e instalar o Ruby no nosso
      computador.
      END_PARAGRAPH
    end
    h2 {'Instalação no Windows'}
    para do <<-END_PARAGRAPH
      A instalação do Ruby no Windows é muito fácil. Primeiro, você
      precisa baixar o 
      <a href="http://rubyinstaller.rubyforge.org/">Instalador Ruby</a>.
      Pode haver mais de versão para escolher; este tutorial
      usa a versão #{RUBY_VERSION}, então assegure-se de que o que você
      baixar seja ao menos tão recente quanto ela. (Eu pegaria a última versão
      disponível.) Então simplesmente rode o programa de instalação.
      Ele perguntará onde você gostaria de instalar o Ruby. A não ser que
      você tenha uma boa razão para não fazer isso, eu instalaria no lugar 
      recomendado.
      END_PARAGRAPH
    end
    #h2 {'Windows Installation'}
    #para do <<-END_PARAGRAPH
    #  The Windows installation of Ruby is a breeze.  First, you
    #  need to download the
    #  <a href="http://rubyinstaller.rubyforge.org/">Ruby installer</a>.
    #  There might be a couple of versions to choose from; this tutorial
    #  is using version #{RUBY_VERSION}, so make sure what you download is at
    #  least as recent as that.  (I would just get the latest
    #  version available.)  Then simply run the installation program.
    #  It will ask you where you want to install Ruby.  Unless you have
    #  a good reason for it, I would just install it in the default
    #  location.
    #  END_PARAGRAPH
    #end
    para do <<-END_PARAGRAPH
      Para programar, você precisa poder escrever programas e rodá-los.
      Para fazer isso, você vai precisar de um editor de texto e uma 
      linha de comando.
      END_PARAGRAPH
    end ## linha de comando?
    
    #para do <<-END_PARAGRAPH   
      #In order to program, you need to be able to write programs and
      #to run programs.  To do this, you will need a text editor and a
      #command line.
      #END_PARAGRAPH
    #end
    para do <<-END_PARAGRAPH
      O instalador do Ruby vem com um editor de texto adorável chamado
      SciTE (the Scintilla Text Editor). Você pode rodar o SciTE 
      selecionando-o no menu Iniciar. Se você quiser que o seu código
      seja colorido como os exemplos deste tutorial, baixe estes arquivos
      e coloque-os na sua pasta SciTE (<kbd>c:/ruby/scite</kbd> se você escolher
      o local recomendado).
      END_PARAGRAPH
    end
    #para do <<-END_PARAGRAPH
    #  The Ruby installer comes with a lovely text editor called SciTE
    #  (the Scintilla Text Editor).  You can run SciTE by selecting it
    #  from the start menu.  If you would like your code to be colored
    #  like the examples in this tutorial, download these files and
    #  put them in your SciTE folder (<kbd>c:/ruby/scite</kbd> if you chose the
    #  default location):
    #  END_PARAGRAPH
    #end
    ul do
      li {'<a href="'+LINKADDR+'SciTEGlobal.properties">Propriedades Globais</a>'}
      li {'<a href="'+LINKADDR+'ruby.properties">Propriedades do Ruby</a>'}
    end
    para do <<-END_PARAGRAPH
      Seria também uma boa idéia criar um diretório em algum lugar para manter
      todos os seus programas.  Tenha certeza que, quando você salvar um
      programa, esteja salvando neste diretório.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Para ir para sua linha de comando, selecione Prompt de Comando na pasta
      Acessórios do seu menu Iniciar.  Você vai querer 
      navegar para o diretório onde você mantém seus programas.
      Digitar #{input 'cd ..'} levará você para o diretório anterior, e
      #{input 'cd nome_do_diretorio'} colocará você dentro do diretório
      chamado <kbd>nome_do_diretorio</kbd>.  Para ver todos seus diretórios
      dentro do diretório atual, digite #{input 'dir /ad'}.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      E é isto!  Você está pronto para
      #{makeLink 'aprender a programar', :generateNumbers}.
      END_PARAGRAPH
    end
    h2 {'Instalação para Macintosh'}
    para do <<-END_PARAGRAPH
      Se você tiver um Mac OS X 10.2 (Jaguar), então você já tem
      Ruby no seu sistema!  O que poderia ser mais fácil?
      Infelizmente, eu não acho que você possa usar Ruby no Mac OS X 10.1
      e versões anteriores.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Para programar, você precisa ser capaz de escrever programas e
      executá-los. Para fazer isto, você precisará de um editor de textos e 
      uma linha de comando.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Sua linha de comando está acessível através da aplicação
      Terminal (encontrada em Aplicações/Utilitários).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Para um editor de textos, você pode usar qualquer um com que você
      esteja familiarizado ou se sinta confortável usando.
      Se você usa TextEdit, entretanto, tenha certeza
      que você está salvando seus programas como somente-texto!  Caso contrário seus programas
      <em>não funcionarão</em>.  Outras opções para programar são
      emacs, vi, e pico, que estão todos acessíveis via
      linha de comando.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      E é isto!  Você está pronto para
      #{makeLink 'aprender a programar', :generateNumbers}.
      END_PARAGRAPH
    end
    h2 {'Instalação em Linux'}
    para do <<-END_PARAGRAPH
      Primeiro, vale a pena checar se você já tem Ruby
      instalado.  Digite #{input 'which ruby'}.  Se este comando responder
      algo como #{output '/usr/bin/which: no ruby in (...)'}, então você precisa
      <a href="http://www.ruby-lang.org/en/20020102.html">fazer o download do Ruby</a>,
      caso contrário veja que versão do Ruby você possui com
      #{input 'ruby -v'}.  Se for mais velha do que a última versão estável
      na página de download acima, pode ser bom atualizá-lo.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Se você for o usuário root, então você provavelmente não precisa de
      qualquer instrução para instalar o Ruby.  Se não for, você poderia
      pedir ao seu administrador de sistema para instalá-lo para você.
      (Desta forma todos neste sistema poderiam usar Ruby.)
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Caso contrário, você pode apenas instalá-lo de forma que apenas
      você possa usá-lo.
      Mova o arquivo baixado para um diretório temporário, como
      <kbd>$HOME/tmp</kbd>.  Se o nome do arquivo for
      <kbd>ruby-1.6.7.tar.gz</kbd>, você pode abri-lo com
      #{input 'tar zxvf ruby-1.6.7.tar.gz'}.  Mude do diretório atual
      para o diretório que acabou de ser criado (neste exemplo,
      #{input 'cd ruby-1.6.7'}).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Configure sua instalação digitando
      #{input './configure --prefix=$HOME'}).  Depois digite
      #{input 'make'}, que construirá seu interpretador Ruby.
      Isto pode levar alguns minutos.  Após isto ter terminado, digite
      #{input 'make install'} para instalá-lo.
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      Em seguida, você vai querer adicionar <kbd>$HOME/bin</kbd> para seu
      caminho de busca de comandos à variável de ambiente PATH, editando
      seu arquivo <kbd>$HOME/.bashrc</kbd>.
      (Você pode ter que se deslogar e logar novamente para que 
      isto surta efeito.)  Após ter feito isto, teste sua instalação:
      #{input 'ruby -v'}.  Se mostrar a você qual a versão do Ruby que você
      tem, você pode agora remover os arquivos 
      em <kbd>$HOME/tmp</kbd> (ou onde quer que você os colocou).
      END_PARAGRAPH
    end
    para do <<-END_PARAGRAPH
      E é isto!  Você está pronto para
      #{makeLink 'aprender a programar', :generateNumbers}.
      END_PARAGRAPH
    end
  end
end
