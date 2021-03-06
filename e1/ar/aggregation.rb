#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
$: << File.dirname(__FILE__)
require "connect"
require "logger"
require "pp"

#ActiveRecord::Base.logger = Logger.new(STDOUT)

#require "rubygems"
#require_gem "activerecord"

ActiveRecord::Schema.define do
  
  create_table :customers, :force => true do |t|
    t.column :created_at,     :datetime
    t.column :credit_limit,   :decimal, :precision => 10, :scale => 2, :default => 100
    t.column :first_name,     :string
    t.column :initials,       :string
    t.column :last_name,      :string
    t.column :last_purchase,  :datetime
    t.column :purchase_count, :integer, :default => 0
  end
  
end


class LastFive
  
  attr_reader :list

  # Takes a string containing "a,b,c" and 
  # stores [ 'a', 'b', 'c' ]
  def initialize(list_as_string)
    @list = list_as_string.split(/,/)
  end


  # Returns our contents as a 
  # comma delimited string
  def last_five
    @list.join(',')
  end
end



class Purchase < ActiveRecord::Base
  composed_of :last_five
end


Purchase.delete_all


Purchase.create(:last_five => LastFive.new("3,4,5"))

purchase = Purchase.find(:first)

puts purchase.last_five.list[1]     #=>  4




class Name
  attr_reader :first, :initials, :last

  def initialize(first, initials, last)
    @first = first
    @initials = initials
    @last = last
  end

  def to_s
    [ @first, @initials, @last ].compact.join(" ")
  end
end



class Customer < ActiveRecord::Base

  composed_of :name,
              :class_name => Name,
              :mapping => 
                 [ # database       ruby
                   [ :first_name,  :first ],
                   [ :initials,    :initials ],
                   [ :last_name,   :last ] 
                 ]
end


Customer.delete_all


name = Name.new("Dwight", "D", "Eisenhower")

Customer.create(:credit_limit => 1000, :name => name)

customer = Customer.find(:first)
puts customer.name.first    #=> Dwight
puts customer.name.last     #=> Eisenhower
puts customer.name.to_s     #=> Dwight D Eisenhower
customer.name = Name.new("Harry", nil, "Truman")
customer.save


