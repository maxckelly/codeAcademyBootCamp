# Max's Notes
### Database Review

Examples of Database - Postgresql
Referential Integrity - This means you can't delete something when it relies on something else. Or If something else relies on it. 
- Data is stored in 'tables' these have columns and rows. 
- `ps -ef | grep postgres` - This shows you what postgres servers are running
- Data types we can use when creating database columns - 
  1. `string`
  2. `text`
  3. `integer`
  4. `decimal`
  5. `float`
  6. `boolean`
  7. ` binary`
  8. `date`
  9. `time`
  10. `datetime`
  11. `timestamp` - This is a more accurate way of recording when something was created, rather than using date time.
  12. `primary_key` and more
- `psql postgres` - This gets you into the postgres database
- `\list` - Displays all the databases 
- `\c <dataBaseName>` - This connects to the database. Example `\c database_lesson_development`
- `<modelName>.find_by_<columnName>` This finds the data relating to what you're searching for. E.g. `Book.find_by_author("JK Rowling")`
- `<modelName>.where(<rowName>:"<value>"` E.g. `Book.where(author:"JK Rowling")`
- `<modelName>.count` - This counts everything in the database E.g. `Book.count`
- `<modelName>.update(<rowName>: <value>)`- This is how you can update data. For example `Book.update(title: "Good book", author:" "Bob")`

## Creating Dummy Data 
- To create dummy data install the gem `Faker` - `bundle add faker` or `bundle install faker`
- You then build your script in the `seeds.rb` file
- An example of a script is below: 

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
- Once you have built the script you need to populate the database with the dummy data.
- `rails db:seed` - This runs the seed file.
- `rails db:setup` - Once you have seeded the database you can then run this command to speed things up. This re runs the seed file and adds the new dummy data automatically. 

## If your system starts to hang
- `ps -ef | grep rails`
- `kill -9 <numberOfHangingProcess>`
- `spring stop`

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
