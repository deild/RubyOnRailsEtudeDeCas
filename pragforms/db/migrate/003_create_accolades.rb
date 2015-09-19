#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateAccolades < ActiveRecord::Migration
  def self.up
    create_table :accolades do |t|
      t.column :name, :string
      t.column :received, :date
      t.column :user_id, :int
    end
  end

  def self.down
    drop_table :accolades
  end
end
