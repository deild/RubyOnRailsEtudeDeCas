#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'
require 'form_controller'

# Re-raise errors caught by the controller.
class FormController; def rescue_action(e) raise e end; end

class FormControllerTest < Test::Unit::TestCase
  fixtures :products

  def setup
    @controller = FormController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_rendered_file 'list'
  end

  def test_list
    get :list
    assert_rendered_file 'list'
    assert_template_has 'products'
  end

  def test_show
    get :show, 'id' => 1
    assert_rendered_file 'show'
    assert_template_has 'product'
    assert_valid_record 'product'
  end

  def test_new
    get :new
    assert_rendered_file 'new'
    assert_template_has 'product'
  end

  def test_create
    num_products = Product.find_all.size

    post :create, 'product' => { }
    assert_redirected_to :action => 'list'

    assert_equal num_products + 1, Product.find_all.size
  end

  def test_edit
    get :edit, 'id' => 1
    assert_rendered_file 'edit'
    assert_template_has 'product'
    assert_valid_record 'product'
  end

  def test_update
    post :update, 'id' => 1
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Product.find(1)

    post :destroy, 'id' => 1
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      product = Product.find(1)
    }
  end
end
