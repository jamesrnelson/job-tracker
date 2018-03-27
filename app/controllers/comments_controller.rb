class CommentsController < ApplicationRecord
  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "You created a comment for #{@job.name}"
      redirect_to company_job_path(params[:company_id], @job)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
