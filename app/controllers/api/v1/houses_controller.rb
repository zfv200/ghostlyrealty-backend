class Api::V1::HousesController < ApplicationController

  def index
    render json: House.all
  end

  # custom
  def featured
    render json: House.featured
  end

  def create
    return render json: {error: "login as agent please!"} if !current_ghost || !current_ghost.roles.any? do |role| role.name == "agent" end
    @house = House.new(house_params)
    @house.medium = current_ghost
    response = nil
    if @house.save
      response = @house
    else
      response = {error: "house saving failed!!!"}
    end
    render json: response
  end

  private

  def house_params
    params.require(:house).permit(:address, :rooms, :solo_haunt, :image_url, :name, :featured, :burial_ground, :medium_id)
  end

end
