class Api::V1::GhostsController < ApplicationController
  #not a lot of the app is locked down, just stuff related to saved data 'n stuff
  # skip_before_action :authorized, only: [:create]
  before_action :authorized, only: [:profile]

  def index
    render json: Ghost.all
  end

  def profile
    render json: { ghost: GhostSerializer.new(current_ghost) }
  end

  def create
    @ghost = Ghost.create(ghost_params)
    if @ghost.valid?
      @token = encode_token(ghost_id: @ghost.id)
      render json: { ghost: GhostSerializer.new(@ghost) }, status: :created
    else
      render json: { error: 'ya failed' }, status: :not_acceptable
    end
  end

  private

  def ghost_params
    params.require(:ghost).permit(:username, :password, :age, :image_url)
  end

end
