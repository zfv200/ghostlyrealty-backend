class House < ApplicationRecord
  has_many :haunts
  has_many :ghosts, through: :haunts
  has_many :house_searches
  has_many :searches, through: :house_searches
  belongs_to :medium, :class_name => 'Ghost'

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
