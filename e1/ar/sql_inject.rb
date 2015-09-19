#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
$: << File.dirname(__FILE__)
require 'connect'


require 'rubygems'
require_gem 'activerecord'

# Connection code omitted...
class Order < ActiveRecord::Base
end

Order.logger = Logger.new(STDOUT)

Order.find("1' or 'a'=='a")

amount = "100' union select * from orders where id > 0'"
orders = Order.find(:all, :conditions => ["customer_id=22 and amount > '%d'", amount])

p orders.size
