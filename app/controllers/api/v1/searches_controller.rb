class Api::V1::SearchesController < ApplicationController
  # respond_to :json

  def search_site
    query = params[:searchTerm]
    search = Search.new
    if search.check_blank_search(params[:searchTerm])
      return render :json => {:houses=> House.all}.to_json
    end
    agents = search.search_agents(query)
    houses = search.search_houses(query)
    results = {:agents=>agents, :houses=>houses}
    render :json => results.to_json
  end

  def search_properties
    @search_hash = params
    @search_hash[:search][:description] = search_description_builder(@search_hash[:search])

    if current_ghost
      extant_search = Search.find_by(description: @search_hash[:search][:description], ghost_id: current_ghost.id)
      if extant_search
        extant_search.houses = extant_search.search_properties(extant_search.attributes)
        return render :json => {:results=>extant_search.houses}
      else
        @search_hash[:search][:ghost_id] = current_ghost.id
        search = Search.create(search_params)
        results = search.search_properties(@search_hash[:search])
        search.houses = results
        return render :json => {:results=>search.houses, :search=>search}
      end
      #if there's a current_ghost, check for extant_search for them
      #if it exists, update it and return results
      #if it doesn't, create it and return results, then check frontend
    else
      search = Search.new
      results = search.search_properties(@search_hash[:search])
      render :json => {:results=>results, :search=>search}
      #otherwise they don't need to have a search saved, they just get the results
    end
  end

  def recent_search
    #update results here even if it's a recent search
    #because we want to preserve the potential for the data here
    search = Search.find_by(description: params[:description])
    search.houses = search.search_properties(search.attributes)
    render :json => {:results => search.houses}
  end

  private

  def search_description_builder(query)
    description = "For Haunt: A"
    attributes = query.select { |k, v| v==true &&  k!= "complexSearch"}
    attributes.keys.each_with_index do |att, index|
      description += " #{att.split("_").join(" ")}"
      description += " with a" if index != attributes.keys.length - 1
    end
    description
  end

  def search_params
    @search_hash.require(:search).permit(:typedSearch, :solo_haunt, :burial_ground, :complexSearch, :description, :ghost_id)
  end

end
