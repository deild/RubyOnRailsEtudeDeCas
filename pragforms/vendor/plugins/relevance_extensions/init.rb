#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
# Include hook code here
begin
  Dir.new(File.join(File.dirname(__FILE__), 'lib')).each do |file|
    require(File.join(File.dirname(__FILE__), 'lib', file)) if /rb$/.match(file)
  end
rescue Exception => e
  
  puts e.inspect
  ActionController::Base.logger.fatal e if ActionController::Base.logger
end