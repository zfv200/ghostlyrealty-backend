class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :image_url
end
