#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class CookiesController < ApplicationController
  def action_one
    cookies[:the_time] = Time.now.to_s
    redirect_to :action => "action_two"
  end

  def action_two
    cookie_value = cookies[:the_time]
    render(:text => "The cookie says it is #{cookie_value}")
  end
end
