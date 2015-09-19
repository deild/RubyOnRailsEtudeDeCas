#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CartItem
  
  attr_reader :product, :quantity
  
  def initialize(product)
    @product = product
    @quantity = 1
  end
  
  def increment_quantity
    @quantity += 1
  end
  
  def title
    @product.title
  end
  
  def price
    @product.price * @quantity
  end
end