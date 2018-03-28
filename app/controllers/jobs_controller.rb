class JobsController < ApplicationController
  def index
    if params[:sort] == "location"
      @jobs = Job.all.order(:city)
    elsif params[:sort] == "interest"
      @jobs = Job.all.order(level_of_interest: :desc)
    elsif params[:location]
      @jobs = Job.jobs_in_city(params[:location])
    else
      @jobs = Job.all
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
  end

  def update
    @job = Job.find(params[:id])
    @company = @job.company
    @job.update(job_params)
    if @job.save
      flash.notice = "Job '#{@job.title}' was updated."
      redirect_to company_job_path(@company, @job)
    else
      flash.notice = 'Job was NOT updated. Please do not leave any fields blank.'
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    company = job.company
    job.destroy

    redirect_to company_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :location)
  end
end
