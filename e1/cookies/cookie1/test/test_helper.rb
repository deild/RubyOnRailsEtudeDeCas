#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
ENV["RAILS_ENV"] = "test"
require File.dirname(__FILE__) + "/../config/environment"
require 'application'

require 'test/unit'
require 'active_record/fixtures'
require 'action_controller/test_process'
require 'action_web_service/test_invoke'
require 'breakpoint'

def create_fixtures(*table_names)
  Fixtures.create_fixtures(File.dirname(__FILE__) + "/fixtures", table_names)
end

Test::Unit::TestCase.fixture_path = File.dirname(__FILE__) + "/fixtures/"
