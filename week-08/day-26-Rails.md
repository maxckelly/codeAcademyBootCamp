# Mark's Notes

## Assessment 

- Every Wednesday we'll be doing a Computer Science Foundations (i.e. Discrete Mathematics) on a particular topic. Then, every Thursday morning we'll be doing a morning challenge on that topic. Then at 10.40am there will be a quiz on that topic under exam conditions.


## Relational Databases (again)

- What is data normalisation? Gathering your data in the most efficient way possible and in the way that you want to retrieve it.

1. `rails new associations_lesson -d=postgresql`
2. `cd associations_lesson`
3. `rails db:create`
4. `rails generate model Author name:string date_of_birth:date`
- IMPORTANT! Whenever you generate a model you always name it in the singular (e.g. Author), but the table it creates will be plural (e.g. authors)
5. `rails db:migrate`
6. `rails console`
7. `Author.create!(name: "JK Rowling", date_of_birth: "1965-07-31")`
8. `rails generate model Address street:string city:string state:string postcode:string author:references`
9. `rails db:migrate`
10. `psql postgres`, `\list`, `\c associations_lesson_development`, `\dt`, `\d addresses` - just to see where the foreign keys are.
11. Create an address for JK Rowling in rails console: `Address.create!(street: "50 Bedford Square", city: "London", state: "Greater London", postcode: "WC", author_id: 1)`
12. Now that they're linked we shouldn't be able to delete from the Author table. You'll get a foreign key violation error message.
13. Rails doesn't know about the associations we've set up. So we have to specify them. It will, however, automatically create this in our models:
```
class Address < ApplicationRecord
  belongs_to :author
end
```
14. But we'll need to specify the other half of the one-to-many relationship ourselves:
```
class Author < ApplicationRecord
	has_one :address
end
```
15. If you want to be able to delete author you can do this:
```
class Author < ApplicationRecord
	has_one :address, dependent: :destroy 
end
```
16. IMPORTANT! Shorthand for creating an address for our author: `author.create_address(street: "123 Fake Street", city: "New York City", state: "New York", postcode: "1111")` That way, we don't need to know the author_id to assign the address to the author, which is obviously how it should be.
17. Can check that it has worked: `Author.last.address`
18. Generating a one-to-many relationship: `rails g model Book title:string genre:string author:references`
19. Then in your author model:
```
class Author < ApplicationRecord
	has_one :address, dependent: :destroy
	has_many :books, dependent: :destroy 
end
```
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



