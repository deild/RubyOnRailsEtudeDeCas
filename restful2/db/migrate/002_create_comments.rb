#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :comment,    :text
      t.column :updated_at, :datetime
      t.column :article_id, :integer
    end
  end

  def self.down
    drop_table :comments
  end
end
