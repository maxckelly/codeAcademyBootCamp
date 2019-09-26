# Day 18 Rails - DATABASES

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
- `\dt` - This displays table - Once you are connected to the database you can start running your DDL commands and DML commands - This allows you to access, change, manipulate your database without accessing code.
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
- `select * from <scaffoldName>;` - This returns the data from the scaffold you have created. e.g. `select * from high_scores;`
  - The * means to select all the column from the table
- `select <dataName> from <scaffoldName>;` - This selects a particular data from the database e.g. `select name from high_scores;`
- `select <dataName>, <dataName> from <scaffoldName>;` - This selects a number of data from the database e.g. `select name, high_score from high_scores;`
- `select count(*) from <scaffoldName>` - This displays the total back. e.g. `select count(*) from high_scores`

```
select * from high_scores;
where high_score > 1000;
```

`select name from high_scores where high_score > 1000;` - This is an example of a command selecting the names where the score is greater than 1000.

### Wild Cards Calls in DataBase
- You cannot use an equals `=` with wild card you have to use `like`. 
- Wild card has a percentage e.g. `Fun%`
- `where <data> like '<value>%'` e.g. `where name like 'Fun%';`
