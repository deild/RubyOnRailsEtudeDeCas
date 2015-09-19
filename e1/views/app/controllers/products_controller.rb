#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class ProductsController < ApplicationController

  
  def new
    @product = Product.new
    @details = Detail.new
  end
  
  
  
  def create
    @product = Product.new(params[:product])
    @details = Detail.new(params[:details])

    Product.transaction do
      @details.product = @product
      @product.save!
      @details.save!
      redirect_to :action => :show, :id => @product
    end

  rescue ActiveRecord::RecordInvalid => e
    @details.valid?   # force checking of errors even if products failed
    render :action => :new
  end
  
  
  def show
    @product = Product.find(params[:id])
  end
end
