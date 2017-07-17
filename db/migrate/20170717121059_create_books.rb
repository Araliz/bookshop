class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.decimal :price
      t.text :description
      t.string :publisher
      t.references :category
      t.string :cover

      t.timestamps null: false
    end
  end
end
