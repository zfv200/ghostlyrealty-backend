class Api::V1::SearchesController < ApplicationController
  # respond_to :json

  def search_site
    if current_ghost
      byebug
    end
    query = params[:searchTerm]
    search = Search.new
    agents = search.search_agents(query)
    houses = search.search_houses(query)
    results = {:agents=>agents, :houses=>houses}
    render :json => {:agents=>agents, :houses=>houses}.to_json
  end

  def search_properties
    search_hash = params[:search]
    search = Search.new
    results = search.search_properties(search_hash)

    if current_ghost
      search.search_description_builder(search_hash)
    end

    render :json => results
  end

end
