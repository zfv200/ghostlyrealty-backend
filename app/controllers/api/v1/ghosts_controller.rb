class Api::V1::GhostsController < ApplicationController
  #not a lot of the app is locked down, just stuff related to saved data 'n stuff
  # skip_before_action :authorized, only: [:create]
  before_action :authorized, only: [:profile]

  def index
    if request.headers[:type]
      render json: Ghost.agents
    else
      render json: Ghost.all
    end
  end

  def featured
    featured_ghost = Ghost.all.find { |ghost| ghost.featured == true }
    render json: featured_ghost
  end

  def profile
    render json: { ghost: GhostSerializer.new(current_ghost) }
  end

  def create
    @ghost = Ghost.create(ghost_params)
    @ghost.add_role(:agent) if params[:medium]
    if @ghost.valid?
      @token = encode_token(ghost_id: @ghost.id)
      render json: { ghost: GhostSerializer.new(@ghost), jwt: @token }, status: :created
    else
      render json: { error: 'ya failed' }, status: :not_acceptable
    end
  end

  private

  def ghost_params
    params.require(:ghost).permit(:username, :password, :age, :image, :motto)
  end

end
