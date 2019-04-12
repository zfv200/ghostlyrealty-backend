class Api::V1::HauntsController < ApplicationController

  def create_or_destroy
    if request.headers["type"] == "create"
      create_haunt
    else
      destroy_haunt
    end
  end

  def create_haunt
    @haunt = Haunt.new(haunt_params)
    if @haunt.save
      render json: @haunt.house
    else
      render json: { error: 'ya failed to save' }, status: :not_acceptable
    end
  end

  def destroy_haunt
    @haunt = Haunt.find_by(haunt_params)
    id = @haunt.house.id
    @haunt.destroy
    render json: { id: id }
  end

  private

  def haunt_params
    params.require(:haunt).permit(:ghost_id, :house_id)
  end

end
