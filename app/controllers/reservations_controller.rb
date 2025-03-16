class ReservationsController < ApplicationController

  def index
    @user = current_user
    @reservations = @user.reservations.includes(:room)
  end

  def new
  end

  def confirm
		@reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
	end

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :number_people, :room_id, :user_id)
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :number_people, :room_id, :user_id))
      if @reservation.save && !params[:back]
        flash[:notice] = "新規投稿をしました"
        redirect_to :reservations
      else
        @room = Room.find_by(params[:reservation][:room_id])
        @reservation = Reservation.new(reservation_params)
        render  "rooms/show"
      end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :reservations
  end

end
