#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class User < ActiveRecord::Base
  validates_length_of :username, :minimum=>4
  has_many :accolades
  has_many :todos

  def self.find_random
    self.find(:first, :offset=>rand(self.count))
  end

  def completed_todos
    self.todos.find :all, :conditions=>['completed is not null']
  end
  
  def pending_todos
    self.todos.find :all, :conditions=>['completed is null'], :order=>:position
  end
  
end
