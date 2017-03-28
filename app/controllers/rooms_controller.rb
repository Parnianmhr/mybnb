class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    # @rooms = Room.all
    @rooms = current_user.rooms
  end

  def show
    @themes = @room.themes
    @photo = @room.photos
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      image_params.each do |image|
        @room.photos.create(image: image)
      end

      redirect_to @room, notice: "Room successfully created"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @room.user.id
      @photos = @room.photos
    else
      redirect_to rooms_path, notice: "You don't have permission to edit this room."
    end
  end

  def update
    if @room.update(room_params)
      image_params.each do |image|
        @room.photos.create(image: image)
      end

      redirect_to rooms_path(@room), notice: "Room successfully updated"
    else
      render :edit
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def image_params
      params[:images].present? ? params.require(:images) :[]
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bedroom_count, :bathroom_count, :listing_name, :description, :address, :has_tv, :has_kitchen, :has_airco, :has_heating, :has_internet, :price, :active, theme_ids: [])
    end
end
