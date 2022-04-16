class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :publisher
      t.string :title
      t.string :author_last_name
      t.string :author_first_name
      t.float :price

      t.timestamps
    end
  end
end
