-- Books Table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    BookName VARCHAR(255) NOT NULL,
    Author_ID INT,
    YearPublished INT,
    CopiesAvailable INT
);

-- Customer Table
CREATE TABLE Customer (
    CustomerName VARCHAR(100) PRIMARY KEY,
    CustomerCity VARCHAR(50),
    CustomerStreet VARCHAR(100)
);

-- Library Table
CREATE TABLE Library (
    Library_Name VARCHAR(100) PRIMARY KEY,
    Library_City VARCHAR(50)
);

-- Loan Table
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    ISBN_Code VARCHAR(20),
    CustomerName VARCHAR(100),
    TimeLeft INT,
    ExpDate VARCHAR(22),
    Overdue BOOLEAN,
    Library_Name VARCHAR(100),
    FOREIGN KEY (ISBN_Code) REFERENCES Books(ISBN),
    FOREIGN KEY (CustomerName) REFERENCES Customer(CustomerName),
    FOREIGN KEY (Library_Name) REFERENCES Library(Library_Name)
);

-- Library_Books Table
CREATE TABLE Library_Books (
    Library_Name VARCHAR(100),
    ISBN VARCHAR(20),
    Copies INT,
    PRIMARY KEY (Library_Name, ISBN),
    FOREIGN KEY (Library_Name) REFERENCES Library(Library_Name),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);

INSERT INTO Library (Library_Name, Library_City) VALUES
('New York Public Library – Midtown', 'New York City'),
('Harlem Branch Library', 'New York City'),
('Queens Public Library', 'New York City'),
('Brooklyn Central Library', 'New York City'),
('Staten Island Library', 'New York City'),
('Los Angeles Central Library', 'Los Angeles'),
('Hollywood Regional Library', 'Los Angeles'),
('Westwood Branch Library', 'Los Angeles'),
('Echo Park Library', 'Los Angeles'),
('Chicago Public Library – Loop', 'Chicago'),
('Lincoln Park Branch Library', 'Chicago'),
('South Side Library', 'Chicago'),
('Hyde Park Library', 'Chicago'),
('Houston Central Library', 'Houston'),
('Heights Neighborhood Library', 'Houston'),
('Bellaire Library', 'Houston'),
('Miami-Dade Main Library', 'Miami'),
('Little Havana Library', 'Miami'),
('Coral Gables Branch Library', 'Miami'),
('South Beach Library', 'Miami'),
('Boston Public Library – Copley', 'Boston'),
('South End Library', 'Boston'),
('Roxbury Branch Library', 'Boston'),
('San Francisco Main Library', 'San Francisco'),
('Mission Bay Library', 'San Francisco'),
('Chinatown Branch Library', 'San Francisco'),
('Richmond District Library', 'San Francisco'),
('Seattle Central Library', 'Seattle'),
('Ballard Library', 'Seattle'),
('Capitol Hill Branch Library', 'Seattle'),
('Atlanta Central Library', 'Atlanta'),
('Buckhead Branch Library', 'Atlanta'),
('Decatur Public Library', 'Atlanta'),
('Denver Public Library – Central', 'Denver'),
('Cherry Creek Branch', 'Denver'),
('Highlands Library', 'Denver'),
('Free Library of Philadelphia – Parkway Central', 'Philadelphia'),
('Chestnut Hill Branch', 'Philadelphia'),
('South Philadelphia Library', 'Philadelphia'),
('Kensington Library', 'Philadelphia'),
('Phoenix Public Library – Burton Barr', 'Phoenix'),
('Downtown Phoenix Library', 'Phoenix'),
('North Mountain Branch', 'Phoenix');


INSERT INTO Library (lib_name, lib_city_town, books_quantity) VALUES
('Central Library', 'Springfield', 10000),
('North Branch', 'Rivertown', 4500),
('West End Library', 'Mapleton', 6200),
('East Side Library', 'Brookville', 3200),
('South Hill Library', 'Laketown', 2800);

-- ------------------------------
-- Book Table
-- ------------------------------
INSERT INTO Book (isbn, book_name, lib_name, author_name) VALUES
-- Original entries
('978-0-13-110362-7', 'The C Programming Language', 'Central Library', 'Dennis Ritchie'),
('978-1-59327-599-0', 'Automate the Boring Stuff with Python', 'North Branch', 'Al Sweigart'),
('978-0-201-61622-4', 'SICP', 'Central Library', 'Harold Abelson'),
('978-0-262-03384-8', 'Introduction to Algorithms', 'West End Library', 'Thomas Cormen'),
('978-0-321-63536-5', 'Clean Code', 'North Branch', 'Robert C. Martin'),
('978-1-4919-1889-0', 'Fluent Python', 'Central Library', 'Luciano Ramalho'),
('978-1-59327-950-9', 'Black Hat Python', 'West End Library', 'Justin Seitz'),
('978-0-13-235088-4', 'Clean Architecture', 'East Side Library', 'Robert C. Martin'),
('978-0-596-52068-7', 'Learning Perl', 'South Hill Library', 'Randal L. Schwartz'),
('978-1-59327-992-9', 'Serious Python', 'South Hill Library', 'Julien Danjou'),
('978-0-596-51616-1', 'Programming Python', 'Central Library', 'Mark Lutz'),
('978-1-118-95163-5', 'Beginning SQL', 'East Side Library', 'Paul Wilton'),
('978-0-13-468599-1', 'Effective Java', 'North Branch', 'Joshua Bloch'),

-- Additional entries
('978-1-59327-603-4', 'Invent Your Own Computer Games with Python', 'North Branch', 'Al Sweigart'),
('978-1-4919-1888-3', 'Python Cookbook', 'Central Library', 'David Beazley'),
('978-0-596-15806-5', 'Learning Python', 'East Side Library', 'Mark Lutz'),
('978-0-13-597226-7', 'Clean Agile', 'Central Library', 'Robert C. Martin'),
('978-0-13-235613-8', 'Agile Software Development', 'West End Library', 'Robert C. Martin'),
('978-1-59327-833-5', 'Gray Hat Python', 'West End Library', 'Justin Seitz'),
('978-1-4919-0062-8', 'Effective Python', 'South Hill Library', 'Brett Slatkin'),
('978-1-118-92321-2', 'Java: The Complete Reference', 'East Side Library', 'Herbert Schildt'),
('978-0-262-53305-8', 'Structure and Interpretation of Computer Programs', 'North Branch', 'Gerald Jay Sussman'),
('978-0-321-49805-2', 'Refactoring', 'Central Library', 'Martin Fowler'),
('978-1-118-92638-1', 'Head First Java', 'South Hill Library', 'Kathy Sierra'),
('978-1-4919-1889-7', 'Python Tricks', 'South Hill Library', 'Dan Bader'),
('978-1-59327-928-8', 'Coding with Minecraft', 'North Branch', 'Al Sweigart');


-- ------------------------------
-- Customer Table
-- ------------------------------
INSERT INTO Customer (customer_name, customer_city, customer_street) VALUES
('Alice Johnson', 'Springfield', '123 Elm St'),
('Bob Smith', 'Rivertown', '456 Oak Rd'),
('Carla Gomez', 'Mapleton', '789 Pine Ln'),
('David Zhou', 'Springfield', '321 Maple Dr'),
('Ella Ray', 'Rivertown', '654 Cedar Ct'),
('Franklin Moore', 'Brookville', '222 Birch Blvd'),
('Grace Kim', 'Laketown', '99 Aspen Cir'),
('Hannah Lee', 'Brookville', '874 Spruce St'),
('Isaac Patel', 'Mapleton', '112 Dogwood Dr'),
('Janelle Wong', 'Laketown', '33 Walnut Way');

-- ------------------------------
-- Account Table
-- ------------------------------
INSERT INTO Account (account_id, library_name, loan_balance) VALUES
(1, 'Central Library', 2.50),
(2, 'North Branch', 0.00),
(3, 'West End Library', 5.75),
(4, 'East Side Library', 0.00),
(5, 'South Hill Library', 1.25),
(6, 'Central Library', 0.00),
(7, 'South Hill Library', 3.25),
(8, 'East Side Library', 0.50),
(9, 'West End Library', 1.10),
(10, 'North Branch', 0.00);

-- ------------------------------
-- Loan Table
-- ------------------------------
INSERT INTO Loan (loan_time_left, loan_balance, exp_date, overdue, book_name, isbn) VALUES
(14, 0.00, '2025-08-15', FALSE, 'The C Programming Language', '978-0-13-110362-7'),
(7, 1.50, '2025-08-01', TRUE, 'Automate the Boring Stuff with Python', '978-1-59327-599-0'),
(21, 0.00, '2025-08-22', FALSE, 'Introduction to Algorithms', '978-0-262-03384-8'),
(0, 3.00, '2025-07-29', TRUE, 'Fluent Python', '978-1-4919-1889-0'),
(10, 0.00, '2025-08-06', FALSE, 'Clean Code', '978-0-321-63536-5'),
(30, 0.00, '2025-09-10', FALSE, 'Clean Architecture', '978-0-13-235088-4'),
(2, 2.25, '2025-07-31', TRUE, 'Learning Perl', '978-0-596-52068-7'),
(17, 0.00, '2025-08-18', FALSE, 'Effective Java', '978-0-13-468599-1'),
(5, 0.75, '2025-08-03', TRUE, 'Programming Python', '978-0-596-51616-1'),
(12, 1.00, '2025-08-10', FALSE, 'Serious Python', '978-1-59327-992-9');

-- ------------------------------
-- Loaner Table
-- ------------------------------
INSERT INTO Loaner (customer_name, loan_id) VALUES
('Alice Johnson', 1),
('Bob Smith', 2),
('Carla Gomez', 3),
('David Zhou', 4),
('Ella Ray', 5),
('Franklin Moore', 6),
('Grace Kim', 7),
('Hannah Lee', 8),
('Isaac Patel', 9),
('Janelle Wong', 10);
