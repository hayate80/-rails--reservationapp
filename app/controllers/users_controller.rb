class UsersController < ApplicationController
  def index
  end

  def account
  end

  def profile
  end

  def new
  end


  def create
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :icon_img, :introduction))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users_profile
    else
      render "edit"
    end
  end

  def destroy
  end
end
