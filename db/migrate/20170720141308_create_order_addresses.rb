class CreateOrderAddresses < ActiveRecord::Migration
  def change
    create_table :order_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :zip_code
      t.string :street
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
