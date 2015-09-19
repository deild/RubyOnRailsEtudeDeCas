#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---

require File.dirname(__FILE__) + '/../test_helper'
require 'order_mailer'

class OrderMailerTest < Test::Unit::TestCase

  def setup
    @order = Order.new(:name =>"Dave Thomas", :email => "dave@pragprog.com")
  end

  def test_confirm
    response =  OrderMailer.create_confirm(@order)
    assert_equal("Pragmatic Store Order Confirmation", response.subject)
    assert_equal("dave@pragprog.com", response.to[0])
    assert_match(/Dear Dave Thomas/,  response.body)
  end


  def test_sent
    response =  OrderMailer.create_sent(@order)
    assert_equal("Pragmatic Order Shipped", response.subject)
    # . . .
  end

  private
  
  def encode(subject)
    ActionMailer::Base.quoted_printable(subject, CHARSET)
  end

end

