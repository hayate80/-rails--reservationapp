class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_detail, :price, :address))
    if @room.save
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :room_detail, :price, :address))
      flash[:notice] = "ユーザーIDが「#{@room.id}」の情報を更新しました"
      redirect_to :users_profile
    else
      render "edit"
    end
  end

  def destroy
  end
  
end


