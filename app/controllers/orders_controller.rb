class OrdersController < ApplicationController
  before_action :authenticate_account!
  def success
  end

  def bought
    @bought_items = current_account.bought_orders
  end

  def sold
    @sold_items = current_account.sold_orders
  end
end
