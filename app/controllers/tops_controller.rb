class TopsController < ApplicationController
  def index
    @reservation = Reservation.new
  end

  def search
    if params[:address_keyword].present? && params[:keyword].present?
      @rooms = Room.where("address like ? ","%#{params[:address_keyword]}%").where("room_detail like ? OR room_name like ? ", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    elsif params[:address_keyword].present?
      @rooms = Room.where("address like ? ","%#{params[:address_keyword]}%")
    elsif params[:keyword].present?
      @rooms = Room.where("room_detail like ? OR room_name like ? ", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    else
      @rooms = Room.all
    end
  end
end
