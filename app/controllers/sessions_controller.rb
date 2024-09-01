class SessionsController < ApplicationController
  def callback
    user_info = request.env['omniauth.auth']
    if user = User.from_omniauth(user_info)
      session[:user_id] = user.id
      session[:token] = user_info['credentials']['token']
      redirect_to user_root_path
    else
      flash[:notice] = "ログインに失敗しました。"
      redirect_to tops_path
    end

  end
end
