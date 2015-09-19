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




# Connection code omitted...

class Order < ActiveRecord::Base
end



pp Order.columns.map { |col| col.name }
pp Order.columns_hash['shipped_at']



order = Order.new
order.shipped_at = "2005-03-04 12:34"
pp order.shipped_at.class
pp order.shipped_at

