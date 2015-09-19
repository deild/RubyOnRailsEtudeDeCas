#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.column "product_id", :int
      t.column "order_id", :int
      t.column "quantity", :int
      t.column "unit_price", :decimal, :precision => 8, :scale => 2
    end
  end

  def self.down
    drop_table :line_items
  end
end
