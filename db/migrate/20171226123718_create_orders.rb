class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.date :order_date
      t.integer :user_id
      t.integer :address_id
      t.float :total
      t.boolean :is_delivered, default: false

      t.timestamps
    end
  end
end
