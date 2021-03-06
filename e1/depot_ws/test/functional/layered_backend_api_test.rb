#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper' 
require 'layered_backend_controller'

class LayeredBackendController
  def rescue_action(e)
    raise e
  end
end

class BackendControllerApiTest < Test::Unit::TestCase
  fixtures :products, :orders

  def setup
    @controller = LayeredBackendController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new 
    @protocool  = :soap
  end

  def test_find_all_products
    result = invoke_layered :product, :find_all_products
    assert result[0].is_a?(Integer)
  end

  def test_find_product_by_id
    product = invoke_layered :product, :find_product_by_id, 2
    assert_equal 'Product 2', product.description
  end

  def test_is_order_shipped
    assert_equal true, invoke_layered(:order, :is_order_shipped, 2)
  end

  def test_is_order_not_shipped
    assert_equal false, invoke_layered(:order, :is_order_shipped, 1)
  end
end
