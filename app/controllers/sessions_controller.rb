class SessionsController < ApplicationController
  # ソーシャルログイン処理
  def create
    auth = request.env['omniauth.auth']
    if user = User.from_omni_auth(auth)
      session[:user_id] = user.id
      session[:token] = auth['credentials']['token']
      redirect_to root_path, notice: 'ログインしました'
    else
      flash[:alert] = 'ログインに失敗しました'
      redirect_to tops_path
    end
  end  

end
