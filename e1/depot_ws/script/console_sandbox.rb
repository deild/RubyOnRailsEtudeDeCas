#!/Users/dave/ruby1.8/bin/ruby
#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
ActiveRecord::Base.lock_mutex
ActiveRecord::Base.connection.begin_db_transaction
at_exit do
  ActiveRecord::Base.connection.rollback_db_transaction
  ActiveRecord::Base.unlock_mutex
end
