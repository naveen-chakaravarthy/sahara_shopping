class UsersController < ApplicationController
  skip_before_action :is_logged_in
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
    redirect_to new_session_path
  end
end