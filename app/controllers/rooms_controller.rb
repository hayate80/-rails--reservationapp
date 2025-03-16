class RoomsController < ApplicationController

  def index
    @user = current_user
    @rooms = @user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_detail, :price, :address, :user_id, :room_img))
    if @room.save
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :room_detail, :price, :address, :user_id, :room_img))
      flash[:notice] = "ユーザーIDが「#{@room.id}」の情報を更新しました"
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :rooms
  end
  
end


