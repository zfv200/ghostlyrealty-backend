class GhostSerializer < ActiveModel::Serializer
  attributes :id, :username, :age, :image, :roles, :motto, :credits, :featured
  has_many :haunts
  has_many :houses, through: :haunts
  has_many :searches
  has_many :properties
end
