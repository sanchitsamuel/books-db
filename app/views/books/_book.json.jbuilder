json.extract! book, :id, :publisher, :title, :author_last_name, :author_first_name, :price, :created_at, :updated_at
json.url book_url(book, format: :json)
