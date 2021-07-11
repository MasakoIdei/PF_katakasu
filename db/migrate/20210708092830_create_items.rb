class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :image
      t.string :item_sieze, null: false
      t.text :introduction, null: false
      t.integer :item_price, null: false
      t.integer :item_stock, null: false

      t.timestamps
    end
  end
end
