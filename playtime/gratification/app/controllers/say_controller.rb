#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class SayController < ApplicationController
  def hello
    @time = Time.now
  end
  
  def goodbye
  end
  
  def erb_loops
  end
  
  def file_list
  end
end