#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
require "rubygems"
require_gem "actionwebservice"


class RpcController < ActionController::Base
  web_service_dispatching_mode :layered
end

