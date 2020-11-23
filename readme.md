# Workshop Robot Framework - Database testing
Welcome to the github page of the RF db testing workshop.
Here you find useful links, tips & tricks and after the workshop also solutions for the exercises.

## Installation
For this workshop you need, next to Robot Framework, the database library and the python DB API package.
You can install them by running the following commands in your commandline:

database library:  
`pip install robotframework-databaselibrary`

DB API voor MySQL:  
`pip install pymysql`

Databaselibrary [keyword](http://franz-see.github.io/Robotframework-Database-Library/api/1.2.2/DatabaseLibrary.html) documentation.

Full database-library page is [here](http://franz-see.github.io/Robotframework-Database-Library/)

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

**Tip** Make sure you close your connection, even if your test fails.

1. Enter a new record in the `cursist` table using an `INSERT` statement. Note that the date field isn’t mandatory.
1. Add a check (execute a `SELECT` statement) to check if the record is stored correctly in the database
1. **Bonus:** Create a separate testcase that deletes (only) the record created in the first step of this exercise.

## Exercise 3 :: Checking the query result
For this exercise we'll use the `zoekresultaat` table in the database.

1. Create a new testsuite for this exercise.
1. In this suite, connect to the database and write some validations that:
    1. check that there are a total of 24 records in the table
    1. Check that there is 1 title with "Python" in the name
    1. Check that the "Complete Guide to Test Automation" costs 33.65
1. Place each query (and its assertions) in a separate testcase.

## Exercise 4 :: A modular approach
For this exercise we'll use the `zoekresultaat` table in the database.

1. Create a new testsuite for this exercise.
1. Let the script connect to the database.
    1. Set your credentials in a separate config file.
1. Write a query that retrieves any item from the table using the id.
    1. Place this keyword in a separate resourcefile.
1. Check the result for "title", "availability" and "price".
    1. Use a separate keyword for this, which in turn calls the query keywork from the previous step.
1. Finally, use string conversion where necessary.