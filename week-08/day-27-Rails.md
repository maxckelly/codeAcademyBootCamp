# Max's Notes


# Mark's Notes

## Number Bases

- Base 10 = decimal
- Base 8 = octal
- Base 2 = binary
- What happens when we have a base larger than 10? E.g. hexadecimal.
- IMPORTANT! Anything to the power of 0 is always 1.
- In hexadecimal, A = 10, B = 11, C = 12, D = 13, E = 14, F = 15
- Why hexadecimal? To deal with large numbers. The binary would be long; the hexadecimal compact.
- FF in hexadecimal = 255 in decimal = 11111111 in binary
- Binary to hex to decimal calculator: https://www.rapidtables.com/convert/number/binary-to-hex.html
- Any number you precede with 0 will output in ruby as an octal number. E.g. 017 will output 15.
- Any number you precede with 0x will output in ruby as a hex number. E.g. 0xff will output 255.
- Any number you precede with 0b will output in ruby as a binary number. E.g. 0b101 will output 5.

## Many-to-many relationships

- Going back to our associations rails project from yesterday. First, lets create a new model: `rails generate model Genre name:string`
- `rails generate model BooksGenre book:references genre:references`
- Yesterday we had a genre column in our books table. Let's remove it now: `rails generate migration RemoveGenreFromBooks genre:string`
- `rails db:migrate`
- Then go into our database to see what effect it has had: `psql postgres` etc.
- Then go into our book.rb model and update it:
```
class Book < ApplicationRecord
  belongs_to :author
  has_many :books_genres
  has_many :genres, through: :books_genres
end
```
- Then go into our genre.rb model and update it:
```
class Genre < ApplicationRecord
	has_many :books_genres
	has_many :books, through: :books_genres 
end
```
- `book = Book.first`
- `book.genres.create(name: "High Fantasy")`
- `book.genres`
- `genre.all`
- `book.genres.pluck("name")`

- `book = Book.find(3)`
- `book.genres << Genre.first`  OR: `book.genres.push(Genre.find(1))`

