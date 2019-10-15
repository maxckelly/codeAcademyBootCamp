# Max's Notes


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