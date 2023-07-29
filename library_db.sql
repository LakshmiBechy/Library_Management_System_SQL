-- CREATING DATABASE LIBRARY
CREATE DATABASE Library;

USE Library;

-- TABLE BRANCH
CREATE TABLE Branch(
Branch_No INT PRIMARY KEY,
Manager_Id INT NOT NULL,
Branch_Address VARCHAR(30),
Contact_No BIGINT NOT NULL
);

INSERT INTO Branch (Branch_No, Manager_Id, Branch_Address, Contact_No)
VALUES
    (100, 1000, 'Mumbai', '1234567890'),
    (101, 1005, 'Delhi', '9876543210'),
    (102, 1003, 'Bangalore', '9898989898'),
    (103, 1008, 'Kolkata', '9999999999'),
    (104, 1009, 'Chennai', '8888888888'),
    (105, 1004, 'Hyderabad', '7777777777'),
    (106, 1001, 'Mumbai', '6666666666'),
    (107, 1002, 'Delhi', '5555555555'),
    (108, 1006, 'Bangalore', '4444444444'),
    (109, 1007, 'Kolkata', '3333333333');
    
SELECT * FROM Branch;

-- TABLE EMPLOYEE
CREATE TABLE Employee(
Emp_ID INT PRIMARY KEY,
Emp_Name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL(10,2),
Branch_No INT,
FOREIGN KEY (Branch_No) REFERENCES Branch(Branch_No)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary,Branch_No)
VALUES
    (1001, 'Ravi Kumar', 'Manager', 65000,105),
    (2000, 'Suresh Sharma', 'Technician', 25000,107),
    (3001, 'Anita Gupta', 'Library Assistant', 15000,102),
    (4000, 'Rajesh Singh', 'IT Support', 25000,105),
    (3005, 'Neha Verma', 'Library Assistant', 10000,105),
    (1002, 'Sunil Patel', 'Manager', 60000,105),
    (1008, 'Priya Sharma', 'Assistant Manager', 45000,101),
    (4002, 'Manish Agarwal', 'IT support', 30000,101),
    (3007, 'Shalini Gupta', 'Library Assistant', 20000,105),
    (1005, 'Rahul Singh', 'Manager', 65000,105);
    
    SELECT * FROM Employee;
    
    -- TABLE CUSTOMER
    CREATE TABLE Customer(
    Customer_Id INT PRIMARY KEY,
	Customer_Name VARCHAR(30) NOT NULL,
	Customer_Address VARCHAR(30),
	Reg_Date DATE NOT NULL
    );
                          
	INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)VALUES 
    (7002, 'Vikram Shah', 'Mumbai', '2021-12-15'),
    (7001, 'Ananya Gupta', 'Delhi', '2021-11-10'),
    (7000, 'Rajeev Verma', 'Bangalore', '2021-09-20'),
    (7003, 'Neha Singhania', 'Kolkata', '2022-01-05'),
    (7004, 'Alok Rajput', 'Chennai', '2022-02-08'),
    (7005, 'Pooja Sharma', 'Hyderabad', '2022-03-12'),
    (7006, 'Manoj Kumar', 'Mumbai', '2022-03-17'),
    (7007, 'Shweta Verma', 'Delhi', '2022-04-18'),
    (7008, 'Vivek Gupta', 'Bangalore', '2022-05-21'),
    (7009, 'Anjali Singh', 'Kolkata', '2022-05-27');
    
    SELECT * FROM Customer;
    
    -- TABLE ISSUESTATUS
    CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
	Issued_cust INT NOT NULL,
    Issued_book_name VARCHAR(50),
    Issue_date DATE NOT NULL,
    Isbn_book BIGINT NOT NULL,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (500, 7003, 'To Kill a Mockingbird', '2022-11-01', 9780134448238),
    (501, 7007, 'Pride and Prejudice', '2022-11-07', 9781234567890),
    (502, 7003, "Harry Potter and the Sorcerer's Stone", '2022-12-03',9784567890123),
    (503, 7005, 'A Tale of Two Cities', '2022-12-15', 9789876543210),
    (504, 7006, 'Sita: An Illustrated Retelling of the Ramayana', '2022-12-18', 9782345678901),
    (505, 7009, 'The Adventures of Tom Sawyer', '2023-01-03', 9785432109876),
    (506, 7008, 'A Suitable Boy', '2023-02-07', 9786789012345),
    (507, 7009, 'The Discovery of India', '2023-03-08', 9783210987654),
    (508, 7007, 'The 5AM Club', '2023-04-09', 9787890123456),
    (509, 7004, 'Sapiens - A Brief History of Mankind', '2023-05-10', 9788765432109);
    
    SELECT * FROM IssueStatus;
    
-- TABLE RETURNSTATUS
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT NOT NULL,
    Return_book_name VARCHAR(50),
    Return_date DATE NOT NULL,
    Isbn_book2 BIGINT NOT NULL,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (800, 7003, 'To Kill a Mockingbird', '2022-11-10', 9780134448238),
    (801, 7007, 'Pride and Prejudice', '2022-11-15', 9781234567890),
    (802, 7003, "Harry Potter and the Sorcerer's Stone", '2022-12-12',9784567890123),
    (803, 7005, 'A Tale of Two Cities', '2022-12-21', 9789876543210),
    (804, 7006, 'Sita: An Illustrated Retelling of the Ramayana', '2022-12-25', 9782345678901),
    (805, 7009, 'The Adventures of Tom Sawyer', '2023-01-03', 9785432109876),
    (806, 7008, 'A Suitable Boy', '2023-02-23', 9786789012345),
    (807, 7009, 'The Discovery of India', '2023-03-16', 9783210987654),
    (808, 7007, 'The 5AM Club', '2023-04-15', 9787890123456),
    (809, 7004, 'Sapiens - A Brief History of Mankind', '2023-05-20', 9788765432109);
    
      SELECT * FROM ReturnStatus;
      
-- TABLE BOOKS
CREATE TABLE Books (
    ISBN BIGINT PRIMARY KEY,
    Book_title VARCHAR(50),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(3),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

-- Insert rows into the Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    (9784567890123, "Harry Potter and the Sorcerer's Stone", 'Fantasy', 55.00, 'yes', 'J.K. Rowling', 'Penguin Books'),
    (9781234567890, 'Pride and Prejudice', 'Fiction', 30.00, 'yes', 'Jane Austen', 'Vintage Books'),
    (9780134448238, 'To Kill a Mockingbird', 'Fiction', 25.00, 'yes', 'George Orwell', 'Signet Classics'),
    (9789876543210, 'A Tale of Two Cities', 'Fiction', 35.00, 'yes', 'Charles Dickens', 'Penguin Classics'),
    (9782345678901, 'Sita: An Illustrated Retelling of the Ramayana', 'Mythology', 35.00, 'yes', 'Devdutt Pattanaik', 'Penguin Books India'),
    (9785432109876, 'The Adventures of Tom Sawyer', "Children's Literature", 30.00, 'yes', 'Mark Twain', 'Penguin Classics'),
    (9786789012345, 'A Suitable Boy', 'Fiction', 40.00, 'yes', 'Vikram Seth', 'Penguin Books India'),
    (9783210987654, 'The Discovery of India', 'History', 45.00, 'yes', 'Jawaharlal Nehru', 'Oxford University Press India'),
    (9787890123456, 'The 5AM Club', 'Self Help', 35.00, 'yes', 'Robin Sharma', 'HarperCollins'),
    (9788765432109, 'Sapiens - A Brief History of Mankind', 'History', 50.00, 'yes', 'Yuval Noah Harari', 'HarperCollins'),
    (9780198526634, 'The Alchemist', 'Fiction', 50.00, 'yes', 'Paulo Coelho', 'HarperOne'),
    (9781846952481, 'The Girl on the Train', 'Fiction', 25.00, 'no', 'Paula Hawkins', 'Riverhead Books'),
    (9783161483025, 'The Da Vinci Code', 'Detective fiction', 30.00, 'no', 'Dan Brown', 'Doubleday'),
    (9782635627919, 'The Kite Runner', 'Historical Fiction', 40.00, 'yes', 'Khaled Hosseini', '	Riverhead Books'),
    (9780553818085, 'India: A History', 'History', 40.00, 'no', 'John Keay', 'Grove Press');
    
    SELECT * FROM Books;
    
    
    -- QUERIES
    
    -- 1. Retrieve the book title, category, and rental price of all available books.
    
          SELECT Book_title, Category, Rental_Price FROM Books WHERE Status='yes';
          
	-- 2. List the employee names and their respective salaries in descending order of salary.
    
          SELECT Emp_Name, Salary FROM Employee ORDER BY Salary DESC;
          
	-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
    
          SELECT Customer.Customer_name, IssueStatus.Issued_cust, IssueStatus.Issued_book_name FROM IssueStatus INNER JOIN Customer 
          ON IssueStatus.Issued_cust=Customer.Customer_Id;
          
	-- 4. Display the total count of books in each category.
    
          SELECT Category, COUNT(*) AS No_of_Books FROM Books GROUP BY Category;
          
	-- 5. Retrieve the employee names and positions of the employees whose salaries are above Rs.50,000.
    
          SELECT Emp_Name, Position, Salary FROM Employee WHERE Salary>50000;
          
    -- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
    
          SELECT C.Customer_Name, C.Reg_date FROM Customer AS C LEFT JOIN IssueStatus AS I 
          ON C.Customer_Id = I.Issued_cust
          WHERE C.Reg_Date < '2022-01-01' AND I.Issued_cust IS NULL;
	
    -- 7. Display the branch numbers and the total count of employees in each branch.
    
		  SELECT DISTINCT B.Branch_No, COUNT(E.Emp_Id) FROM Branch AS B LEFT JOIN Employee AS E 
          ON B.Branch_No=E.Branch_No GROUP BY B.Branch_No;
          
	-- 8. Display the names of customers who have issued books in the month of May 2023.
          
		  SELECT DISTINCT C.Customer_Id, C.Customer_Name, I.Issue_Date FROM Customer AS C 
          JOIN IssueStatus AS I 
          ON C.Customer_Id = I.Issued_cust
		  WHERE DATE_FORMAT(I.Issue_date, '%Y-%m') = '2023-05';
          
	-- 9. Retrieve book_title from book table containing history. 
    
          SELECT Book_title FROM Books WHERE Book_Title LIKE '%history%';
          
	-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
           
		   SELECT Branch_No, COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_No HAVING COUNT(*) > 5;
          
          
	
    
          
    
    

      

    
   
    


    


    
    

                      
                      






                    
