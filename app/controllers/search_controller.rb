class SearchController < ApplicationController
  # Define method used by search to query database 
  # Ransack gem has been used 
  def index
    @query = Listing.ransack(params[:q])
    @listings = @query.result(distinct: true)
  end
end
