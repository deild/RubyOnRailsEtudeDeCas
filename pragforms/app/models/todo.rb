#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class Todo < ActiveRecord::Base
  belongs_to :user
  acts_as_list :scope=>:user_id
end
