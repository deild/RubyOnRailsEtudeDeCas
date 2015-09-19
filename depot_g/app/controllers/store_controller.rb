class StoreController < ApplicationController
  
  def index
    @products = Product.find_products_for_sale
  end
  
  #START:add_to_cart
  def add_to_cart
    @cart = find_cart                   # <label id="code.depot.f.find"/>
    product = Product.find(params[:id])  # <label id="code.depot.f.find2"/>
    @cart.add_product(product)           # <label id="code.depot.f.add"/>
  end
  #END:add_to_cart
  
  #START:cart
  private
  
  def find_cart
    session[:cart] ||= Cart.new
  end
  #END:cart
end