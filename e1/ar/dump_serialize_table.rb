#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
$: << File.dirname(__FILE__)
require 'connect'

require 'rubygems'
require_gem 'activerecord'
require 'pp'

ActiveRecord::Schema.define do
  
  create_table :purchases, :force => true do |t|
    t.column :name, :string
    t.column :last_five, :text
  end
  
end


class Purchase < ActiveRecord::Base
  serialize :last_five
  # ...
end



purchase = Purchase.new
purchase.name = "Dave Thomas"
purchase.last_five = [ 'shoes', 'shirt', 'socks', 'ski mask', 'shorts' ]
purchase.save



purchase = Purchase.find_by_name("Dave Thomas")
pp purchase.last_five
pp purchase.last_five[3]

