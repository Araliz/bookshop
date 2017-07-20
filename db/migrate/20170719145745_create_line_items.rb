class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :book, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price
      t.string :item_name

      t.timestamps null: false
    end
  end
end
