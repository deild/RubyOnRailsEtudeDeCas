#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
ActionController::Routing::Routes.draw do |map| 
  
  # Straight 'http://my.app/blog/' displays the index 
  map.connect "blog/", 
              :controller => "blog", 
              :action => "index" 

  
  # Return articles for a year, year/month, or year/month/day 
  map.connect "blog/:year/:month/:day", 
              :controller => "blog", 
              :action => "show_date", 
              :requirements => { :year => /(19|20)\d\d/,
                                 :month => /[01]?\d/, 
                                 :day => /[0-3]?\d/}, 
              :day => nil, 
              :month => nil 

  # Show an article identified by an id 
  map.connect "blog/show/:id", 
              :controller => "blog", 
              :action => "show", 
              :id => /\d+/ 
              
  # Regular Rails routing for admin stuff 
  map.connect "blog/:controller/:action/:id" 
  

  # Catchall so we can gracefully handle badly formed requests 
  map.connect "*anything", 
              :controller => "blog", 
              :action => "unknown_request" 
end
