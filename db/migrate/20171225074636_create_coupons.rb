class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :discount
      t.datetime :expiry_date

      t.timestamps
    end
  end
end
