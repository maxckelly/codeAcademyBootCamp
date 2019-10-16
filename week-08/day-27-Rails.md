# Max's Notes
- The everyday numbers we use is called base 10.
- 1 Byte is 8 Bits

## Many-to-Many relationships
- Table with the foreign key has the belongs_to: and the other table has the has_many:
- cmd-shift-5 gives the option to record and capture screen.
- Examples: The below is how you connect the tables up together. We created two new tables 
1. `rails generate migration RemoveGenreFromBooks genre:string` - This removed the genre data from the Books table. We did this because we are creating a genre table.
2. `rails generate model Genre name:string` - This generates a model called Genre and assigns it a column name with a datatype string. 
3. `rails generate model BooksGenre book:references genre:references` - This then creates the 'middle' table. This helps bridge the gap between the Books column and the Genre column.  It allows us to reference everything through Book.
- The below is how you link the relationship up. It is done in the `models` folder.
 
```
class Book < ApplicationRecord
  belongs_to :author
  has_many :books_genre
  has_many :genres, through :books_genres
end
```

## Polymorphic Association 

The last type of association we are going to explore is called a polymorphic association. This type of association allows a single model to connect to multiple other models. Remember we said that a foreign key can be more than a single column in the database table. A polymorphic associations uses two columns to relate our table record to another. One column is just like we have been using and stores the id of a row in another table. The other column we use for the relationship provides us with the name of the other table that the id belongs to.

For example lets say that we want a photo to accompany our author. Ok not so bad right we could just add a column in the authors table, no problem. Ok then let’s say that we also want to have a photo for the cover art of any particular book. Once again no big deal we could add another column in our books table to hold this information.

All good but what if we wanted to add in some specific information about each photo like who took the photo, when it was taken etc. Now we can just add these columns to both our authors and books table but it just doesn’t feel right. All the extra data is relating the photos and not the author or book specifically so it feels like maybe there should be another table that holds this information. Something like this:

author_images
id 	author_id 	url 	date_taken
  	  	  	 

book_images
id 	book_id 	url 	date_taken
  	  	  	 

Ok a bit better because now these tables are holding information purely related to the photo and just relating back to the author or book but still it doesn’t feel quite right. I mean we have the same table structure for both our author_images and book_images. Wouldn’t it be better if we could just have a table that was images that held all this information. Well we can with polymorphic associations!

- To generate an images table:
- `rails generate model Image imageable:references{polymorphic} url:string date_taken:date`
- `rails db:migrate`
- You then need to add the relationships in model: 
```
class Book < ApplicationRecord
    belongs_to :author
    has_many :books_genres
    has_many :genres, through: :books_genres
    has_many :images, as: :imageable
end
```
```
class Author < ApplicationRecord
  has_one :address
  has_many :books
  has_many :images, as: :imageable
end
```
- You can then run the below in the ruby console.
```
book = Book.first
book.images.create(url: "https://bit.ly/2U8bW2B", date_taken: "2011-01-21")
author = Author.first
author.images.create(url: "d", date_taken: "2005-03-12")
book.images
author.images
Image.all
```


# Mark's Notes