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

class BadBook < ActiveRecord::Base
  set_primary_key "isbn"
end


BadBook.delete_all

pp BadBook.columns_hash.keys

	 book = BadBook.new
         book.id   = "0-12345-6789"
         book.title = "My Great American Novel"
         book.save

	 # ...
    
         book = BadBook.find("0-12345-6789")
         puts book.title  # => "My Great American Novel"
puts book.id
p book.attributes
