class ApplicationController < ActionController::Base

  def authorize_admin
    unless current_user.is_admin?
      flash[:error] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end
end
