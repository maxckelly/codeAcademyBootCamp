# Max's Notes
# Day 18 of BootCamp - Rails

- Ruby on rails always splits camel casing with a underscore _ For example: If you types HighScores it would put in the database high_scores.
- When you include an ! in your ruby on rails db creation it will fail with an error, if you don't it will fail in silence.
- To create records in your database you can do so by going to:
  1. `rails c` (irb console)
  2. `<scaffoldName>.create!(<key>: <data>, <key>: <data>)` - For example `HighScore.create!( name: "Max", high_score: 23000)`.
- To access data in IRB you an do `<scaffoldName>.all[<indexNumber>].<keyName>` for example: `HighScore.all[0].high_score`
- To delete a scaffold you must first do the below: 
  - `rake db:rollback` - A role back will take back your last updates. 
  - `rails d scaffold <scaffoldName>` - This can remove a scaffold for example: `rails d scaffold HighScore` - These commands remove a scaffold TAG: delete scaffold
- To find a record in a database you can do so by searching for an ID by - `<scaffold>.find(<idNumber>)`. For example: `HighScore.find(1)`
- You can then assign this to a variable by doing `<variableName> = <scaffoldName>.find(<idNumber>)` for example: `record = HighScore.find(1)`
- You can then update records through the variable doing `<variableName>.update!(<keyName>: <newValue>)` for example: `record.update!(high_score: 320000, box_art_url: "https://www.jbhifi.com.au/products/apple-imac-with-retina-5k-display-27-inch-3-1ghz-i5-1tb?variant=20376561844322")`
- NOTE: Update can only be done when you assign it to a variable 
- NOTE: control-C in IRB will not quit you from IRB instead it will move you to the top level.
- To create a large amount of data you can do the following in IRB 
```
10.times do |entry|
  HighScore.create!( name: "Game number #{entry + 1}", high_score: ( (entry + 1 ) * rand( 10..1000 ) ) )
end
```
- To search up a number of items in the DB at once you can do `<scaffoldName>.find([<idNumber>])` an example of this is `HighScore.find([2,4,6])` this finds all the data with the ID of 2,4,6.
  - You can also assign this to a variable by doing `<variableName> = <scaffoldName>.find([<idNumber>])` an example of this is `records = HighScore.find([2,4,5])`
  - You can then display each record by doing the below 
  ```
  records.each do |record|
    puts record.name
  end
  ```
  - To update a number of records at once you can do the below:
  ```
  records.each do |record| 
    record.update!( name: "value")
  end
  ```
- Finding a record when you don't have primary key you can search. This is done by `<scaffoldName>.where(<key>: <value>)` for example: `HighScore.where(name: "Fun game 4")` this then spits back the fun game record.
- You can use a wild card so that it can search all the records with the key value `<scaffoldName>.where(<key>: "<value>%")` for example: `HighScore.where(name: "fun"%)`
- You can also see a range of the records by doing `<scaffoldName>.where(<key> > <value>)` for example: `HighScore.where(high_score > 3000)`
- You can delete by assigning the record to a variable and typing `<variableName>.delete` this deletes the last value off the array. 

## Adding to Schema 
- The below allows you to add to the scaffold. However the below doesn't generate any view etc... when you do it the below way. Scaffold generates it automatically while the below doesn't. This means it doesn't appear on the site. You will have to add this manually 

- `rails generate migration add_<nameOfElementYouWantToAdd>_to_<scaffoldName> <keyName>: <dataType>` an example of this is: `rails generate migration add_user_to_high_scores name: string`
- Another way of doing this is: `rails generate migration create_holders <keyName>:<dataType>` an example of this is: `rails generate migration create_holders name:string age:integer`.

# Marks Notes
# Day 18 of BootCamp
## Rails: doing stuff from the console rather than the database interface

- Adding to database from the console: e.g. `HighScore.create!( name: Bubble Bobble", high_score: "320000" )` IMPORTANT: syntax here is key. Command will error out if you enter a space between the bang operator and the opening bracket.

- Exclamation mark in your method call will ensure an error message is returned if you get the syntax wrong.

- IMPORTANT! You can't put spaces between your input fields when generating your scaffold. For example, `rails generate scaffold HighScore name: string high_score: integer box_art_url: text`. If you do, it will interpret the spaces as strings and return a bunch of nils.

```
=> #<ActiveRecord::Relation [#<HighScore id: 1, name: "Bubble Bobble", string: nil, high_score: "320000", integer: nil, box_art_url: nil, text: nil, created_at: "2019-09-25 01:27:50", updated_at: "2019-09-25 01:27:50">]>
```

- What is a rollback? Basically, an undo. 

- What does this code snippet do? 

```
HighScore.find( 1 )
record = HighScore.find( 1 )
record.high_score
```

- We can pass back an array: `HighScore.find ( [2,4,6] )`
- Then we can assign a variable to that array `records = HighScore.find ( [2,4,6] )`


- We can update multiple records: 

```
irb(main):009:0> records.each do |record|
irb(main):010:1* record.update!( name: "{'Fun game ' + record.id.to_s}" )
irb(main):011:1> end
```

- In SQL, wildcard is written `%` and not `*` as in Ruby (and most other languages?)

- How to create then delete a record:
```
HighScore.create!( name: "This is to be deleted" )
record = HighScore.last
record.delete
```
Then to make sure that it has been deleted you can run `HighScore.last`. This will check that the last record is not the one you created.


- What is a database schema? How your database looks/relates. The tables are part of your database schema.

## Dealing with the schema

- Adding to our schema: 

`rails generate migration add_validated_to_high_scores validated:boolean`

This will generate a migration file for us.

`rake db:migrate`

- Why are we doing this? Allows us to build upon / add to our original scaffold.

- When you add to your schema, you won't see it in rails because it's not yet in our views, controllers, or our models. So we need to start looking at MVC.

## MVC

- Where to go in your app: `your_project_name/app/controllers`

- Controllers should be as small as possible (i.e. compact code). 

- `<% =>` will return from the ruby to the html

- Important! When you change anything in your app, you have to restart your server for it to have any effect. Or do you?

- `.erb` file is an 'embedded ruby file'

- What is a partial (in rails)? 

## Random detour through bitwise?

- What does BIT stand for? Binary digit

- What is a bitwise comparison?


## Second Ryan Bigg Talk

What makes Ryan want to hire someone?
Ryan wants to see two things: 1) that you're teachable and want to learn; and 2) that you've been hepful to other people in the past.
