#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :username, :string
      t.column :favorite_language, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :lock_version, :int, :default=>0
    end
  end

  def self.down
    drop_table :users
  end
end
