class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: { to_table: :accounts }
      t.references :seller, null: false, foreign_key: { to_table: :accounts }

      t.timestamps
    end
  end
end
