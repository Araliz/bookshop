class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :zip_code
      t.string :street
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
