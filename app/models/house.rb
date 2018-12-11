class House < ApplicationRecord
  has_many :haunts
  has_many :ghosts, through: :haunts
end
