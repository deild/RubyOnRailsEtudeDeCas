#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
$: << File.dirname(__FILE__)
require "connect"
require "logger"

ActiveRecord::Base.logger = Logger.new(STDOUT)

require "rubygems"
require_gem "activerecord"

ActiveRecord::Schema.define do

  
  create_table :people, :force => true do |t|
    t.column :type, :string

    # common attributes
    t.column :name, :string
    t.column :email, :string

    # attributes for type=Customer
    t.column :balance, :decimal, :precision => 10, :scale => 2

    # attributes for type=Employee
    t.column :reports_to, :integer
    t.column :dept,       :integer

    # attributes for type=Manager
    # -- none -- 
  end
  
  
end


class Person < ActiveRecord::Base
end

class Customer < Person
end

class Employee < Person
  belongs_to :boss, :class_name => "Employee", :foreign_key => :reports_to
end

class Manager < Employee
end



Customer.create(:name => 'John Doe',    :email => "john@doe.com",    
                :balance => 78.29)
                
wilma = Manager.create(:name  => 'Wilma Flint', :email => "wilma@here.com",  
                       :dept => 23)
               
Customer.create(:name => 'Bert Public', :email => "b@public.net",    
                :balance => 12.45)
                
barney = Employee.new(:name => 'Barney Rub',  :email => "barney@here.com", 
                      :dept => 23)
barney.boss = wilma
barney.save!

manager = Person.find_by_name("Wilma Flint")
puts manager.class    #=> Manager
puts manager.email    #=> wilma@here.com
puts manager.dept     #=> 23

customer = Person.find_by_name("Bert Public")
puts customer.class    #=> Customer
puts customer.email    #=> b@public.net
puts customer.balance  #=> 12.45

