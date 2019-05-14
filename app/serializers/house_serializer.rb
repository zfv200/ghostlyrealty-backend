class HouseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :address, :image_url, :featured, :burial_ground, :description, :new_family, :rooms, :solo_haunt, :images, :witch_friendly

  def images
    object.images.map do |image| image.service_url end
  end

end
