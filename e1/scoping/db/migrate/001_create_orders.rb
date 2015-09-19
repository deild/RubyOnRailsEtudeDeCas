#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders, :force => true do |t|
      t.column :user_id, :integer
    end
    3.times {|user| 4.times { Order.create(:user_id => user + 1) } }
  end

  def self.down
    drop_table :orders
  end
end
