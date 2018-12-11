class GhostSerializer < ActiveModel::Serializer
  attributes :id, :username, :age
  has_many :haunts
  has_many :houses, through: :haunts
end
