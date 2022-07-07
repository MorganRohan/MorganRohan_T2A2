class SearchController < ApplicationController
  # Define method used by search to query database 
  def index
    @query = Listing.ransack(params[:q])
    @listings = @query.result(distinct: true)
  end
end
