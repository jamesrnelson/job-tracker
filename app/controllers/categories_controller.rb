class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash.notice = "Category '#{@category.title}' was created."
      redirect_to category_path(@category)
    else
      flash.notice = 'Category was NOT created. Please do not leave any fields blank or duplicate a previously existing category.'
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash.notice = "Category '#{@category.title}' was updated."
      redirect_to category_path(@category)
    else
      flash.notice = 'Category was NOT updated. Please do not leave any fields blank or duplicate a previously existing category.'
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
