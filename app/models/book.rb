class Book < ApplicationRecord
  validates :publisher, presence: true
  validates :title, presence: true
  validates :author_last_name, presence: true
  validates :author_first_name, presence: true
  validates :price, presence: true
end
