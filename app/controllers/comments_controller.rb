class CommentsController < ApplicationRecord
  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
