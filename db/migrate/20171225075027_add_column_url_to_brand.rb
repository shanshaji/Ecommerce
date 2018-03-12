class AddColumnUrlToBrand < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :url, :string
  end
end
