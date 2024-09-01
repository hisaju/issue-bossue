class SessionsController < ApplicationController
  def callback
    user_info = request.env['omniauth.auth']
    render plain: user_info.inspect
  end

  def create
    user_info = request.env['omniauth.auth']
    raise user_info # Your own session management should be placed here.
  end
end
