class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def edit
    @user = current_user

  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice]="アカウントの情報を更新しました"
      redirect_to :users_profile
    else
      flash[:alert]="更新に失敗しました"
      render "profile/edit"
    end
  end

  private
    def user_params
      params.require(:user).permit(:image, :username, :introduction)
    end
end
