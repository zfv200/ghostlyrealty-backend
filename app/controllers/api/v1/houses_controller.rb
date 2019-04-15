class Api::V1::HousesController < ApplicationController

  def index
    render json: House.all
  end

  # custom
  def featured
    render json: House.featured, serializer: nil
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

  def update
    @house = House.find(params[:id])
    status = feature_charge_status(@house)
    if status == "success"
      @house.update(house_params)
      render json: @house
    else
      render json: {error: "no more credits!"}
    end
  end

  def feature_charge_status(house)
    if !!params["featured"]
      medium = house.medium
      if medium.credits == 0
        "fail"
      else
        medium.update(credits: medium.credits - 1)
        "success"
      end
    else
      "success"
    end
  end

  private

  def house_params
    params.require(:house).permit(:address, :rooms, :solo_haunt, :image_url, :name, :featured, :burial_ground, :medium_id)
  end

end
