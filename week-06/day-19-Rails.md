# Mark's notes
# Day 19 Bootcamp | Rails

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
