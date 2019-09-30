# Maxs Notes
# Day 20 - Rails

- The below tag basically allows an image to be displayed in an text statement. The image tag allows the link to be into an image. 
- The if statement basically checks if the image tag is nil 
```
<% if(high_score.box_art_url) %>
  <td><%= image_tag(high_score.box_art_url, {height:45}) %></td>
<% end %>
```
- To remove an entire database you do `drop database "<dataBaseName>";` WARNING: You cannot get this back once deleted. 
- To drop a table you do `drop table "<tableName>";`

## Holders
- `rails generate migration add_<scaffoldName>_to_<dataBaseName> <scaffoldName>:reference`


# Day 20 - Marks Notes
- To connect to your database in postgres `\c ProjectName_development`
- Then to display the database `\dt`
- Rails command to create a new column from command line `rails generate migration add_validated_to_high_scores validated:boolean`
- `\q` to get out of postgres and back to the command line
- If you run the command to create a new column you will then run a `db:migrate` afterwards to update your database.
- What does the model in MVC do? Talks to the database.
- What is a ternary operator? 
- How to delete a table from postgres in terminal? `drop table TableName;`


### Styling in rails

- scaffolds.scss 

### Back to databases

- We want one database to relate to another (a one to many relationship between high_scores and holder)
- `:references` use when you want one table to reference another table
- E.g. `rails generate migration add_holder_to_high_scores holder:references`

### Nesting resources / aka getting two tables to talk to each other in a database

- Go into high_scores.rb in models directory in your app. To relate the databases, type:
```
class HighScore < ApplicationRecord
	belongs_to :holder
end
```

- Go into holders.rb in models directory in your app and type:
```
class Holder < ApplicationRecord
	has_many :high_scores
end
```

- And then go to config directory and the routes.db file and type:

```
Rails.application.routes.draw do
  resources :holders do
    resources :high_scores
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :high_scores do
    resources :holders
  end 
end
```
- This is where the nesting happens. See how `resources :high_scores` is nested in `resources :holders`? And the other way around? If we didn't do this, there would be no relation between the two.

- What we're doing is establishing a one to many relationship in our sql database. This is very important. What we're saying is that for every high score we've got a holder. The holder of that score. What we're also saying, though, is that that holder can have many high scores. For every holder there can be many high scores; for every high score there can only be one holder. How do we show that on our rails pages? By doing the above. 

- When you get a rails project and you have to hae a database with a one to many relationship (and you will), this is how you do it.

- Remember, the models are how the database is relating to our app.

- Then go to high_scores_controller.rb in controllers directory and add `:holder_id` to the high_score_params method. So we can pass around the holder_id. This makes it a permissable paramater. E.g. 

```
def high_score_params
  params.require(:high_score).permit(:name, :high_score, :box_art_url, :validated, :holder_id)
end
```

- Then go to views/high_scores/_form.html.erb and add in the holder_id. E.g.
```
  <div class="field">
    <%= form.label :holder_id %>
    <%= form.select :holder_id, options_for_select( Holder.all.collect { |u| [u.name, u.id] }, :selected => high_score.holder_id ) %>
  </div>
```
- The complicated code you see is just the way to create a dropdown menu. Don't worrry about trying to memorise now.


- Then update your views index.html.erb (for the table)
`<td><%= high_score.holder ? high_score.holder.name : "" %></td>`
`<th>Holder</th>`

- Then go to show.html.erb in the high_scores directory in view and insert this:

```
<p>
  <strong>Holder:</strong>
  <%= @high_score.holder ? @high_score.holder.name : "" %>
</p>
```


### Now we have two tables, let's have a look at it in Postgres

- Select never makes changes to your DB. So you can play around with select commands.
- From within your rails project directory: `select * from holders;`  will select rows
- `select name, age from holders;` will select columns
- If we wanted to find all the people over 30: `select name, age from holders where age > 30;`

- `select * from high_scores, holders;` brings up both tables
- `select * from high_scores, holders where high_scores.holder_id = holders.id`
- `select * from high_scores, holders where high_scores.holder_id = holders.id;`
- `select high_scores.name, holders.name from high_scores, holders where high_scores.holder_id = holders.id;`

- There is a shorthand way of doing this called an alias. `select hs.name, h.name from high_scores hs, holders h where hs.holder_id = h.id;` The alias can be literally anything e.g. `select x.name, y.name` and so on...

- Add the age column in: `select hs.name, h.name, age from high_scores hs, holders h where hs.holder_id = h.id;`
- We're using a where clause to join two tables.
- Add an extra filter use AND. E.g. `select hs.name, h.name, age from high_scores hs, holders h where hs.holder_id = h.id AND age > 30;`

- An inner join only returns a row where the value matches from the two tables. Inner join syntax is good to use because the where syntax can get overly complicated
- `select hs.name, h.name, age from high_scores hs INNER JOIN holders h ON hs.holder_id = h.id where age > 30;`

- What is data integrity? SQL databases ensure data integrity because the data is relational. E.g. you cannot delete a record if there's data that needs it that is still being used in the database.


## High Level Rails Review

- Creating a new project again! 
- `rails new AnotherTestProject --database=postgresql`
- `rails db:create`
- `rails db:migrate`
- `rails generate scaffold Product name:string price:float quantity:integer description:text image_url:text`
- `rails db:migrate`
- Deleting a scaffold: `rails d scaffold Product`; `rails db:commit`. But you also have to do a db rollback to delete the table that you created. The deletion of the scaffold won't, by default, delete the database.