class Search

  def search_agents(query)
    agents = Ghost.agents
    agents.select do |agent|
      agent.username.downcase.include?(query)
    end
  end

end
