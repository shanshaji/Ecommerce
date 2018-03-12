class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :details
      t.string :street
      t.string :landmark
      t.string :state
      t.string :city
      t.string :pincode
      t.integer :user_id

      t.timestamps
    end
  end
end
