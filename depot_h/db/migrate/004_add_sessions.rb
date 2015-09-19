#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class AddSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.column :session_id, :string
      t.column :data, :text
      t.column :updated_at, :datetime
    end
    
    add_index :sessions, :session_id
  end

  def self.down
    drop_table :sessions
  end
end
