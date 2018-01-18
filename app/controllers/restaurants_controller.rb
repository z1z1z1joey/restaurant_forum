class RestaurantsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all     # 加上這一行
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end
end
