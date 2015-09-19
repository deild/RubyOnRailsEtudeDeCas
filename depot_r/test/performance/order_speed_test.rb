require File.dirname(__FILE__) + '/../test_helper'
require 'store_controller'

# Re-raise errors caught by the controller.
class OrderController; def rescue_action(e) raise e end; end

class OrderSpeedTest < Test::Unit::TestCase
  
  DAVES_DETAILS = {
      :name     => "Dave Thomas",
      :address  => "123 The Street",
      :email    => "dave@pragprog.com",
      :pay_type => "check"
  }
  
  #START:fixtures
  self.fixture_path = File.join(File.dirname(__FILE__), "../fixtures/performance")
  fixtures :products
  #END:fixtures
  
  def setup
    @controller = StoreController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end


  #START:test
  def test_100_orders
    Order.delete_all
    LineItem.delete_all

    #START:silence
    @controller.logger.silence do
    #END:silence
      elapsed_time = Benchmark.realtime do
        100.downto(1) do |prd_id|
          cart = Cart.new
          cart.add_product(Product.find(prd_id))
          post :save_order, 
               { :order => DAVES_DETAILS },
               { :cart  => cart }
          assert_redirected_to :action => :index
        end         
      end       
      assert_equal 100, Order.count
      assert elapsed_time < 3.00
    #START:silence  
    end
    #END:silence
  end
  #END:test
end
