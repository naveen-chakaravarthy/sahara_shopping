class SessionsController < ApplicationController
  skip_before_action :is_logged_in
  # before_action :new, if: :is_logged_in_callback

  def index

  end

  def new
    render "new"
  end

  def create
    user = User.find_by(email: params[:email])

    if user.nil?
      flash[:error] = "User email not found"
      return redirect_to "/sessions/new"
    else
      is_valid = user.authenticate(params[:password])
    end


    if is_valid
      flash[:info] = "Login Successful"
      session[:current_user_id] = user.id
      if @user and @user.user_type == "customer"
        redirect_to "/shop"
      else
        redirect_to "/shop"
      end
    else
      flash[:error] = "Login Failed"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:info] = "Logout Successful"
    @current_user = nil
    redirect_to "/"
  end
end