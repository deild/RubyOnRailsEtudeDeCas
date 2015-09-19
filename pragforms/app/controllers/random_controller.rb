#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class RandomController < ApplicationController
  layout nil
  
  def slow
    sleep 2
    render :text=>"Back from slow url #{Time.now.strftime("%H:%M:%S")}"
  end
end
