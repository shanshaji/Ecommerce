class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

    	t.string :name
    	t.float :price
    	t.text :description
    	t.integer :category_id
    	t.integer :stock

    	t.timestamps
    end
  end
end
