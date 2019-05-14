class Api::V1::SearchesController < ApplicationController
  # respond_to :json
  def serialize(houses)
    houses.map { |house| HouseSerializer.new(house).as_json }
  end

  def search_site
    query = params[:searchTerm]
    search = Search.new
    if search.check_blank_search(params[:searchTerm])
      results = serialize(House.all)
      return render :json => {:houses=> results}
    end
    agents = search.search_agents(query)
    houses = search.search_houses(query)
    house_results = serialize(houses)
    # results = {:agents=>agents, :houses=>house_results}
    render :json => {:agents=>agents, :houses=>house_results}
  end


  def search_properties
    @search_hash = params
    @search_hash[:search][:description] = search_description_builder(@search_hash[:search])

    if current_ghost
      if !params[:search][:exact_search]
        self.flexible_query(@search_hash)
      else
        extant_search = Search.find_by(description: @search_hash[:search][:description], ghost_id: current_ghost.id)
        if extant_search
          extant_search.houses = extant_search.search_properties(extant_search.attributes)
          house_results = serialize(extant_search.houses)
          return render :json => {:results=>house_results}
        else
          @search_hash[:search][:ghost_id] = current_ghost.id
          search = Search.create(search_params)
          results = search.search_properties(@search_hash[:search])
          search.houses = results
          house_results = serialize(search.houses)
          return render :json => {:results=>house_results, :search=>search}
        end
      end
      #if there's a current_ghost, check for extant_search for them
      #if it exists, update it and return results
      #if it doesn't, create it and return results, then check frontend
    else
      search = Search.new
      results = search.search_properties(@search_hash[:search])
      house_results = serialize(results)
      render :json => {:results=>house_results, :search=>search}
      #otherwise they don't need to have a search saved, they just get the results
    end
  end

  def flexible_query(search_hash)
    search = Search.new
    search.houses = search.flexible_search(search_hash[:search])
    @houses = serialize(search.houses)
    render :json => {:results => @houses}
  end

  def recent_search
    #update results here even if it's a recent search
    #because we want to preserve the potential for the data here
    search = Search.find_by(description: params[:description])
    search.houses = search.search_properties(search.attributes)
    @houses = serialize(search.houses)
    render :json => {:results => @houses}
  end

  private

  def search_description_builder(query)
    description = "For Haunt: A"
    description_end = ""
    attributes = query.select { |k, v| v==true &&  k!= "complexSearch"}
    attributes.keys.each_with_index do |att, index|
      if att == "witch_friendly"
        description_end = ", witch friendly"
      else
        description += " #{att.split("_").join(" ")}"
        description += " with a" if index != attributes.keys.length - 1
      end
    end
    description = description.slice(0, description.length - 7) if description.slice(description.length-7, description.length) == " with a"
    description += description_end
    description
  end

  def search_params
    @search_hash.require(:search).permit(:typedSearch, :solo_haunt, :burial_ground, :complexSearch, :description, :ghost_id)
  end

end
