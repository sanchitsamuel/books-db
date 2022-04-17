# README

## Getting Started

#### Using
  - ruby 3.0.1p64
  - Rails 6.1.5

```
# install dependencies
bundle

# set up DB
rails db:create
rails db:migrate
rails db:seed

# run tests
bundle exec rspec

# start server
rails s
```


### Create a REST API using RoR MVC and write a method to return a sorted list of these by Publisher, Author (last, first), then title.

```
curl --location --request GET 'http://localhost:3000/api/books?order=publisher'
```

### Write another API method to return a sorted list by Author (last, first) then title.

```
curl --location --request GET 'http://localhost:3000/api/books?order=author'
```

### If you had to create one or more tables to store the Book data in a PostGre database, outline the table design along with fields and their datatypes.

A suggestive approach can be, having the tables mentioned below.

Author has a `many to many` relationship to Publisher.

Publisher has a `many to many` relationship to with Book.

Book `has many` BookEditions


#### Tables

```
Author
  - last_name
  - first_name

AuthorPublisherMapping
  - author_id
  - publisher_id

Publisher
  - name

PublisherBookMapping
  - publisher_id
  - book_id

Book
  - publisher_id
  - title
  - isbn

BookEdition
  - book_id
  - release_date
  - revision
  - issue

```


### Write stored procedures for steps 1 and 2, and use them in separate API methods to return the same results.

Stored procedures in PostGre don't return data. This is a different behaviour from MySQL.

I have created to functions which execute the select query on the `books` table.

Migration is present in the code.


```
curl --location --request GET 'http://localhost:3000/api/books/psql_function?order=publisher'
```

```
curl --location --request GET 'http://localhost:3000/api/books/psql_function?order=author'
```


### Write an API method to return the total price of all books in the database.

```
curl --location --request GET 'http://localhost:3000/api/books/total_price'
```


### If you have a large list of these in memory and want to save the entire list to the database, with only one call to the DB server.

```
curl --location --request POST 'http://localhost:3000/api/books/create_list' \
--header 'Content-Type: application/json' 
--data-raw '{
    "books": [
        {
            "publisher": "Publisher name one",
            "title": "Title 1",
            "author_last_name": "last name 1",
            "author_first_name": "first name 1",
            "price": 20.5
        },
        {
            "publisher": "Publisher name two",
            "title": "Title 2",
            "author_last_name": "last name 2",
            "author_first_name": "first name 2",
            "price": 40.5
        },
        {
            "publisher": "Publisher name two",
            "title": "Title 2",
            "author_last_name": "last name 2",
            "author_first_name": "first name 2",
            "price": 40.5
        }
    ]
}'
```

### Add a property to the Book class that outputs the MLA (Modern Language Association) style citation as a string (https://images.app.goo.gl/YkFgbSGiPmie9GgWA). Please add whatever additional properties the Book class needs to generate the citation.


```
Book.first.cite_mla 2004, 23
```


### Add another property to generate a Chicago style citation (Chicago Manual of Style) (https://images.app.goo.gl/w3SRpg2ZFsXewdAj7).

```
```
Book.first.chicago_style_citation
```
```