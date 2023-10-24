module Api::V1
  class BaseApiController < ApplicationController
    def current_user
      @current_user ||= User.first
    end
  end
end
