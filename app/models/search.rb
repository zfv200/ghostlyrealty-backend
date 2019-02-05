class Search < ApplicationRecord
  belongs_to :ghost

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

  def search_description_builder(query)
    let description = "For Haunt: "
    # TODO: write out the rest of this
    byebug
  end

  # TODO: refactor this and all helper methods in #search_properties(search_hash)

  def search_properties(search_hash)
    results = House.all
    search_hash.each do |key, value|
      if key != "complexSearch"
        results = results.select do |house|
          house.matches_search?(key, value)
        end
      end
    end
    results
  end

end
