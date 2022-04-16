class AddAddTitleCollectionToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :title_collection, :string
    add_column :books, :editor_name, :string
  end
end
