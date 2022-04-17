class BooksOrderedByPublisher < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        connection.execute('
          CREATE FUNCTION books_ordered_by_publisher()
          RETURNS SETOF books AS $$
          BEGIN
            RETURN QUERY SELECT "books".* FROM "books" ORDER BY "books"."publisher" ASC, "books"."author_last_name" ASC, "books"."author_first_name" ASC, "books"."title" ASC;
          END
          $$ LANGUAGE plpgsql;
          ')
      end
      dir.down do
        connection.execute('
          DROP FUNCTION books_ordered_by_publisher
        ')
      end
    end
  end
end
