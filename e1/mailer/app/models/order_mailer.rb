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
    @sent_on       = Time.now
    @body["order"] = order
  end



  def sent(order)
    @subject       = "Pragmatic Order Shipped"
    @recipients    = order.email
    @from          = 'orders@pragprog.com'
    @sent_on       = Time.now
    @body["order"] = order
  end



  def ship_with_images(order)
    @subject       = "Pragmatic Order Shipped"
    @recipients    = order.email
    @from          = 'orders@pragprog.com'
    @sent_on       = Time.now
    @body["order"] = order
    
    part :content_type => "text/html",
         :body => render_message("sent", :order => order)

    order.line_items.each do |li|
      image = li.product.image_location
      content_type = case File.extname(image)
      when ".jpg", ".jpeg";  "image/jpeg"
      when ".png";           "image/png"
      when ".gif";           "image/gif"
      else;                  "application/octet-stream"
      end
    
      attachment :content_type => content_type,
                 :body         => File.read(File.join("public", image)),
                 :filename     => File.basename(image)
    end
  end



  def survey(order)
    @subject       = "Pragmatic Order: Give us your thoughts"
    @recipients    = order.email
    @from          = 'orders@pragprog.com'
    @sent_on       = Time.now
    @body["order"] = order
  end




end


