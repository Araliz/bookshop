class CreateShippingTypes < ActiveRecord::Migration
  def change
    create_table :shipping_types do |t|
      t.string :name
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
