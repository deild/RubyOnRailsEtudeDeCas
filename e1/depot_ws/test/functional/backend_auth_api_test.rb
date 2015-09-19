#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper' 
require 'backend_auth_controller'

class BackendAuthController
  def rescue_action(e)
    raise e
  end
end

class BackendAuthControllerApiTest < Test::Unit::TestCase
  fixtures :products

  def setup
    @controller = BackendAuthController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new 
  end

  def test_find_all_products
    result = invoke :find_all_products, 'secret'
    assert result[0].is_a?(Integer)
  end

  def test_find_product_by_id
    product = invoke :find_product_by_id, 'secret', 2
    assert_equal 'Product 2', product.description
  end
end
