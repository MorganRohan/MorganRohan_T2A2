class AddAuthorToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :author, :string
  end
end
