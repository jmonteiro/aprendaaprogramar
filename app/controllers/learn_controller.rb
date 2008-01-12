class LearnController < ApplicationController
  session :off
  
  def index
    # captura a saída 
    request.cgi.instance_eval do
      def out(options = 'text/plain') 
        yield if block_given?
      end
    end
    opt = {}
    
    # reajusta os parâmetros para passar ao CGI
    params.each { |k,v| opt.merge!( k => [v] ) }
    unless opt.include?("ShowTutorialCode")
      opt.merge!("ShowTutorialCode" => [nil])
    end
    unless opt.include?("Chapter")
      opt.merge!("Chapter" => ["00"])
    end
    request.cgi.params = opt
    
    # redireciona a saída do cgi para a saída do controller
    render :text => LearnToProgramTutorial.handle_request(request.cgi)
  end
end
