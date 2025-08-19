create database capstone_project;
use capstone_project;

# creating 1st Table_name :"Books"
Create table Books 
(BOOK_ID int primary key,
TITLE varchar(100),
AUTHOR varchar (25),
GENRE varchar (25),
YEAR_PUBLISHED YEAR,
AVAILABLE_COPIES int);

Create table Members
(MEMBER_ID INT primary key,
NAME varchar (25),
EMAIL varchar (25),
PHONE_NO int,
ADDRESS varchar(100),
MEMBERSHIP_DATE DATE);

Create table BorrowingRecords
(BORROW_ID INT primary key,
MEMBER_ID INT,
BOOK_ID INT,
BORROW_DATE DATE,
RETURN_DATE DATE,
Foreign key (MEMBER_ID) References Members(MEMBER_ID),
Foreign key (BOOK_ID) references Books (BOOK_ID));


insert into Books (BOOK_ID, TITLE, AUTHOR, GENRE,
YEAR_PUBLISHED, AVAILABLE_COPIES) value
(111,"Pride and Prejudice","Jane Austen","Fiction",2002,22),
(121,"The Guide","Narayan","Humor",2004,25),
(131,"God of Small Things","Arundhati Roy","Psychological",2007,5),
(141,"Suitable Boy","Vikram Seth","Drama",2010,34),
(151,"THE SILENT PATIENT","Alex","Thriller",1984,51),
(161,"Harry Potter","Rowling","Fantasy",1991,27),
(171,"The Lord of the Rings","Tolkien","Fantasy",2001,12);

alter table Members
modify Phone_no BIGINT;

Insert into Members (MEMBER_ID, NAME, EMAIL,PHONE_NO,
ADDRESS, MEMBERSHIP_DATE) value 
(101,"Shankar","Shankar@gmail.com" ,"9176221122","Madavaram, Chennai","2025-04-25"),
(102,"Mukesh","Mukesh@gmail.com",9176220413, "Kodambakkam,Chennai","2025-05-26"),
(103,"Praveen","Praveen@gmail.com",9176220474, "Anna Nagar,Chennai","2025-07-27" ),
(104,"Shrinath", "Shrinath@gmail.com",9176110415, "Saidapet,Chennai","2025-04-21"),
(105,"Vignesh", "Vignesh@gmail.com",9176239116, "velachery,Chennai","2025-04-22"),
(106,"Vimalrka", "Vimalrka@gmail.com",9135674171, "Tambaram,Chennai","2025-07-28"),
(107,"Kamaraj",  "Kamaraj@gmail.com",9176220418,  "Medavakkam,Chennai","025-05-31");

Insert into BorrowingRecords (BORROW_ID, MEMBER_ID,
BOOK_ID, BORROW_DATE, RETURN_DATE) values 
(1  ,103    ,111    ,"2025-04-22"   ,"2025-06-22"),
(2  ,104	,121	,"2025-05-02"	,"2025-05-22"),
(3	,105	,121	,"2025-04-04"	,"2025-04-23"),
(4	,105	,141	,"2025-06-29"	,"2025-08-24"),
(5	,107	,151	,"2025-03-20"	,"2025-05-25"),
(6	,101	,141	,"2025-04-15"	,"2025-06-26"),
(7	,102	,171	,"2025-02-22"	,"2025-05-27");

# Retrieve a list of books currently borrowed by a specific member.

select b.book_id,m.Name as "Borrowed by",bk.TITLE as "list of books"
from BorrowingRecords b
join books bk on b.BOOK_ID = bk.BOOK_ID
join Members m on b.MEMBER_ID = m.MEMBER_ID
order by b.book_id asc;

#Find members who have overdue books (borrowed more than 30 days ago, not returned)

select bk.TITLE, M.Name,DATEDIFF (b.RETURN_DATE,b.BORROW_DATE) as Overdue_by
from BorrowingRecords b
join Members M on b.MEMBER_ID = m.MEMBER_ID
join books bk on b.BOOK_ID = bk.BOOK_ID
where DATEDIFF (b.RETURN_DATE,b.BORROW_DATE) > 30
ORDER BY Overdue_by DESC;

# Retrieve books by genre along with the count of available copies

SELECT Genre,SUM(AVAILABLE_COPIES) AS count_of_available_copies
FROM Books
GROUP BY Genre
ORDER BY count_of_available_copies DESC ;

#Find the most borrowed book(s) overall.

select bk.title,count(b.book_id) as Borrow_Count
from BorrowingRecords b
join books bk on B.book_id = BK.book_id
group by b.book_id
ORDER BY Borrow_Count DESC;

#Retrieve members who have borrowed books from at least three different genres.

select m.Name,M.Member_id
from members m
join BorrowingRecords b on M.MEMBER_ID = B.MEMBER_ID
JOIN Books as Bk ON B.book_id = Bk.book_id
group by m.Name,M.Member_id
having count(DISTINCT bk.genre)>=3;

# Reporting and Analytics:
# a) Calculate the total number of books borrowed per month.

SELECT DATE_FORMAT(Borrow_date, '%Y-%m') AS Borrow_month, COUNT(*) AS Total_books_borrowed
FROM BorrowingRecords b
GROUP BY Borrow_month
ORDER BY Total_books_borrowed desc;

#b) Find the top three most active members based on the number of books borrowed. 

select M.Name,count(b.book_id) as Number_of_books_borrowed
from members m
join BorrowingRecords b on M.MEMBER_ID = B.MEMBER_ID
join books bk on bk.book_id = b.book_id
group by M.name
order by Number_of_books_borrowed desc
limit 3;

#Retrieve authors whose books have been borrowed at least 10 times.

Select Bk.AUTHOR,count(b.book_id) as Number_of_books_borrowed
from books bk
Join BorrowingRecords b on bk.book_id = b.book_id
group by b.book_id
HAVING COUNT(b.book_id) >= 10;

#Identify members who have never borrowed a book.

select M.Name
from members m
left Join BorrowingRecords b on M.MEMBER_ID = B.MEMBER_ID
where b.borrow_id is Null;

