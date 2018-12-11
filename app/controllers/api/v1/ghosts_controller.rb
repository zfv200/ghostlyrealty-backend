class Api::V1::GhostsController < ApplicationController

  def index
    render json: Ghost.all
  end

end
