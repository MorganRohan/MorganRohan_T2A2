class OrdersController < ApplicationController
  # Define before_action to ensure only authenticated users can purchase items
  before_action :authenticate_account!

  # Method to help redirect to success page view once order is successful
  def success
  end

  # Methods to show authenticated user their own bought and sold items (zero or many)
  def bought
    @bought_items = current_account.bought_orders
  end

  def sold
    @sold_items = current_account.sold_orders
  end
end
