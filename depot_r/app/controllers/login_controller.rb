#START:authorize
#START:layout
class LoginController < ApplicationController
#END:layout

  #START:filter
  before_filter :authorize, :except => :login
  #END:filter
  # . . 
#END:authorize
#START:layout

  layout "admin"
#END:layout

  #START:index
  def index
    @total_orders = Order.count
  end
  #END:index

  # just display the form and wait for user to
  # enter a name and password
  #START:login
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:action => "index")
      else
        flash[:notice] = "Couple utilisateur / mot de passe invalide"
      end
    end
  end
  #END:login

  #START:add_user
  def add_user
    @user = User.new(params[:user])
    if request.post? and @user.save
      flash.now[:notice] = "Création de l'utilisateur #{@user.name} effectuée."
      @user = User.new
    end
  end

  # . . .
  #END:add_user

  #START:delete_user
  def delete_user
    if request.post?
      user = User.find(params[:id])
      begin
        user.destroy
        flash[:notice] = "Supression de l'utilisateur #{user.name} effectuée."
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_users)
  end
  #END:delete_user

  #START:list_users
  def list_users
    @all_users = User.find(:all)
  end
  #END:list_users
  
  #START:logout
  def logout
    session[:user_id] = nil
    flash[:notice] = "Déconnection"
    redirect_to(:action => "login")
  end
  #END:logout

end
