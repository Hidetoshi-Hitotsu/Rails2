class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(reservation_params[:room_id])
    
    if @reservation.invalid?
      flash[:alert] = "予約情報に誤りがあります"
      redirect_to room_path(@room)
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(reservation_params[:room_id])
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      # 予約一覧ページに飛ぶ
      redirect_to reservation_own_path
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice]="予約の情報を更新しました"
      redirect_to reservation_own_path
    else
      flash[:alert]="予約情報に誤りがあります"
      render "edit"
    end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    # 予約一覧ページに戻る
    redirect_to reservation_own_path
  end

  def own
    @reservations = current_user.reservations.order(:created_at)
  end


  private
    def reservation_params
      params.require(:reservation).permit(:checkin, :checkout, :number, :room_id, :user_id)
    end

end
