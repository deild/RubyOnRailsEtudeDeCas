#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---


class BlogController < ApplicationController


  around_filter :time_an_action



  around_filter do |controller, action|
    started = Time.now
    action.call
    elapsed = Time.now - started
    controller.logger.info("#{controller.action_name} took #{elapsed} seconds")
  end     


  class TimingFilter
    def filter(controller)
      started = Time.now
      yield
      elapsed = Time.now - started
      controller.logger.info("#{controller.action_name} took #{elapsed} seconds")
    end
  end
  
  around_filter TimingFilter.new


  def index
    # ...
    render :text => "hello"
  end
  
  def bye
    # ...
    render :text => "goodbye"
  end
  
  private
  
  def time_an_action
    started = Time.now
    yield                
    elapsed = Time.now - started
    logger.info("#{action_name} took #{elapsed} seconds")
  end


end


