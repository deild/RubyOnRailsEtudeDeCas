#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'

class RoutingTest < Test::Unit::TestCase

  def setup
    load "config/routes_with_conditions.rb"
  end
  
  
  def test_method_specific_routes
    assert_recognizes({"controller" => "store", "action" => "display_checkout_form"},
                       :path => "/store/checkout", :method => :get)
    assert_recognizes({"controller" => "store", "action" => "save_checkout_form"},
                      :path => "/store/checkout", :method => :post)
  end
  
end

