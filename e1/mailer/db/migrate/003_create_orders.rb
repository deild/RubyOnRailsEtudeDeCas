#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.column "name", :string
      t.column "email", :string
      t.column "address", :text
      t.column "pay_type", :string
      t.column "when_shipped", :datetime
    end
  end

  def self.down
    drop_table :orders
  end
end
