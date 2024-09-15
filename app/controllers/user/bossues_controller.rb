class User::BossuesController < User::BaseController

  def index
  end

  def new
    @bossue = Bossue.new
    @repositories = github_client.repositories({}, per_page: 500).map{|repo| [repo.full_name, repo.id]}
  end

  def issues
    repo_id = params[:repo_id]
    issues = github_client.issues(repo_id.to_i, state: 'open', per_page: 500).map{|issue| {id: issue.id, title: issue.title}}
    render json: issues
  end

  def edit
  end

  def show
  end
end
