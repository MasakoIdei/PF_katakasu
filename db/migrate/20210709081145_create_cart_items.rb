class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer "customer_id", null: false
      t.integer "item_id", null: false
      t.integer "quantity", null: false
      t.index ["customer_id", "item_id"], name: "index_cart_items_on_customer_id_and_item_id", unique: true

      t.timestamps
    end
  end
end
