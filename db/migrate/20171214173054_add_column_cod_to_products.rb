class AddColumnCodToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :cod_eligible, :boolean
  	add_column  :products, :image_url, :string
  end
end
