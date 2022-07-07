class Listing < ApplicationRecord
  # Only an authenticated user can create listings - therefore listings belong to one and only one account
  belongs_to :account
  belongs_to :category
  # Fields within the listing required more than just a selection or plain text

  has_rich_text :description
  has_one_attached :picture

  # Conditions associated with numeric value for better user experience
  enum condition: {
    tattered_and_worn: 1,
    very_loved: 2, 
    a_little_loved: 3, 
    new_and_shiny: 4
  }
end
