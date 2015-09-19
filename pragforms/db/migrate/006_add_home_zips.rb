#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class AddHomeZips < ActiveRecord::Migration
  def self.up
    Zip.create(:zip=>27514, :city=>"Chapel Hill", :state=>"NC") unless Zip.find_by_zip("27514")
    Zip.create(:zip=>27707, :city=>"Durham", :state=>"NC") unless Zip.find_by_zip("27707")
  end

  def self.down
    Zip.delete_all
  end
end
