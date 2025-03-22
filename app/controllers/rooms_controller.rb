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
      flash[:notice] = "施設が作成されました"
      redirect_to room_path(@room.id)
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
      flash[:notice] = "施設情報が変更されました"
      redirect_to room_path(@room.id)
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設情報を削除しました"
    redirect_to :rooms
  end
end


