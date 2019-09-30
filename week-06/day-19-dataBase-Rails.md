# Day 18 Rails - DATABASES

- FOR HELP: https://guides.rubyonrails.org/getting_started.html

- SQL - Structure query language
- Database A way to structure your set of data held in a computer, especially one that is accessible.
- A database management system is important because
  1. Reducing data redundancy 
  2. Data Sharing
  3. Data Integrity - A way of ensuring that the data is accurate and consistent. 
  4. Data Security 
  5. Backup & Recovery
  6. Privacy / Authorization - User access and user privileges as well as roles.
  7. Data Consistency - Rules to make sure your data keeps it integrity
- Types of DBMS
  - Relational
  - Hierarchial
  - Network
  - Object Oriented
  - NoSQL
- Examples of companies: 
  - Oracle
  - MySQL
  - Microsoft SQL
- `Model` defines the structure of the database

### Terms:

- Query: An information request from a database
- Transaction: A sequence of queries that perform the desired task. A transaction is being able to do multiple steps before committing it to the database 
- Schema: The structure of a database. A logical blueprint of how the database is not only constructed, but how things are related to each other. 
- Distributed vs Centralized: A centralized DB only has one database file, kept at a single location. A distributed one is built of multiple database files stored in multiple locations. Ruby on rails is centralized.
- Normalization - Means you data is in a base form which makes it scalable.
  - For example this is breaking a form up into different parts allowing you to query the data.  E.g. An address instead of storing it in one massive string you can't see how many people live in Melbourne - But if you store it in a number of strings separate you can query the DB.
- Scalability: The ability for a database to handle a growing amount of data.

### Entity Relationship Diagrams (ERD)

- A visual way of describing objects and their interrelated relationships.
- This is built from three components
  1. Entities - The object. This can be things like:
    - Student
    - Person 
  2. Attributes - Information that describes each entity.
  3. Relationship - How each entity is linked. 

### Relationships

- One To One (1:1)
  - See below for example:
  ```
  One doctor has one office.

  One office has one doctor
  ```
- One To Many (1:N)
  - See below for example:

  ```
  One employer has many employees

  One employee belongs to one employer
  ```
- Many To Many 
  - See below for example:
  ```
  One doctor has many patients

  One patient has many doctors
  ```

- `psql postgres` - This has access to your entire database.
- All main commands start with a `\` 
- `\list` - This brings up your Database list
- `\c <dataBaseName>` - To connect to your database e.g. `\c HighScore_development`
- `\dt` - This displays table - Once you are connected to the database you can start running your DDL commands and DML 
commands - This allows you to access, change, manipulate your database without accessing code.
- `\dt <scaffoldName>` - This displays everything in the database for that scaffold. e.g. `\dt high_scores`
- `rake db:create
- DDL = Data Defintion Language 
  - Has commands like: 
    1. `create`
    2. `add column`
- DML = Data Manipulation Language 
  - Has commands like:
    1. `select`
    2. `insert`
    3. `update`
    4. `delete`
- `select * from <scaffoldName>;` - This returns the data from the scaffold you have created. e.g. `select * from high_scores;` - This is like asking the dataBase to display the data.
- The * means to select all the column from the table
- `select <dataName> from <scaffoldName>;` - This selects a particular data from the database e.g. `select name from high_scores;`
- `select <dataName>, <dataName> from <scaffoldName>;` - This selects a number of data from the database e.g. `select name, high_score from high_scores;`
- `select count(*) from <scaffoldName>` - This displays the total back. e.g. `select count(*) from high_scores`

```
select * from high_scores;
where high_score > 1000;
```

- `select name from high_scores where high_score > 1000;` - This is an example of a command selecting the names where the score is greater than 1000.

- To update a data you can do the below
  ```
  update <scaffoldName>
  set <dataName> = <value>
  where <dataName> = <value>;
  ```
  - Example
  ```
  update high_scores
  set high_score = 32000
  where name = 'Bubble bobble';
  ```

- How to order data by: A way to order your data you can do the below.

  ```
  select <dataName>, <dataName>
  from <scaffoldName>
  order by <dataName> asc;
  ```
  - Example
  ```
  select name, high_score
  from high_scores
  order by high_score asc;
  ```

### Transactions
- Transaction: A sequence of queries that perform the desired task. A transaction is being able to do multiple steps before committing it to the database 
- To being a transaction do:  `begin transaction;` or `begin`
- Update data, example below;
  ```
  update high_scores
  set high_score = 1;
  ```
- `rollback;` - This roles back the transaction. This ends a transaction as well.
- `commit;` - This has now been added to the database. 

### Delete
- If you do `delete from <dataName>` this will then assume everything and delete all the records in that scaffold

### Insert command 
- `insert into <scaffoldName>`
- Example below of inserting into the table 
```
HighScoreProject_development=# insert into high_scores(name, high_score, created_at)
HighScoreProject_development-# values
HighScoreProject_development-# ( 'A good game', 100, now() );
ERROR:  null value in column "updated_at" violates not-null constraint
DETAIL:  Failing row contains (16, A good game, 100, null, 2019-09-26 12:06:45.358605, null, null).
HighScoreProject_development=# insert into high_scores( name, high_score, created_at, updated_at)
HighScoreProject_development-# values
HighScoreProject_development-# ( 'A good game', 100, now(), now() );
INSERT 0 1
``` 

### Wild Cards Calls in DataBase
- You cannot use an equals `=` with wild card you have to use `like`. 
- Wild card has a percentage e.g. `Fun%`
- `where <data> like '<value>%'` e.g. `where name like 'Fun%';`


## Folders in Rails project 
- `app/` 	Contains the controllers, models, views, helpers, mailers, channels, jobs, and assets for your application. You'll focus on this folder for the remainder of this guide.
- `bin/` 	Contains the rails script that starts your app and can contain other scripts you use to setup, update, deploy, or run your application.
- mailer is used for sending emails 
-  Bin - Don't really use
- `config/` - Used for deployment of app. Configure your application's routes, database, and more. This is covered in more detail in Configuring Rails Applications. config.ru 	Rack configuration for Rack based servers used to start the application. For more information about Rack, see the Rack website.
- `db/` - database.yml - This is where you specify your database. Contains your current database schema, as well as the database migrations.
- `seeds.rb`: This is where you can put lots of fake data.
- `Gemfile` & `Gemfile.lock`: These files allow you to specify what gem dependencies are needed for your Rails application. These files are used by the Bundler gem. For more information about Bundler, see the Bundler website.
- `lib/`:Extended modules for your application.
- `log/`: Application log files.
- `package.json`: This file allows you to specify what npm dependencies are needed for your Rails application. This file is used by Yarn. For more information about Yarn, see the Yarn website.
- `public/`: The only folder seen by the world as-is. Contains static files and compiled assets.
- `Rakefile`: This file locates and loads tasks that can be run from the command line. The task definitions are defined throughout the components of Rails. Rather than changing Rakefile, you should add your own tasks by adding files to the `lib/tasks` directory of your application.
- `README.md`: This is a brief instruction manual for your application. You should edit this file to tell others what your application does, how to set it up, and so on.
- `storage/`: Active Storage files for Disk Service. This is covered in Active Storage Overview.
- `test/`: Unit tests, fixtures, and other test apparatus. These are covered in Testing Rails Applications.
- `tmp/`: Temporary files (like cache and pid files).
- `vendor/`: A place for all third-party code. In a typical Rails application this includes vendored gems.
- `.gitignore`: This file tells git which files (or patterns) it should ignore. See GitHub - Ignoring files for more info about ignoring files.
- `.ruby-version`: This file contains the default Ruby version.


# Mark's notes
# Day 19 BootCamp | Rails

## Databases

- What is DBMS? Database management systems.
- A way of structuring your data to be held and retrieved. 
- What is referential intergrity? You cannot remove something that someone else is using. This is all handled inside the database itself.
- What is RDBMS? Relational database management system.
- What is a transaction? A sequece of queries that perform the desired task. E.g. you want to do five different things to a database and they all relate to one another. You want the whole thing to go in at the same time. So we do it in a transaction.
- What is normalisation? 

- To access postgres in the command line: `psql postgres` 
- To see all the databases you've created: `\list`
- [spacebar] to return to the prompt
- To connect to a databse: `\c <ProjectName>`
- To list all the tables you have in your database: `\dt`
- DDL - Data Definition Language
- DML - Data Manipulation Language
- DDL examples: create table, add column, and so on. Data definition commands (rails does it automatically for us)
- DML command examples: select, insert, update, delete. E.g. `select * from high_scores;`
- What is a column in SQL?
- What is a row in SQL? We always return rows in a select query; we always insert rows etc.
- In rails a row is called an ActiveRecord.
- `select * from high_scores;` means select everything fro the high_scores table.
- How do we return a particular column? E.g. `select name from high_scores;`
- In SQL `[]` means it's optional; `{}` means you have to use one of them
- What is an aggregate function? `select count(*) from high_scores;`
- `select avg( high_score ) from high_scores;` give us an average of high scores from the high score average
- `select * from high_scores where high_score > 1000;`
- SQL relies on the semi-colon to tell us the query is finished.
- `select name from high_scores where high_score > 1000;`
- The table is always in snake case when created in ruby on rails
- If using a wildcard you can't use an equals sign. You have to use a like. E.g. `select name from high_scores where name like 'Fun%';`
- SQL only uses single quotes. It won't understand double quotes.
- Now with boolean language: `select name from high_scores where name like 'Fun%' and high_score > 1000;`
- `select name, high_score from high_scores where name like 'Fun%' and high_score > 1000;`
- To use or: `select name, high_score from high_scores where name = 'Game number 8' or high_score > 2000;`
- A database comprises table(s); table(s) are made up of rows and columns.

## How to update the table:

- Example: `update high_scores set high_score = 932000 where name = 'Bubble Bobble';`
- Order by a particular column. Example: `select name, high_score from high_scores order by high_score asc;`

## Back to transactions briefly:

- How to start a transaction? `begin transaction;`. It means that what we do within the transaction is only going to happen for us; it's not going to update the database.
- Can do a rollback within the transaction to undo any errors we make. `rollback;` Rollback will end the transaction. So you'll have to restart it.
- Generally everything you do in a database should be done in a transaction, just in case you screw it up.
- To commit/finalise a transaction: `commit;`
- How to delete? For example: `delete from high_scores where high_score > 0`

## How to insert into the table

- There are two main formats for inserting.
- What is null? That nothing has been set to a column. It's different than an empty string because an empty string is still a value. Null is no value.
- When inserting, we have to make sure we don't violate the rules of our schema. The schema.rb will tell you which rows have to have values and which can be null/empty. If it has to have a value it will read `null: false`
- What does `\d high_scores` do?

## Aaron's talk on Rails

- Rails is really folder specific. 
- What are seeds? Fake data for populating your database.
- From route to controller to view.
- .erb is called a templating language
- `local: true` disables asynchronicity 
- The `@` syntax gives a variable scope beyond the block it's in.
