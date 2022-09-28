class SessionsController < ApplicationController
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
    else
      flash[:error] = "Login Failed"
    end
    redirect_to "/sessions/new"
  end
end