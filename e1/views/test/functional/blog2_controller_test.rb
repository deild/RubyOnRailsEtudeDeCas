#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'
require 'blog2_controller'

# Re-raise errors caught by the controller.
class Blog2Controller; def rescue_action(e) raise e end; end

class Blog2ControllerTest < Test::Unit::TestCase
  def setup
    @controller = Blog2Controller.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
