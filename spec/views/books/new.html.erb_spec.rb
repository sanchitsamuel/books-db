require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      publisher: "MyString",
      title: "MyString",
      author_last_name: "MyString",
      author_first_name: "MyString",
      price: 1.5
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[publisher]"

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[author_last_name]"

      assert_select "input[name=?]", "book[author_first_name]"

      assert_select "input[name=?]", "book[price]"
    end
  end
end
