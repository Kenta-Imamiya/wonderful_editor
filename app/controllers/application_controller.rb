class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
end

def index
end
