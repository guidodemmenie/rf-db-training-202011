# Workshop Robot Framework - Database testing
Welcome to the github page of the RF db testing workshop.
Here you find usefull links, tips & tricks and after the workshop also solutions for the exercises.

## Installation
For this workshop you need, next to Robot Framework, the database library and the python DB API package.
You can install them by running the following commands in your commandline:

database library:  
`pip install robotframework-databaselibrary`

DB API voor MySQL:  
`pip install pymysql`

## SQL
There are several pages that explain basic SQL that we will be using during the workshop.

 - [W3Schools](https://www.w3schools.com/sql/)
 - [Guru99](https://www.guru99.com/sql.html)
 - [Youtube filmpje](https://www.youtube.com/watch?v=OfM5lC-7R4Y)


## SQL editor
Though not mandatory, it can be useful to test out some of the queries before putting them in your Robot Framework script by first running them from a SQL editor in a database client application. There are many database clients available. 

Two popular ones are:
 - [DB visualizer](https://www.dbvis.com/download/11.0)
 - [DBeaver](https://dbeaver.io/)


# Exercises

## Exercise 1 :: Writing SQL queries

For this exercise, we’ll use the `testautomationu` table in the database.
Write queries for all scenarios listed below and check the results in a SQL editor

1. Select all courses starting with 'Introduction’.
1. Select the number of courses with 'Python' in the name.
1. Select the fields 'chapter' and 'credits' for the course 'Cucumber with Java’
1. Bonus: Select all courses with a level other than 'Beginner'

## Exercise 2 :: The first queries in RF
For this exercise, we’ll use the `cursist` table in the database.
Create a new script that connects to the database.

1. Enter a new record in the `cursist` table using an `INSERT` statement. Note that the date field isn’t mandatory.
1. Add a check (execute a `SELECT` statement) to check if the record is stored correctly in the database
1. **Bonus:** Create a separate testcase that deletes (only) the record created in the first step of this exercise.