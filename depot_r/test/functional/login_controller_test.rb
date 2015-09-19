#START:original
require File.dirname(__FILE__) + '/../test_helper'
require 'login_controller'

# Re-raise errors caught by the controller.
class LoginController; def rescue_action(e) raise e end; end

class LoginControllerTest < Test::Unit::TestCase
#END:original

  fixtures :users
  
#START:original
  def setup
    @controller = LoginController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
#END:original
  
  if false
    #START:index
    def test_index 
      get :index 
      assert_response :success 
    end
    #END:index
  end

  #START:index_without_user
  def test_index_without_user
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Veuillez vous identifier", flash[:notice]
  end
  #END:index_without_user

  #START:index_with_user
  def test_index_with_user
    get :index, {}, { :user_id => users(:dave).id }
    assert_response :success
    assert_template "index"
  end
  #END:index_with_user
 
  #START:test_login
  def test_login
    dave = users(:dave)
    post :login, :name => dave.name, :password => 'secret'
    assert_redirected_to :action => "index"
    assert_equal dave.id, session[:user_id]
  end
  #END:test_login

  #START:test_bad_password
  def test_bad_password
    dave = users(:dave)
    post :login, :name => dave.name, :password => 'wrong'
    assert_template "login"
    assert_equal "Couple utilisateur / mot de passe invalide", flash[:notice]
  end
  #END:test_bad_password
#START:original
end
#END:original
