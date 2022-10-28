class UsersController < ApplicationController
  skip_before_action :is_logged_in

  def index
    if session[:current_user_id]
      if @user and @user.user_type == :customer
        redirect_to "/shop"
      else
        redirect_to "/shop"
      end
    else
      render "index"
    end
  end

  def new
    render "new"
  end

  def create
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      address: params[:address],
      email: params[:email],
      username: params[:username],
      password: params[:password],
    )

    if user.valid?
      flash[:info] = "Customer Signup Successful - #{user.email}"
    else
      flash[:error] = "Customer Signup Failed - #{user.errors.full_messages}"
      return render new_user_path, locals: {params: params}
    end
    redirect_to users_path
  end
end