require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      publisher: "Publisher",
      title: "Title",
      author_last_name: "Author Last Name",
      author_first_name: "Author First Name",
      price: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author Last Name/)
    expect(rendered).to match(/Author First Name/)
    expect(rendered).to match(/2.5/)
  end
end
