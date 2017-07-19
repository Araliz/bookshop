class AddIndexToBooksCategoryId < ActiveRecord::Migration
  def change
    add_index(:books, :category_id, name: 'index_books_on_category_id')
  end
end
