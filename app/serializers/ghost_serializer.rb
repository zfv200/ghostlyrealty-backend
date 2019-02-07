class GhostSerializer < ActiveModel::Serializer
  attributes :id, :username, :age, :image_url
  has_many :haunts
  has_many :houses, through: :haunts
  has_many :searches
end
