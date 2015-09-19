class StoreController < ApplicationController
  
  #START:before_filter
  before_filter :find_cart, :except => :empty_cart
  #END:before_filter
  
  def index
    @products = Product.find_products_for_sale
  end


  def add_to_cart
    begin                     
      product = Product.find(params[:id])  
    rescue ActiveRecord::RecordNotFound
      logger.error("Tentative d'accès à un produit invalide (#{params[:id]})")
      redirect_to_index("Produit Invalide")
    else
      @current_item = @cart.add_product(product)
      redirect_to_index unless request.xhr?
    end
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index
  end

  #START:checkout
  def checkout
    if @cart.items.empty?
      redirect_to_index("Votre panier est vide")
    else
      @order = Order.new
    end
  end
  #END:checkout
  
  #START:save_order
  def save_order
    @order = Order.new(params[:order])  
    @order.add_line_items_from_cart(@cart)
    if @order.save        
      session[:cart] = nil
      redirect_to_index("Merci pour votre commande")
    else
      render :action => :checkout
    end
  end
  #END:save_order
  private
  
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => :index
  end
    
  #START:find_cart
  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end
  #END:find_cart<
end
