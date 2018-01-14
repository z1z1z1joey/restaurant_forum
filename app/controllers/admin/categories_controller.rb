class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_category, :only => [:create, :update, :destroy]

  def index
    @categories = Category.all

    if params[:id]
      set_category
    else
      @category = Category.new
    end
  end

  def create
    # set_category
    if @category.save
      flash[:notice] = "category was successfully created"
      redirect_to admin_categories_path

    else
      @categories = Category.all
      render :index
    end
  end

  def update
    # set_category
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "category was successfully updated"
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    # set_category
    @category.destroy
    flash[:alert] = "category was succssfully deleted"
    redirect_to admin_categories_path
  end
  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
