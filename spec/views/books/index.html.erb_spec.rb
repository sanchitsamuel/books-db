require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        publisher: "Publisher",
        title: "Title",
        author_last_name: "Author Last Name",
        author_first_name: "Author First Name",
        price: 2.5
      ),
      Book.create!(
        publisher: "Publisher",
        title: "Title",
        author_last_name: "Author Last Name",
        author_first_name: "Author First Name",
        price: 2.5
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", text: "Publisher".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Author Last Name".to_s, count: 2
    assert_select "tr>td", text: "Author First Name".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
