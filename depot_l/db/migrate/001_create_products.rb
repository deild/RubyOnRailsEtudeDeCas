#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :title,       :string
      t.column :description, :text
      t.column :image_url,   :string
    end
  end

  def self.down
    drop_table :products
  end
end
