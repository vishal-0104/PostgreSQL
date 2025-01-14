Query: CREATE TABLE books(book_id SERIAL PRIMARY KEY, title varchar(100),publication_year int, genre varchar(100));

                                           Table "public.books"
      Column      |          Type          | Collation | Nullable |                Default                 
------------------+------------------------+-----------+----------+----------------------------------------
 book_id          | integer                |           | not null | nextval('books_book_id_seq'::regclass)
 title            | character varying(100) |           |          | 
 publication_year | integer                |           |          | 
 genre            | character varying(100) |           |          | 
 author           | character varying(100) |           |          | 
Indexes:
    "books_pkey" PRIMARY KEY, btree (book_id)
Referenced by:
    TABLE "borrowings" CONSTRAINT "borrowings_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(book_id)


Query: CREATE TABLE Members(member_id SERIAL PRIMARY KEY, name varchar(100),addess varchar(100), contact_number int);

                                           Table "public.members"
     Column     |          Type          | Collation | Nullable |                  Default                   
----------------+------------------------+-----------+----------+--------------------------------------------
 member_id      | integer                |           | not null | nextval('members_member_id_seq'::regclass)
 name           | character varying(100) |           |          | 
 addess         | character varying(100) |           |          | 
 contact_number | character varying(10)  |           |          | 
Indexes:
    "members_pkey" PRIMARY KEY, btree (member_id)
Referenced by:
    TABLE "borrowings" CONSTRAINT "borrowings_member_id_fkey" FOREIGN KEY (member_id) REFERENCES members(member_id)


Query: CREATE TABLE Borrowings(borrowing_id SERIAL PRIMARY KEY,book_id INT REFERENCES books(book_id), member_id INT REFERENCES Members(member_id), borrow_date DATE , due_date DATE , returned_date DATE);
                                     Table "public.borrowings"
    Column     |  Type   | Collation | Nullable |                     Default                      
---------------+---------+-----------+----------+--------------------------------------------------
 borrowing_id  | integer |           | not null | nextval('borrowings_borrowing_id_seq'::regclass)
 book_id       | integer |           |          | 
 member_id     | integer |           |          | 
 borrow_date   | date    |           |          | 
 due_date      | date    |           |          | 
 returned_date | date    |           |          | 
Indexes:
    "borrowings_pkey" PRIMARY KEY, btree (borrowing_id)
Foreign-key constraints:
    "borrowings_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(book_id)
    "borrowings_member_id_fkey" FOREIGN KEY (member_id) REFERENCES members(member_id)

Query: INSERT INTO books (title , publication_year, genre, author) VALUES ('title1', 2000, 'genre1','author1'),('title2', 2002, 'genre2','author2'),('title3', 2003, 'genre3','author3'),('title4', 2004, 'genre4','author4'),('title5', 2005, 'genre5','author5');
 INSERT 0 5

 book_id | title  | publication_year | genre  | author  
---------+--------+------------------+--------+---------
       1 | title1 |             2000 | genre1 | author1
       2 | title2 |             2002 | genre2 | author2
       3 | title3 |             2003 | genre3 | author3
       4 | title4 |             2004 | genre4 | author4
       5 | title5 |             2005 | genre5 | author5
(5 rows)

Query: INSERT INTO members (name , addess, contact_number) VALUES ('name1','address1','1234567890'),('name2','address2','1234567892'),('name3','address3','1234567893'),('name4','address4','1234567894'),('name5','address5','1234567895');
 INSERT 0 5
 member_id | name  |  addess  | contact_number 
-----------+-------+----------+----------------
         1 | name1 | address1 | 1234567890
         2 | name2 | address2 | 1234567892
         3 | name3 | address3 | 1234567893
         4 | name4 | address4 | 1234567894
         5 | name5 | address5 | 1234567895
(5 rows)

Query: INSERT INTO borrowings (book_id,member_id,borrow_date,due_date,returned_date) VALUES (1,1,'2025-01-11','2025-01-21','2025-01-20'),(1,1,'2025-02-12','2025-01-21','2025-02-22'),(3,3,'2025-03-13','2025-03-22','2025-03-23'),(4,4,'2025-04-14','2025-04-23','2025-04-24'),(5,5,'2025-05-15','2025-05-24','2025-05-25');
 INSERT 0 5
 borrowing_id | book_id | member_id | borrow_date |  due_date  | returned_date 
--------------+---------+-----------+-------------+------------+---------------
            1 |       1 |         1 | 2025-01-11  | 2025-01-21 | 2025-01-20
            2 |       1 |         1 | 2025-02-12  | 2025-01-21 | 2025-02-22
            3 |       3 |         3 | 2025-03-13  | 2025-03-22 | 2025-03-23
            4 |       4 |         4 | 2025-04-14  | 2025-04-23 | 2025-04-24
            5 |       5 |         5 | 2025-05-15  | 2025-05-24 | 2025-05-25
(5 rows)


Query: select * from books where author = 'author5';
 book_id | title  | publication_year | genre  | author  
---------+--------+------------------+--------+---------
       5 | title5 |             2005 | genre5 | author5
(1 row) name  

Query: SELECT members.name FROM members
JOIN borrowings ON members.member_id = borrowings.member_id
JOIN books ON borrowings.book_id = books.book_id WHERE books.title = 'title4';
-------
 name4
(1 row) title 

Query: SELECT books.title
FROM books
JOIN borrowings ON books.book_id = borrowings.book_id
WHERE borrowings.due_date < CURRENT_DATE;

-------
(0 rows)

Query: SELECT members.name, COUNT(*) AS total_books_borrowed
FROM members
JOIN borrowings ON members.member_id = borrowings.member_id
GROUP BY members.name;

 name  | total_books_borrowed 
-------+----------------------
 name3 |                    1
 name4 |                    1
 name5 |                    1
 name1 |                    2
(4 rows)

