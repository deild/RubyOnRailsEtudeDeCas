# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
module ActionView
  module Helpers
    class InstanceTag
      
      DEFAULT_TEXT_AREA_OPTIONS = { :rows => 5, :cols => 40 }
    end
  end 
end
class ApplicationController < ActionController::Base
end