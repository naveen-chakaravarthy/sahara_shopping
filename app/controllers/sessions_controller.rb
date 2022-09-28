class SessionsController < ApplicationController
  skip_before_action :is_logged_in
  def new
    if session[:current_user_id]
      redirect_to "/shop"
    else
      render "new"
    end

  end

  def index
    if session[:current_user_id]
      redirect_to "/shop"
    else
      render "index"
    end
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
      redirect_to "/shop"
    else
      flash[:error] = "Login Failed"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end