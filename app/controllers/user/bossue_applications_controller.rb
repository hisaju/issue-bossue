class User::BossueApplicationsController < User::BaseController
  before_action :set_bossue

  def create
    @bossue_application = @bossue.bossue_applications.new(user_id: current_user.id)
    if @bossue_application.save
      redirect_to [:user, @bossue]
    else
      render 'user/bossues/show'
    end
  end

  private

  def set_bossue
    @bossue = Bossue.find(params[:bossue_id])
  end
end
