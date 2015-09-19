#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---

class LineItem < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product

  
  def self.from_cart_item(cart_item)
    li = self.new
    li.product     = cart_item.product
    li.quantity    = cart_item.quantity
    li.total_price = cart_item.price
    li
  end
  

end

