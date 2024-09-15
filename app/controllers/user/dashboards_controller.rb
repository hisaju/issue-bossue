class User::DashboardsController < ApplicationController

  def index
    client = Octokit::Client.new(access_token: session[:token])
    @repos = client.repos
  end
end
