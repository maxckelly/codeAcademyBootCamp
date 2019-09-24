## MVC - Model View Controller 
  Model - The model is the data - When you want to change the data then you change the model.
  Controller - This deals with passing between the model and the view. You should have a simple controller and the complexitiy should be all done in the model.
  View - This is the UI - Your view never has any functionalities in it. When you want to change how the page looks you change the view

## To install rails you can use the GEM, type the following into your console:
  - gem install rails 
  - brew install postgres (This installs the program postgres) - This is a database 

## Some commands  to remeber
  - `brew services start postgres` 
  - `rails new <projectName>` - This creates a new rails project (it creates a large amount of files so store this somewhere inside a folder).
  - `rails new <projectName> --database=postgresql` (this creates rails with a database). (If this you face issues you need to make sure postgres is running to make it running again you do brew service start postgres)
  - To start your rails server you type `rails server`
  - `rake db:create` - This creates the all the files for the database
  - `rake db:migrate` - This migrates the database.

## Stages of creating a Ruby app:
  - Ensure that you have rails installed and postgres installed (If not see above). To check if they're installed type rails --version or postgres --version
  - Once they have been installed type `brew services start postgres`
  - You then type `rails new <projectName> --database=postgresql` - This creates a database, however if you don't want one you type `rails new <projectName>`
  - `rails server`: This starts up the rails server (IF you face issues please see the below)
    - `rake db:create` - This creates base database 
    - `rake db:migrate` - This migrates everything from Database
  
## Rules for Ruby: 
  - Every command must be run through the terminal

## Once your rails app is created: 
  - Once you have created a Ruby on Rails app you will get the below (see image). The most important folder is `app`
  - `Views` folder - This is where all the pages you have are 
  - `db` is all database driven
<<<<<<< HEAD
  - 

  ![]

Change

Change 2
=======
  
>>>>>>> 3abec63c32e4474c3bc1ae973ad1153a1583306b
