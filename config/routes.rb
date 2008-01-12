ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'learn'
  map.connect 'index.rb', :controller => 'learn', :action => 'index'
end
