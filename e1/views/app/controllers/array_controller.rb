#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class ArrayController < ApplicationController
  def edit
    if request.post?
      
      Product.update(params[:product].keys, params[:product].values)
      
    end
    @products = Product.find(:all)
  end
end
