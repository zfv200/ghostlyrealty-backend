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

  def show
    @medium = Ghost.find(params[:id])
    @properties = @medium.properties.map { |house| HouseSerializer.new(house).as_json }
    render json: { medium: GhostSerializer.new(@medium), properties: @properties }
  end

  def featured
    featured_ghost = Ghost.all.find { |ghost| ghost.featured == true }
    render json: featured_ghost
  end

  def feature_medium
    featured_ghost = Ghost.all.find { |ghost| ghost.featured == true }
    new_featured = Ghost.find(params[:id])
    featured_ghost.update(featured: false)
    new_credits = CreditsMachine.change_credits(new_featured.credits, -10)
    new_featured.update(featured: true, credits: new_credits)
    @ghost = Ghost.find(params[:id])
    render json: @ghost
  end

  def profile
    render json: { ghost: GhostSerializer.new(current_ghost) }
  end

  def create
    @ghost = Ghost.new(ghost_params)
    @ghost.add_role(:agent) if params[:ghost][:medium] == "true"
    if @ghost.save
      @token = encode_token(ghost_id: @ghost.id)
      render json: { ghost: GhostSerializer.new(@ghost), jwt: @token, profile_picture: url_for(@ghost.profile_picture) }, status: :created
    else
      render json: { error: 'ya failed' }, status: :not_acceptable
    end
  end

  def update
    @medium = Ghost.find(params[:id])
    @medium.update(ghost_params)
    render json: @medium
  end

  private

  def ghost_params
    params.require(:ghost).permit(:username, :password, :age, :image, :motto, :credits, :profile_picture, :medium)
  end

end
