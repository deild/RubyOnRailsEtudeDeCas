#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
$: << File.dirname(__FILE__)
require "connect"
require "logger"

#ActiveRecord::Base.logger = Logger.new(STDOUT)

require "rubygems"
require_gem "activerecord"

class Order < ActiveRecord::Base


 ActiveRecord::Callbacks::CALLBACKS.each do |cb|
    define_method(cb) { puts "#{cb}"}
  end

#  before_save { puts "in hook" }

#  def before_save
#    puts "BEFORE SAVE"
#  end
end
puts "========="

Order.create
o = Order.find(1)
puts "========="
o.save
