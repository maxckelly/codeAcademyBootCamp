# Stackoverflow data explorer

https://data.stackexchange.com/stackoverflow/query/edit/1009075


## Explore the user table

We will use top to limit results

```sql
select top 100 * from users;
```

- Add an order by for reputation  
- Make the order by desc  
- Who is the top user? - Jon Skeet

- Add a where clause for location to see what users are in Melbourne
  - `select * from users where Location ='Melbourne'`
- Use like in the where clause


- Use count to count total number of users
  `select count(*) as numberOfUsers from users`
- Use count and group by to see how many users per location  
  ```
  SELECT COUNT(Id), Location 
  FROM users
  GROUP BY Location
  ```
- Order by count 
  ```
  SELECT COUNT(Id), Location 
  FROM users
  GROUP BY Location
  ORDER BY count(*) asc
  ```  

## Explore the Posts table
- Use group by to see Posts with the highest AnswerCount
- Notice the the tag column has been [de-nomalize](https://en.wikipedia.org/wiki/Denormalization)
- use like and group by to see how many posts have ruby as a tag
  add an order by

## Explore tags
- Use inner join and group by to see how many times each tag is used

## Explore other people's queries
https://data.stackexchange.com/stackoverflow/queries