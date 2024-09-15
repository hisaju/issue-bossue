class User::BossuesController < User::BaseController

  before_action :set_bossue, only: [:edit, :show, :update]

  def index
  end

  def new
    @bossue = current_user.bossues.new
    @repositories = github_client.repositories({}, per_page: 500).map{|repo| [repo.full_name, repo.id]}
  end

  def issues
    repo_id = params[:repo_id]
    issues = github_client.issues(repo_id.to_i, state: 'open', per_page: 500).map{|issue| {number: issue.number, title: issue.title}}
    render json: issues
  end

  def issue
    repo_id = params[:repo_id]
    issue_number = params[:issue_number]
    issue = github_client.issue(repo_id.to_i, issue_number.to_i)
    render json: {title: issue.title, body: issue.body}
  end

  def edit; end

  def show; end

  def create
    @bossue = current_user.bossues.new(bossue_params)
    if @bossue.save
      redirect_to user_bossues_path
    else
      render :new
    end
  end

  def update
    if @bossue.update(bossue_params)
      redirect_to user_bossues_path
    else
      render :edit
    end
  end

  private

  def set_bossue
    @bossue = current_user.bossues.find(params[:id])
  end

  def bossue_params
    params.require(:bossue).permit(:title, :content, :issue_number, :repository_id)
  end
end
