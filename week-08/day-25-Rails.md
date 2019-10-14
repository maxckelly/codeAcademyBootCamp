## Mark's Notes

- Creating a database table directly in rails:

1. `rails new database_lesson --database=postgresql`
2. `cd database_lesson`
3. `rails db:create`
4. `rails db:migrate`
5. `rails generate migration CreateBooks title:string author:string publisher:string date_published:date`
6. `rails db:migrate`

- In db/migrations in Rails you'll see:

```
class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.date :date_published
    end
  end
end
```

- In order for rails to access that database we need to create a model. We can either do this in VS Code or from the command line. From VS Code:

```
class Book < ApplicationRecord
end 
```
- What is ORM? Object Relational Mapping. Takes the data for us and converts it to objects.
- Date convention in SQL? YY-MM-DD. Don't depart from this.
- SQL uses single quotes for strings; Rails uses double quotes.

- Adding a row into the table from rails console: `Book.create(title: "Harry Potter", author: "JK Rowling", publisher: "Penguin", date_published: "2010-01-01")`
- Can do `Book.all` to see the row(s) you've created.
- Creating a row a slightly different way: `book = Book.new`, `book.author = "Bobby Tables"`, `book.save`
- `Book.find_by_author("JK Rowling")` 
- Or: `Book.where(author: "JK Rowling")`
- `Book.pluck(:title)`, will produce all the data from a column, in this instance, the title column.
- How many rows in our table? `Book.count`
- `Book.order(author: :desc)`
- Deleting a row from Rails console: `book = Book.find(2)`, `book.destroy`
- `Book.where(author: "JK Rowling").destroy_all`

- Seeding. `bundle add faker`
- Go to db/seeds.rb
```
for i in 1..10
	Book.create(
		author: Faker::Book.author,
		title: Faker::Book.title,
		publisher: Faker::Book.publisher,
		date_published: Faker::Date.between(from: 200.days.ago, to: Date.today)
	)
	puts "Created #{i} records"
end 
```
- `rails db:seed`, `rails db:setup`
