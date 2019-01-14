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

end
