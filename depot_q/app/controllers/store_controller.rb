#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class StoreController < ApplicationController
  
  
  before_filter :find_cart, :except => :empty_cart
  
  
  def index
    @products = Product.find_products_for_sale
  end


  def add_to_cart
    begin                     
      product = Product.find(params[:id])  
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index("Invalid product")
    else
      @current_item = @cart.add_product(product)
      redirect_to_index unless request.xhr?
    end
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index
  end

  
  def checkout
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
    end
  end
  
  
  
  def save_order
    @order = Order.new(params[:order])   
    @order.add_line_items_from_cart(@cart)
    if @order.save                       
      session[:cart] = nil
      redirect_to_index("Thank you for your order")
    else
      render :action => :checkout
    end
  end
  
  private
  
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => :index
  end
    
  
  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end
  
end
