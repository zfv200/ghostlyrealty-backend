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
    @search_hash = params
    @search_hash[:search][:description] = search_description_builder(@search_hash[:search])
    extant_search = Search.find_by(description: @search_hash[:search][:description])

    if extant_search && current_ghost
      return render :json => {:results=>extant_search.houses}
    else
      if current_ghost
        @search_hash[:search][:ghost_id] = current_ghost.id
        search = Search.create(search_params)
        results = search.search_properties(@search_hash[:search])
        search.houses = results
        return render :json => {:results=>search.houses, :search=>search}
      else
        search = Search.new
        results = search.search_properties(@search_hash[:search])
        render :json => {:results=>results, :search=>search}
      end
    end

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
