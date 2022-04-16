require 'rails_helper'

RSpec.describe 'api/books', type: :request do
  describe 'GET /api/books' do
    it 'renders a successful response' do
      create_list :book, 10
      get api_books_url
      expect(response).to be_successful
      res_object = JSON.parse response.body

      expect(res_object.size).to eq 10
    end
  end

  describe 'GET /api/books/create_list' do
    it 'renders a successful response' do
      post create_list_api_books_url, params: { books: [
          {
            publisher: Faker::Company.name,
            author_last_name: Faker::Name.last_name,
            author_first_name: Faker::Name.first_name,
            title: Faker::Book.title,
            price: rand(1.0..1000.0).round(2),
            editor_name: Faker::Name.name,
            title_collection: Faker::Book.title
          },
          {
            publisher: Faker::Company.name,
            author_last_name: Faker::Name.last_name,
            author_first_name: Faker::Name.first_name,
            title: Faker::Book.title,
            price: rand(1.0..1000.0).round(2),
            editor_name: Faker::Name.name,
            title_collection: Faker::Book.title
          }
        ]
      }
      expect(response).to be_successful
      res_object = JSON.parse response.body

      expect(res_object['success']).to eq true
      expect(Book.count).to eq 2
    end
  end

  describe 'GET /api/books/total_price' do
    it 'renders a successful response' do
      create_list :book, 10
      get total_price_api_books_url
      expect(response).to be_successful
      res_object = JSON.parse response.body

      expect(res_object['price']).to be > 0
    end
  end
end
