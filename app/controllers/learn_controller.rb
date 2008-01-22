class LearnController < ApplicationController
  session :off
  
  def index
    # captura a saída 
    request.cgi.instance_eval do
      def out(options = 'text/plain', optional = true) 
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
      opt.merge!("Chapter" => 13)
    end
    request.cgi.params = opt
    
    # redireciona a saída do cgi para a saída do controller
    render :text => LearnToProgramTutorial.handle_request(request.cgi), :status => 200, :layout => false
  end
end
