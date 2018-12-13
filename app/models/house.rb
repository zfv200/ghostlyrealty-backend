class House < ApplicationRecord
  has_many :haunts
  has_many :ghosts, through: :haunts

  def self.featured
    House.select do |house|
      house.featured==true
    end
  end
end
