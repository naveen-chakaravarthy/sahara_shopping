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
    user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )

    flash[:info] = "Customer Signup Successful - #{user.id}. #{user.email}"
    redirect_to users_path
  end
end