class User::BaseController < ApplicationController
  layout 'user'

  def github_client
    @github_client ||= Octokit::Client.new(access_token: session[:token])
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
