class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :cart_id
      t.integer :status
      t.datetime :estimated_delivery
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
