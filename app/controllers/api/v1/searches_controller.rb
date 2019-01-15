class Api::V1::SearchesController < ApplicationController
  # respond_to :json

  def search_site
    query = params[:search][:searchTerm]
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

    render :json => results
  end

end
