class Api::V1::AuthController < ApplicationController
  # skip_before_action :authoried, only: [:create]

  def create
    @ghost = Ghost.find_by(username: ghost_login_params[:username])
    if @ghost && @ghost.authenticate(ghost_login_params[:password])
      token = encode_token({ ghost_id: @ghost.id })
      render json: { ghost: GhostSerializer.new(@ghost), jwt: token }, status: :accepted
      #user data in redux, token client side
    else
      render json: { message: 'Bad ghost credentials!' }, status: :unauthorized
    end
  end

  private

  def ghost_login_params
    params.require(:ghost).permit(:username, :password)
  end

end
