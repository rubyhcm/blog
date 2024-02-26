# frozen_string_literal: true

# It handles authorization for admin users
class ApplicationController < ActionController::Base
  def authorize_admin
    return if current_user.is_admin?

    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end
end
