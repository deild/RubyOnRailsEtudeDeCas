#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateZips < ActiveRecord::Migration
  def self.up
    create_table :zips do |t|
      t.column :zip, :string
      t.column :city, :string
      t.column :state, :string
      t.column :created_at, :datetime
      t.column :edited_at, :datetime
      t.column :lock_version, :int, :default=>0
    end
  end

  def self.down
    drop_table :zips
  end
end
