# Schema as of June 12, 2006 15:45 (schema version 7)
#
# Table name: orders
#
#  id       :integer(11)   not null, primary key
#  name     :string(255)   
#  address  :text          
#  email    :string(255)   
#  pay_type :string(10)    
#

#START:validate
#START:select
#START:has_many
class Order < ActiveRecord::Base
#END:select
#END:validate
  
  has_many :line_items
#END:has_many

  #START:select  
  PAYMENT_TYPES = [
    #  Displayed        stored in db
    [ "Chèque",          "check" ],
    [ "Carte bancaire",    "cc"   ],
    [ "Bon de commande", "po" ]
  ]
  
  # ...
  #END:select

  #START:validate
  validates_presence_of :name, :address, :email, :pay_type
  validates_inclusion_of :pay_type, :in => PAYMENT_TYPES.map {|disp, value| value}
  
  # ...
  #END:validate

  #START:add_line_items_from_cart
  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li 
    end 
  end 
  #END:add_line_items_from_cart


#START:has_many  
end
#END:has_many
