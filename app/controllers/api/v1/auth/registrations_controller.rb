module Api::V1
  class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

    private

    def sign_up_params
      params.permit(:email, :password, :password_confirmation)
    end
  end
end
