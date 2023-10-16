class Api::V1::BaseApiController < ApplicationController
  # before_action :authenticate_user!

  # session[:user_id] = 1

  # def current_user
  #   current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   render json: current_user, serializer: Api::V1::ArticleDetailSerializer
  # end
end
