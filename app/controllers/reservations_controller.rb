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
    if @reservation.invalid?
      @room = Room.find_by(params[:reservation][:room_id])
      render  "rooms/show"
    end
  end

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :number_people, :room_id, :user_id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
      if @reservation.save && !params[:back]
        flash[:notice] = "施設の予約が完了しました"
        redirect_to :reservations
      else
        @room = Room.find_by(params[:reservation][:room_id])
        render  "rooms/show"
      end
  end

  def show
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def edit_confirm
		@reservation = Reservation.find(params[:id])
    @reservation.attributes = reservation_params
    @room = Room.find(@reservation.room_id)
    if @reservation.invalid?
      @room = Room.find_by(params[:reservation][:room_id])
      render  "edit"
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice] = "施設の予約情報を更新しました"
      redirect_to :reservations
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約情報を削除しました"
    redirect_to :reservations
  end

end
