# Max's Notes

- Every Wednesday we're going to be covering off the topics on computer science. The following week on a Thursday there is a quiz.
- Every week 10:40 is a quiz on computer science. YOU MUST BE HERE EVERY THURSDAY 10:40 for 20mins
- This leads up to the final exam which is a 2hour exam. 

## Rails - One-to-One:
- `foreign key` is something which you set up which is unique to a specific table. This links to another key in another table.
- Whenever you generate a model the name you put in is singular which is then turned into a plural by Rails
- To link two columns together you can run this command `<tableName>.create!(<column>:<data>, <columnYouWantToLink>_id: <idNumber>)` for example: `Address.create!(street: "50 Bedford square", city: "London", state:"Greater London", postcode: "WC", author_id: 1)`
- To use the short hand on these you can assign it to a variable by typing <variableName> = <columnName>.last (or) .first (or) id number etc.. for example `author = author.last`. You will be able to then use the short hand which is `create_<columnName>` for example `author.create_address( street: "123 Fake Street", city: "New York", state: "New York", postcode: "111")`
- Once you have assigned it to a variable you can also call the data specifically like <variableName>.<relationshipColumnName>, for example: `author.address` this will return the address back for the value assigned to the author variable 
- To do this in the code you go to `models` >> model you want to make a relationship with >> `has_one :<columnName>` for example: 
- Remember to `<columnName>.save`!

```
class Author < ApplicationRecord
  has_one :address
end
```
- To make it so if you can delete the relationship along with the data you can do: The below says if I delete an author that has an address linked to it then it won't make any errors. However if I don't have that it will spit back an error. BEWARE WITH THIS COMMAND. WOULDN'T RECOMMEND USING
```
class Author < ApplicationRecord
  has_one :address, dependent: :destroy
end
```

## Rails - One-to-Many:
- To have it so you can link a relationship up to many you do `has_many :<columnName>` for example:

```
class Author < ApplicationRecord
  has_one :address
  has_many :books
end
```
- With one-to-many you will see that you can assign as many relationships to the column. For example: The author can have many books. To assign a book to an author you can do `Author.last.books.create!(title: "The Hobbit", genre: "Fantasy")`

- Commands to create a new data examples:
  1. `book = Book.new`
  2. `book.title = "A Good Book"`
  3. `book.genre = "Fantasy"`
  4. `author.books << book`
  OR
  1. `author.books << Book.new(title: "Unfinished tales", genre: "Fantasy")`

- Commands to find examples:
  - `author.books`
  - `author.books[0]`
  - `author.find_by_name( "J.R.R Tolkien" )`
  - `Author.where("name like?", "J%")` or `Author.where("name like 'J%'")`
  - `Address.where("state is null")` - This returns all the states that have null to it.
  - `Author.where("name like ? OR name like ?", "J%", "R%")` - This returns everything that has a J or an R



