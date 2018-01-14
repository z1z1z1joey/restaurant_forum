class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all     # 加上這一行
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
