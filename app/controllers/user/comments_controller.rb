class User::CommentsController < User::BaseController
  before_action :set_bossue

  def create
    @comment = @bossue.comments.new(comment_params)
    if @comment.save
      redirect_to user_bossue_path(@bossue), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  private

  def set_bossue
    @bossue = current_user.bossues.find(params[:bossue_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
