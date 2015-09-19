class ApplicationController < ActionController::Base

  private

  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Veuillez vous identifier"
      redirect_to(:controller => "login", :action => "login")
    end
  end
  
end
