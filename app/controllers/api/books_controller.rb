class Api::BooksController < ActionController::API
  def index
    @books = Book.all
    if params[:order] == 'publisher' || params[:order].nil?
      @books = @books.order :publisher, :author_last_name, :author_first_name, :title
    elsif params[:order] == 'author'
      @books = @books.order :author_last_name, :author_first_name, :title
    end
    render json: @books, status: :ok
  end

  def psql_function
    if params[:order] == 'publisher' || params[:order].nil?
      r = ActiveRecord::Base.connection.execute 'select * from books_ordered_by_publisher();'
    elsif params[:order] == 'author'
      r = ActiveRecord::Base.connection.execute 'select * from books_ordered_by_author();'
    end
    render json: r.to_a, status: :ok
  end

  def create_list
    @books = Book.create(books_list_params[:books])
    render json: { success: true, message: "#{@books.count} Books created successfully" }, status: :created
  rescue StandardError => e
    render json: e.message, status: :unprocessable_entity
  end

  def total_price
    price = Book.sum :price
    render json: { price: price }, status: :ok
  end

  private

  def books_list_params
    params.permit(books: %i[publisher title author_last_name author_first_name price])
  end
end
