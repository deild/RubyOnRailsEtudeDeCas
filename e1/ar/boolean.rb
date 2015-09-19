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

class Bool < ActiveRecord::Base
end

Bool.delete_all
Bool.create(:flag => true)
b = Bool.find(:first)
pp b
puts b.flag? ? "TRUE" : "FALSE"
pp b.flag

Bool.delete_all
Bool.create(:flag => false)
b = Bool.find(:first)
pp b

puts b.flag? ? "TRUE" : "FALSE"
pp b.flag
