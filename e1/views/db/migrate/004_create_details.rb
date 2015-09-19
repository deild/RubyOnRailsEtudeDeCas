#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.column :product_id,   :integer
      t.column :sku,          :string
      t.column :manufacturer, :string
    end
  end

  def self.down
    drop_table :details
  end
end
