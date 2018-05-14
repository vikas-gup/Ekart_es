class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.string :price
      t.integer :category_id

      t.timestamps
    end
  end
end
