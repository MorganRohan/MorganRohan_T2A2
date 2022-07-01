class OrdersController < ApplicationController
  def success
  end

  def bought
    @bought_items = current_account.bought_orders
  end

  def sold
    @sold_items = current_account.sold_orders
  end
end
