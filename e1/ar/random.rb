#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
$: << File.dirname(__FILE__)
require "connect"
require "logger"
require "pp"

ActiveRecord::Base.logger = Logger.new(STDOUT)

require "rubygems"
require_gem "activerecord"


class Order < ActiveRecord::Base
end

o1 = Order.new
o2 = Order.new

o1.id = "wibble"
o2.id = "wobble"

hash = {
  o1 => "one",
  o2 => "two"
}

p hash

res = Order.connection.select_all("select id, quantity*unit_price as total from line_items")
pp res
