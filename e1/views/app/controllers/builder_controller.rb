#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class BuilderController < ApplicationController
  
  def new
    @product = Product.new
  end
  
  def new_with_helper
    new
  end
  
  def save
    @product = Product.new(params[:product])
    if @product.save
      redirect_to _action => :index
    else
      render :action => :new
    end
  end
  
  def index
    render :inline => "You have <%= pluralize(Product.count, 'Product') %>"
  end
end
