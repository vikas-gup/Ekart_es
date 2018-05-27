class CreateItemCartMapping < ActiveRecord::Migration
  def up
    create_table :item_cart_mappings do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :item_quantity
      t.timestamps
    end
    remove_column :carts, :item_id, :integer
  end

  def down
  end
end
