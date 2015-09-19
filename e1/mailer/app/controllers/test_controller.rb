#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---


class TestController < ApplicationController

  def create_order
    order = Order.find_by_name("Dave Thomas")
    email = OrderMailer.create_confirm(order)
    render(:text => "<pre>" + email.encoded + "</pre>")
  end



  def ship_order
    order = Order.find_by_name("Dave Thomas")
    email = OrderMailer.create_sent(order)
    email.set_content_type("text/html")
    OrderMailer.deliver(email)
    render(:text => "Thank you...")
  end



  def survey
    order = Order.find_by_name("Dave Thomas")
    email = OrderMailer.deliver_survey(order)
    render(:text => "E-Mail sent")
  end



  def ship_with_images
    order = Order.find_by_name("Dave Thomas")
    email = OrderMailer.deliver_ship_with_images(order)
    render(:text => "E-Mail sent")
  end




end


