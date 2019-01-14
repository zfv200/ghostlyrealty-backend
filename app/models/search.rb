class Search

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

end
