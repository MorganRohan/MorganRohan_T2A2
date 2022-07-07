class Order < ApplicationRecord
  # Only an authenticated user can make an order and an order can only occur when there is a listing to purchase
  # Therefore, and order belongs to a listing, a buyer and a seller 
  belongs_to :listing
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "Account"
  belongs_to :seller, foreign_key: "seller_id", class_name: "Account"
end
