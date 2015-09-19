#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
$: << File.dirname(__FILE__)
require "connect"
require "logger"
require "rubygems"
require_gem "activerecord"

#ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.connection.instance_eval do
  
  
  create_table :parents, :force => true do |t|
  end
  
  create_table :children, :force => true do |t|
    t.column :parent_id, :integer
    t.column :name,      :string
    t.column :position,  :integer
  end
  
end



class Parent < ActiveRecord::Base
  has_many :children, :order => :position
end

class Child < ActiveRecord::Base
  belongs_to :parent
  acts_as_list  :scope => :parent_id
end




parent = Parent.new
%w{ One Two Three Four}.each do |name|
  parent.children.create(:name => name)
end
parent.save



def display_children(parent)
  puts parent.children(true).map {|child| child.name }.join(", ")
end



display_children(parent)         #=> One, Two, Three, Four

puts parent.children[0].first?   #=> true

two = parent.children[1]
puts two.lower_item.name         #=> Three
puts two.higher_item.name        #=> One

parent.children[0].move_lower
display_children(parent)         #=> Two, One, Three, Four

parent.children[2].move_to_top
display_children(parent)         #=> Three, Two, One, Four

parent.children[2].destroy
display_children(parent)         #=> Three, Two, Four

