class ApplicationController < ActionController::Base
  before_action :is_logged_in

  def is_logged_in
    if session[:current_user_id]
      @user = User.find_by(id: session[:current_user_id])
    else
      redirect_to "/"
    end
  end
end
