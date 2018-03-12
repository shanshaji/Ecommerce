class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :product_id
      t.float :rating

      t.timestamps
    end
  end
end
