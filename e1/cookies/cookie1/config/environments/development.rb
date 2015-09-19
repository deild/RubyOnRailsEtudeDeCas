#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
Dependencies.mechanism                             = :load
ActionController::Base.consider_all_requests_local = true
ActionController::Base.perform_caching             = false
BREAKPOINT_SERVER_PORT = 42531