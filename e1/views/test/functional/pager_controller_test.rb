#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'
require 'pager_controller'

# Re-raise errors caught by the controller.
class PagerController; def rescue_action(e) raise e end; end

class PagerControllerTest < Test::Unit::TestCase
  def setup
    @controller = PagerController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
