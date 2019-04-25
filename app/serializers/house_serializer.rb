class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :image_url, :featured, :burial_ground, :description, :new_family, :rooms, :solo_haunt

end
