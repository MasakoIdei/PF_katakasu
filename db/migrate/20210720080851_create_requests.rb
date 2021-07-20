class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer "customer_id", null: false
      t.text "request", null: false

      t.timestamps
    end
  end
end
