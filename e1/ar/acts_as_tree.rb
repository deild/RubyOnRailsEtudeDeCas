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

ActiveRecord::Schema.define do

  
  create_table :categories, :force => true do |t|
    t.column :name, :string
    t.column :parent_id, :integer
  end
  
end





class Category < ActiveRecord::Base
  acts_as_tree  :order => "name"
end




root        = Category.create(:name => "Books")
fiction     = root.children.create(:name => "Fiction")
non_fiction = root.children.create(:name => "Non Fiction")

non_fiction.children.create(:name => "Computers")
non_fiction.children.create(:name => "Science")
non_fiction.children.create(:name => "Art History")

fiction.children.create(:name => "Mystery")
fiction.children.create(:name => "Romance")
fiction.children.create(:name => "Science Fiction")


def display_children(order)
  puts order.children.map {|child| child.name }.join(", ")
end


display_children(root)             # Fiction, Non Fiction

sub_category = root.children.first
puts sub_category.children.size    #=> 3
display_children(sub_category)     #=> Mystery, Romance, Science Fiction

non_fiction = root.children.find(:first, :conditions => "name = 'Non Fiction'")

display_children(non_fiction)      #=> Art History, Computers, Science
puts non_fiction.parent.name       #=> Books
