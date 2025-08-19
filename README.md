Task 1

Project Title: Library Management System (using SQL)

Project Description: Design and develop a Library Management System using SQL. The project should
involve three tables: Books, Members, BorrowingRecords. The system will manage book
inventories, member details, and borrowing transactions.

The project will include the following tasks:
                                                1.1: Database & Schema Creation
                                                1.2: Data Creation
                                                1.3: Information Retrieval
                                                1.4: Reporting and Analytics


1.1: Database & Schema Creation

a) Create Books table with columns (BOOK_ID, TITLE, AUTHOR, GENRE, YEAR_PUBLISHED,
AVAILABLE_COPIES)
B) Create Members table with columns (MEMBER_ID, NAME, EMAIL, PHONE_NO, ADDRESS, MEMBERSHIP_DATE)
c) Create BorrowingRecords table with columns BORROW_ID, MEMBER_ID,
BOOK_ID, BORROW_DATE, RETURN_DATE. 
Set foreign key constraints linking MEMBER_ID to Members and BOOK_ID to Books.

1.2: Data Creation

a) Insert sample data into the table: Books
b) Insert sample data into the table: Members
c) Insert sample data into the table: BorrowingRecords

1.3: Information Retrieval

a) Retrieve a list of books currently borrowed by a specific member.
b) Find members who have overdue books (borrowed more than 30 days ago, not
returned)
c) Retrieve books by genre along with the count of available copies.
d) Find the most borrowed book(s) overall.
e) Retrieve members who have borrowed books from at least three different genres.

1.4 Reporting and Analytics

a) Calculate the total number of books borrowed per month.
b) Find the top three most active members based on the number of books
borrowed.
c) Retrieve authors whose books have been borrowed at least 10 times.
d) Identify members who have never borrowed a book.
