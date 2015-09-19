#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
$: << File.dirname(__FILE__)
require "connect"
require "logger"

#ActiveRecord::Base.logger = Logger.new(STDOUT)

require "rubygems"
require_gem "activerecord"


ActiveRecord::Schema.define do
  
  create_table :products, :force => true do |t|
    t.column :title, :string
    t.column :description, :text
    # ...
    t.column :line_items_count, :integer, :default => 0
  end
  
  
  create_table :line_items, :force => true do |t|
    t.column :product_id, :integer
    t.column :order_id,   :integer
    t.column :quantity,   :integer
    t.column :unit_price, :decimal, :precision => 8, :scale => 2
  end
  
end

class Product < ActiveRecord::Base
  has_many :line_items
end


class LineItem < ActiveRecord::Base
  belongs_to :product, :counter_cache => true
end



product = Product.create(:title => "Programming Ruby",
                         :description => " ... ")
line_item = LineItem.new
line_item.product = product
line_item.save
puts "In memory size = #{product.line_items.size}"             #=> 0
puts "Refreshed size = #{product.line_items(:refresh).size}"   #=> 1




LineItem.delete_all
Product.delete_all


product = Product.create(:title => "Programming Ruby", 
                         :description => " ... ")
product.line_items.create
puts "In memory size = #{product.line_items.size}"             #=> 1
puts "Refreshed size = #{product.line_items(:refresh).size}"   #=> 1




