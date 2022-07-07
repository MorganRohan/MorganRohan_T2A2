class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Note: only default devise modules used for this application
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # A user will only need to create a single account
  # With this single account, the user can have zero to many listings, bought orders and sold orders
  has_many :listings
  has_many :sold_orders, foreign_key: "seller_id", class_name: "Order"
  has_many :bought_orders, foreign_key: "buyer_id", class_name: "Order"
end
