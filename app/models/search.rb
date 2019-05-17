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

  def check_blank_search(term)
    term == "" ? true : false
  end

  def flexible_search(search_hash)
    results = House.all
    search_hash.each do |key, value|
      if key != "complexSearch" && key != "description" && key != "ghost_id" && key != "id" && key != "typedSearch" && key != "exact_search"
        if value == true
          results = results.select do |house|
            house[key] == value
          end
        end
      end
    end
    results
  end

  def search_properties(search_hash)
    results = House.all
    search_hash.each do |key, value|
      if key != "complexSearch" && key != "description" && key != "ghost_id" && key != "id" && key != "typedSearch" && key != "exact_search"
        results = results.select do |house|
          house.matches_search?(key, value)
        end
      end
    end
    results
  end

end
