class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update]
  def show
   
  end
  def edit
    
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "user was successfully updated"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "user was failed to update"
      render :edit
    end
  end


  private

  def user_params
    params.require(:restaurant).permit(:name, :intro, :avatar)  
  end

  def set_user
    @user = User.find(params[:id])
  end
end
