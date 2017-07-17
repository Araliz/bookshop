class AddPublicationdateLenguageToBooks < ActiveRecord::Migration
  def change
    add_column :books, :publication_date, :string
    add_column :books, :language, :string
  end
end
