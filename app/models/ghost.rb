class Ghost < ApplicationRecord
  has_many :haunts
  has_many :houses, through: :haunts
end
