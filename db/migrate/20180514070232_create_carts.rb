class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :item_id
      t.float :user_id
      t.integer :quantity
      t.float :total_price
      t.timestamps
    end
  end
end
