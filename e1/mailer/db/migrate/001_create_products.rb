#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :image_location, :string
      t.column :price, :decimal, :precision => 8, :scale => 2
      t.column :date_available, :datetime
    end
  end

  def self.down
    drop_table :products
  end
end
