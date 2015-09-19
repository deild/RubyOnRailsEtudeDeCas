#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class FormController < ApplicationController
  def index
    list
    render_action 'list'
  end

  def list
    @product_pages, @products = paginate :product, :per_page => 10
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash['notice'] = 'Product was successfully created.'
      redirect_to :action => 'list'
    else
      render_action 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash['notice'] = 'Product was successfully updated.'
      redirect_to :action => 'show', :id => @product
    else
      render_action 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
