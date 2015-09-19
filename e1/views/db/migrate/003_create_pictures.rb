#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.column :comment,      :string
      t.column :name,         :string
      t.column :content_type, :string
      # If using MySQL, blobs default to 64k, so we have to give
      # an explicit size to extend them
      t.column :data,         :binary, :limit => 1.megabyte
    end
  end

  def self.down
    drop_table :pictures
  end
end
