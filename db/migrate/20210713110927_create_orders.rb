class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer "customer_id", null: false
      t.integer "pay_method", default: 0, null: false
      t.integer "time_select", default: 0, null: false

      t.timestamps
    end
  end
end
