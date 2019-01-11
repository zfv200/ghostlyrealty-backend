class Api::V1::SearchesController < ApplicationController

  def search_site
    query = params[:search][:searchTerm]
    search = Search.new
    render :json => search.search_agents(query)
  end

end
