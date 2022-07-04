class SearchController < ApplicationController
  def index
    @query = Listing.ransack(params[:q])
    @listings = @query.result(distinct: true)
  end
end
