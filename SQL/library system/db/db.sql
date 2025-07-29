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
    ExpDate VARCHAR(20),
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