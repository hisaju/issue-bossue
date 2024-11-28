class User::BossueApplicationsController < User::BaseController
  before_action :set_bossue

  def create
    @bossue_application = @bossue.bossue_applications.new(user: current_user)
    if @bossue_application.save
      redirect_to user_bossue_path(@bossue), notice: '募集項目を作成しました'
    else
      redirect_to user_bossue_path(@bossue), alert: '募集項目の作成に失敗しました'
    end
  end


  private

  def set_bossue
    @bossue = Bossue.find(params[:bossue_id])
  end
end
