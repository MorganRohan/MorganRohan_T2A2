class Listing < ApplicationRecord
  belongs_to :account
  belongs_to :category
  has_rich_text :description

  enum condition: {
    tattered_and_worn: 1,
    very_loved: 2, 
    a_little_loved: 3, 
    new_and_shiny: 4
  }
end
