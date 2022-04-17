class AddVolumnToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :volumn, :integer, default: 1
    add_column :books, :issue, :date, default: Date.today
  end
end
