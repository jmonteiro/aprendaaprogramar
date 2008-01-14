module FormattingPage
  #
  #  PÁGINA DE TESTE PARA FORMATAÇÃO
  #
  
  def generateFormattingPage
    h1 { 'Cabeçalho 1' }
    h2 { 'Cabeçalho 2' }
    h3 { 'Cabeçalho 3' }
    h4 { 'Cabeçalho 4' }
    
    para {'Aqui está um código com uma saída falsa:'}
    prog [], '...brincadeirinha, cara...', 'FANTÁSTICO!' do <<-'END_CODE'
      #  Aqui está um código 'Ruby'.
      #  5 é melhor do que 6.
      #  def wilma do end if not in, cara.
      #'
      
      '#Isto não deveria causar nenhum problema.'
      'Nem # deveria isto\\'
      'do end if elsif else case when then while def class'
      'or and not next in'
      'to 3 or not to 3, that is 3.7'
      '' + 'x'+''+''+'..'
               '' +'o'
      
      8
      0.09
      9.9
      5.times {}
      
      puts 'Eu adoro queijo.' # yo 'g'
      puts 5.02 + 8 + 0.002  # s'up, muva
      
      jimmy = ['yoyoyo', 66]
      jimmy.each do |item|
        puts item.inspect
      end
      
      puts case 'abobora'
        when String then 'sim'
        when Fixnum then 'nao'
        else 'talvez'
      end
      
      def yummy
        if (4 <= 5)
          'Uhmmm!'
        elsif (4 == 5)
          'Ãh?'
        else
          while (1 == 2)
            puts 'O quê?'
          end
        end
      end
      
      class ApenasAlgumaClasse
        def initialize
          @var = 5
        end
      end
      
      puts Math::PI  #  Deveria funcionar.
      puts PI        #  Não deveria funcionar.
      END_CODE
    end
    para {'Aqui está um código com entrada e saída:'}
    prog ['"Chris"', '&26', '<red>'] do <<-END_CODE
      puts 'yoyo...wuddup?'
      puts 'NOME:'
      name = gets.chomp
      puts 'IDADE:'
      age = gets.chomp
      puts 'COR FAVORITA'
      color = gets.chomp
      puts 'Olá, '+name+', amante da cor '+color+' de '+age+' anos de idade. '
      END_CODE
    end
    
    para do <<-END_PARAGRAPH
      Olá.  Eu adoro #{input 'colocar VÁRIAS coisas'}.  Eu também fico animado
      de #{code 'codificar várias coisas'}.  Existe uma tal emoção em
      ver tudo da excitante #{output 'saída que você pode obter'} de um
      programa bem escrito.
      END_PARAGRAPH
    end
  end
end
