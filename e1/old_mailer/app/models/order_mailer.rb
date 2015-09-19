#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---


class OrderMailer < ActionMailer::Base


  def confirm(order)
    @subject       = "Pragmatic Store Order Confirmation"
    @recipients    = order.email
    @from          = 'orders@pragprog.com'
    @body["order"] = order
  end



  def sent(order)
    @subject       = "Pragmatic Order Shipped"
    @recipients    = order.email
    @from          = 'orders@pragprog.com'
    @body["order"] = order
  end

end


