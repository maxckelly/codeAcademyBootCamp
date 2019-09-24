## MVC - Model View Controller 
  - Model - The model is the data - When you want to change the data then you change the model.
  - Controller - This deals with passing between the model and the view. You should have a simple controller and the complexitiy should be all done in the model.
  - View - This is the UI - Your view never has any functionalities in it. When you want to change how the page looks you change the view

## Postgres 
  - Postgres is a database you can use which is free. 


## To install rails you can use the GEM, type the following into your console:
  - gem install rails 
  - brew install postgres (This installs the program postgres) - This is a database 

## Some commands  to remeber
  - `brew services start postgres` 
  - `rails new <projectName>` - This creates a new rails project (it creates a large amount of files so store this somewhere inside a folder).
  - `rails new <projectName> --database=postgresql` (this creates rails with a database). (If this you face issues you need to make sure postgres is running to make it running again you do brew service start postgres)
  - To start your rails server you type `rails server` or you can use `rails s`
  - `rake db:create` - This creates the all the files for the database
  - `rake db:migrate` - This migrates the database.
  - `rails generate scaffold` - If you type after this what you want to generate such as :name:string :score:integer this will generate everything in the Database. Example: `rails generate scaffold :name:string`.
  - `rails console` or `rails c` - This creates a similar thing to IRB which allows you to access teh database.
  - `rake routes` This shows all the routes on your site.

## Stages of creating a Ruby app:
  - Ensure that you have rails installed and postgres installed (If not see above). To check if they're installed type rails --version or postgres --version
  - Once they have been installed type `brew services start postgres`
  - You then type `rails new <projectName> --database=postgresql` - This creates a database, however if you don't want one you type `rails new <projectName>`
  - `rails server`: This starts up the rails server 
  - WARNING: Stop your server when doing any of the below
  - `rake db:create` - This creates base database  - This creates the database
  - `rake db:migrate` - This migrates everything from Database - This migrates it to the site. 
  - Once the database has been set up you want to then generate scaffold - This means putting in the structure of the database. An example of generating scaffold is 
  `rails generate scaffold PeopleStuff name:string number:string employed:boolean age:integer` IMPORTANT: Always put the name before the data type! Basically the above is creating the 'skeleton' for the Database and will create the files etc for you.  `rails generate scaffold <className> <keyName>:<dataType>`
  - Once you have created a scaffold you then have to migrate it again. Do this by typing `rake db:migrate`
  - You will be able to see the files its created in the folders like `app` and `db/migrate`
  - WARNING: Stop your server when doing any of the above
  - You can then test if this is working by going to `localhost:3000/rails/info/routes` 
  - You then copy one of the paths to get to the data input fields such as: http://localhost:3000/people_stuffs
  
## Rules for Ruby: 
  - Every command must be run through the terminal
  - Camel case is very important in the creation of rails. HighScore - This is an example of camel casing. 
  - DO NOT UPDATE THE `SCHEMA.RB` file directly. This is automatically generated.
  
  ## Once your rails app is created: 
  - Once you have created a Ruby on Rails app you will get the below (see image). The most important folder is `app`
  - `Views` folder - This is where all the pages you have are 
  - `db` is all database driven
  - `modules` is how we want to read that information


>>>>>>> eb68b83b15ce2eedf30bebcbc11697889dd7807b
  
>>>>>>> 3abec63c32e4474c3bc1ae973ad1153a1583306b
