class Search < ApplicationRecord
  belongs_to :ghost
  has_many :house_searches
  has_many :houses, through: :house_searches

  def search_agents(query)
    Ghost.agents.select do |agent|
      agent.username.downcase.include?(query)
    end
  end

  def search_houses(query)
    House.all.select do |house|
      house.name.downcase.include?(query)
    end
  end

  # def search_description_builder(query)
  #   description = "For Haunt: A"
  #   attributes = query.select { |k, v| v==true &&  k!= "complexSearch"}
  #   attributes.keys.each_with_index do |att, index|
  #     description += " #{att.split("_").join(" ")}"
  #     description += " with a" if index != attributes.keys.length - 1
  #   end
  #   description
  # end

  # TODO: refactor this and all helper methods in #search_properties(search_hash)

  def search_properties(search_hash)
    results = House.all
    search_hash.each do |key, value|
      if key != "complexSearch" && key != "description" && key != "ghost_id"
        results = results.select do |house|
          house.matches_search?(key, value)
        end
      end
    end
    results
  end

end
