class Api::V1::HousesController < ApplicationController

  def index
    render json: House.all
  end

  # custom
  def featured
    render json: House.featured
  end

end
