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





