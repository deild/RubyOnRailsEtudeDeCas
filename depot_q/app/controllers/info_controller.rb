#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class InfoController < ApplicationController
   
 def who_bought
   @product = Product.find(params[:id])
   @orders  = @product.orders
#   response.headers['Content-Type'] = 'text/plain'
 end
   
end
