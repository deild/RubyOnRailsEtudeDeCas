#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class Product < ActiveRecord::Base
  
  has_one :detail
  
  validates_presence_of :title
  
end
