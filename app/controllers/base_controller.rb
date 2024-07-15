# frozen_string_literal: true

# It inherits from ActionController::API
class BaseController < ActionController::API
  # def authorize_admin
  #   return if current_user.is_admin?

  #   render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden
  # end
end
