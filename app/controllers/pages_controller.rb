class PagesController < ApplicationController
  # Use simple methods that correspond with the Views
  # The home page is used as the view through which all other functions can be accessed
  # and performed by their corresponding controllers
  def home
  end

  # Separate pages and methods created for the "help page" resources since 
  # these are displaying information that is hard coded in the view 
  def help
  end

  def guide
  end

  def sitemap
  end
end
