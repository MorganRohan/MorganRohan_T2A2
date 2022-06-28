class Listing < ApplicationRecord
  belongs_to :account
  belongs_to :category
  has_rich_text :description
end
