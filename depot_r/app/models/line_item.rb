# Schema as of June 12, 2006 15:45 (schema version 7)
#
# Table name: line_items
#
#  id          :integer(11)   not null, primary key
#  product_id  :integer(11)   default(0), not null
#  order_id    :integer(11)   default(0), not null
#  quantity    :integer(11)   default(0), not null
#  total_price :integer(11)   default(0), not null
#

#START:belongs_to
class LineItem < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product
#END:belongs_to
  
  def self.from_cart_item(cart_item)
    li = self.new
    li.product     = cart_item.product
    li.quantity    = cart_item.quantity
    li.total_price = cart_item.price
    li
  end
  
#START:belongs_to
end
#END:belongs_to
