require File.dirname(__FILE__) + '/../test_helper'
require 'store_controller'

# Re-raise errors caught by the controller.
class StoreController; def rescue_action(e) raise e end; end

class StoreControllerTest < Test::Unit::TestCase
  
  fixtures :products
  
  def setup
    @controller = StoreController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_post_to_add_to_cart
    get :index
    ruby_id = products(:ruby_book).id
    assert_select "form[action=/store/add_to_cart/#{ruby_id}][method=post]"
  end

end
