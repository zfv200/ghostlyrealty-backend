class House < ApplicationRecord
  has_many :haunts
  has_many :ghosts, through: :haunts

  def self.featured
    House.select do |house|
      house.featured==true
    end
  end

  def typed_search_filter(value)
    self.name.downcase.include?(value)
  end

  def matches_search?(key, value)
    if key == "typedSearch"
      self.typed_search_filter(value)
    else
      self[key] == value
    end
  end

end
