#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class StoreController < ApplicationController
  
  def index
    @products = Product.find_products_for_sale
  end
  
  
  def add_to_cart
    begin                     
      product = Product.find(params[:id])  
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      flash[:notice] = "Invalid product"
      redirect_to :action => :index
    else
      @cart = find_cart
      @cart.add_product(product)           
    end
  end
  

  
  def empty_cart
    session[:cart] = nil
    flash[:notice] = "Your cart is currently empty"
    redirect_to :action => :index
  end
  
  private
  
  def find_cart
    session[:cart] ||= Cart.new
  end
end
