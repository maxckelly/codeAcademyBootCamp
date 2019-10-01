# Max's Notes - Day 21



# Mark's Notes - Day 21

- What is an entity relationship diagram?
- A visual representation of how our databases relate
- What is a primary key? It's something that uniquely identifies every row in your table. It's generally an integer. Has to be unique for every row.
- What is a foreign key? Something that points to a key in another table. A column that points to a key in another table. One to many relationship.
- What is referential integrity?
- Another way of doing your scaffold: `rails generate scaffold Product name:string description:text supplier:references` That creates the foreign key during the scaffold generation
- You would still need to generate scaffold for your supplier table
- For ERD design: https://app.dbdesigner.net/designer/schema/new
- Good one to many relationship example: an author can have/publish many articles but an article only has one author(s).
- Generally your primary key is listed at the top of your table in your ERD.
- Allow nulls? When you have an integer field, generally go with a default e.g. of 0 and don't allow nulls.

- Pair exercise: creating an ERD

## Steps Roddy took to create his Medium app

1. `rails generate scaffold Author name:string image_url:text`
- NOTE: if your command hangs, you might need to kill a process. To see all the processes currently running: `ps` 

2. `rails generage scaffold Article title:string content:text author:references`
- NOTE: `author:references` is where you're linking the two tables together

3. `rails generate scaffold Comment response:text article:references`

4. `rails db:migrate`

5. In a scaffold command, we can't add details like the date or change null values so Roddy showed us how to do this manually: `rails generate migration FixUPColumns`

6. Go to db/migrate/FixUpColumns in VS Code. Within the Class you'll see:
```
def change
end
```
- Inside the method is where you customise the columns/make the changes you want:
```
def change
	change_column_null(:articles, :title, false)
end
```

7. Migrate that shit: `rails db:migrate` 
- IMPORTANT! You should never just edit db/schema.rb directly. Always make changes via migrate/migrations.

8. app/models/author.rb
`has_many :articles`

9. config/routes.rb
```
resources :articles do
	resources :comments
	resources :authors
end

resources :authors
```
- This routing is how you want your website to flow

10. views/articles/index.html.erb
`<td><%= article.author ? article.author.name : "" %></td>`

11. views/articles/show.html.erb
12. views/articles/form.html.erb

13. Don't need to change the controller because we scaffolded it correctly.
