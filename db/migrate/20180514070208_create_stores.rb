class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :item_id
      t.integer :pieces_remaining

      t.timestamps
    end
  end
end
