class AddColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :cover, :string
    remove_column :products, :image_url
  end
end
