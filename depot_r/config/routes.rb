ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/service.wsdl', :action => 'wsdl'
  map.connect ':controller/:action/:id'
  #START_HIGHLIGHT
  map.connect ':controller/:action/:id.:format'
  #END_HIGHLIGHT
end
