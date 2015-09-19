#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class Language < ActiveRecord::Base
  validates_length_of :name, :minimum=>1
  validates_numericality_of :shortest_wiki
  validates_each :shortest_wiki do |r,at,val|
    r.errors.add at, 'Must be > 0' if !val || val < 0
  end
end
