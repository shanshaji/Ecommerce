class CreateCartLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_line_items do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :quantity

      t.timestamps
    end
  end
end
