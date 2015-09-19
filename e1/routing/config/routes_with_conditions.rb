#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
ActionController::Routing::Routes.draw do |map|
  map.connect 'store/checkout',
       :conditions => { :method => :get },
       :controller => "store",
       :action     => "display_checkout_form"

  map.connect 'store/checkout',
       :conditions => { :method => :post },
       :controller => "store",
       :action     => "save_checkout_form"
end
