class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @rooms = Room.all
    @rooms = Room.where('address LIKE ?',"%#{params[:area]}%",) if params[:area].present?
    @rooms = @rooms.where('introduction LIKE ?',"%#{params[:keyword]}%").or(@rooms.where('roomname LIKE ?',"%#{params[:keyword]}%")) if params[:keyword].present?
  end

  def new
    @room = Room.new

  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice]="施設の情報を登録しました"
      redirect_to room_path(@room)
    else
      flash[:alert]="施設の登録に失敗しました"
      render "rooms/new"
    end
  end

# 施設の詳細情報のページ
  def show
    if params[:id].present?
      @room = Room.find(params[:id])
      @reservation = Reservation.new
    else
      @room = Room.find(reservation_params[:room_id])
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice]="施設の情報を更新しました"
      redirect_to :room
    else
      flash[:alert]="更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to room_own_path

  end

  def own
    # @rooms = Room.where(user_id:current_user.id).includes(:rooms).order(:roomname)
    @rooms = current_user.rooms.order(:roomname)
  end

  private
    def room_params
      params.require(:room).permit(:roomname, :introduction, :image, :price, :address, :user_id)
    end
end