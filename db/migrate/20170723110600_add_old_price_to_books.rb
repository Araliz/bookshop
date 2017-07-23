class AddOldPriceToBooks < ActiveRecord::Migration
  def change
    add_column :books, :old_price, :decimal
  end
end
