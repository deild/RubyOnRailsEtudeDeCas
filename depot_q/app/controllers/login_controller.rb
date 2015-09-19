#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---


class LoginController < ApplicationController


before_filter :authorize, :except => :login
# . . 



  layout "admin"


  
  def index
    @total_orders = Order.count
  end
  

  # just display the form and wait for user to
  # enter a name and password
  
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:action => "index")
      else
        flash[:notice] = "Invalid user/password combination"
      end
    end
  end
  

  
  def add_user
    @user = User.new(params[:user])
    if request.post? and @user.save
      flash.now[:notice] = "User #{@user.name} created"
      @user = User.new
    end
  end

  # . . .
  

  
  def delete_user
    if request.post?
      user = User.find(params[:id])
      begin
        user.destroy
        flash[:notice] = "User #{user.name} deleted"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_users)
  end
  

  
  def list_users
    @all_users = User.find(:all)
  end
  
  
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end
  

end
