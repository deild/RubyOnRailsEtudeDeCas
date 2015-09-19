#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class OrderController < ApplicationController
  
  meantime_filter  :restrict_order_to_user    

  def index
    @orders = Order.find(:all)
  end

  def show
    @order = Order.find(params[:id]) rescue nil
    redirect_to(:action => :index) if @order.nil?
  end

  def invoice
    @order = Order.find(params[:id]) rescue nil
    redirect_to(:action => :index) if @order.nil?
  end   
  
  private
  
  def restrict_order_to_user                
    Order.with_scope(:find => {:conditions => ["user_id = ?", session[:user_id]]}) do
      yield
    end
  end
end
