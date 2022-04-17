class BooksOrderedByAuthor < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        connection.execute('
          CREATE FUNCTION books_ordered_by_author()
          RETURNS SETOF books AS $$
          BEGIN
            RETURN QUERY SELECT "books".* FROM "books" ORDER BY "books"."author_last_name" ASC, "books"."author_first_name" ASC, "books"."title" ASC;
          END
          $$ LANGUAGE plpgsql;
          ')
      end
      dir.down do
        connection.execute('
          DROP FUNCTION books_ordered_by_author
        ')
      end
    end
  end
end
