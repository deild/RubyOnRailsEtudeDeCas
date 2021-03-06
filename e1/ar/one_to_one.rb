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

ActiveRecord::Schema.define do
  
  create_table :invoices, :force => true do |t|
    t.column :order_id, :integer
  end

  create_table :orders, :force => true do |t|
    t.column :name, :string
    t.column :email, :string
    t.column :address, :text
    t.column :pay_type, :string
    t.column :shipped_at, :datetime
  end

end


class Order < ActiveRecord::Base
  has_one :invoice
end

class Invoice < ActiveRecord::Base
  belongs_to :order
end


Order.create(:name => "Dave", :email => "dave@xxx",
             :address => "123 Main St", :pay_type => "credit",
             :shipped_at => Time.now)



order = Order.find(1)

p order.invoice

invoice = Invoice.new
if invoice.save
  order.invoice = invoice
else
  fail invoice.errors.to_s
end

p order.invoice

o = Order.new
p o.id
invoice.order = o
p o.id
invoice.save
p o.id
