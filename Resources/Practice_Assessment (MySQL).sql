Create database BookApp;

Use BookApp;


Create Table Region
(Region_ID Int Not Null Auto_Increment Primary Key,
Region_Name varchar(25));


Create table County
(County_ID Int Not Null Auto_increment Primary Key,
County_Name varchar(40),
Region_ID int,
constraint FK_County Foreign Key (Region_ID) REFERENCES Region(Region_ID));


Create table City
(City_ID Int Not Null auto_increment Primary Key,
City_Name varchar(40),
County_ID int,
constraint FK_City Foreign Key (County_ID) REFERENCES County(County_ID));


Create table Publisher
(Publisher_ID Int Not Null auto_increment Primary Key,
PublisherName varchar(40),
City_ID int, 
PostCode Varchar(10),
Constraint FK_Publisher Foreign Key (City_ID) REFERENCES City(City_ID));


Create Table Book
(Book_ID  Int Not Null auto_increment Primary Key,
Book_Title Varchar(88) Not Null,
Description Varchar(288),
Genre Varchar(30));


Create Table Author
(Author_ID int Not Null auto_increment Primary Key,
Name Varchar(40),
DOB datetime Not Null,
DateFirstBook datetime,
Email varchar(52));


Create Table ABList
(Author_ID int Not Null,
Book_ID int Not Null,
Constraint PK_Aut_Book Primary Key(Author_ID, Book_ID),
Constraint FK_Aut_Book1 Foreign Key (Author_ID) REFERENCES Author(Author_ID),
Constraint FK_Aut_Book2 Foreign Key (Book_ID) REFERENCES Book(Book_ID));



Create Table Edition
(Book_ID int Not Null ,
Date datetime Not Null,
Price int,
BookCover varchar(10),
NoPage int,
Illustration Varchar(5),
ISBN Varchar(40),
Publisher_ID int Not Null ,
Constraint PK_Ed_Date Primary Key(Book_ID, Date), 
Constraint FK_Ed_Date1 Foreign Key (Book_ID) REFERENCES Book(Book_ID),
Constraint FK_Ed_Date2 Foreign Key (Publisher_ID) REFERENCES Publisher(Publisher_ID));


Insert into Region (Region_Name) Values ('North East'); 
Insert into Region (Region_Name) Values ('North West'); 
Insert into Region (Region_Name) Values ('Yorkshire and The Humber');
Insert into Region (Region_Name) Values ('East Midlands'); 
Insert into Region (Region_Name) Values ('West Midlands');
Insert into Region (Region_Name) Values ('East of England');
Insert into Region (Region_Name) Values ('London');
Insert into Region (Region_Name) Values ('South East');
Insert into Region (Region_Name) Values ('South West');

Insert into County (County_Name, Region_ID) Values ('Bedfordshire',6);
Insert into County (County_Name, Region_ID) Values ('Berkshire',8);
Insert into County (County_Name, Region_ID) Values ('Bristol',9);
Insert into County (County_Name, Region_ID) Values ('Buckinghamshire',8);
Insert into County (County_Name, Region_ID) Values ('Cambridgeshire',6);
Insert into County (County_Name, Region_ID) Values ('Cheshire', 2);
Insert into County (County_Name, Region_ID) Values ('Cornwall',9);
Insert into County (County_Name, Region_ID) Values ('County Durham',1);
Insert into County (County_Name, Region_ID) Values ('Cumbria',2);
Insert into County (County_Name, Region_ID) Values ('Derbyshire',4);
Insert into County (County_Name, Region_ID) Values ('Devon',9);
Insert into County (County_Name, Region_ID) Values ('Dorset',9);
Insert into County (County_Name, Region_ID) Values ('East Riding of Yorkshire',3);
Insert into County (County_Name, Region_ID) Values ('East Sussex',8);
Insert into County (County_Name, Region_ID) Values ('Essex',6);
Insert into County (County_Name, Region_ID) Values ('Gloucestershire',9);
Insert into County (County_Name, Region_ID) Values ('Greater London',7);
Insert into County (County_Name, Region_ID) Values ('Greater Manchester',2);
Insert into County (County_Name, Region_ID) Values ('Hampshire',8);
Insert into County (County_Name, Region_ID) Values ('Herefordshire',5);
Insert into County (County_Name, Region_ID) Values ('Hertfordshire',6);
Insert into County (County_Name, Region_ID) Values ('Isle of Wight',8);
Insert into County (County_Name, Region_ID) Values ('Kent',8);
Insert into County (County_Name, Region_ID) Values ('Lancashire',2);
Insert into County (County_Name, Region_ID) Values ('Leicestershire',4);
Insert into County (County_Name, Region_ID) Values ('Lincolnshire',4);
Insert into County (County_Name, Region_ID) Values ('Merseyside',2);
Insert into County (County_Name, Region_ID) Values ('Norfolk',6);
Insert into County (County_Name, Region_ID) Values ('North Yorkshire',1);
Insert into County (County_Name, Region_ID) Values ('Northamptonshire',4);
Insert into County (County_Name, Region_ID) Values ('Northumberland',1);
Insert into County (County_Name, Region_ID) Values ('Nottinghamshire',4);
Insert into County (County_Name, Region_ID) Values ('Oxfordshire',8);
Insert into County (County_Name, Region_ID) Values ('Rutland',4);
Insert into County (County_Name, Region_ID) Values ('Shropshire',5);
Insert into County (County_Name, Region_ID) Values ('Somerset',9);
Insert into County (County_Name, Region_ID) Values ('South Yorkshire',3);
Insert into County (County_Name, Region_ID) Values ('Staffordshire',5);
Insert into County (County_Name, Region_ID) Values ('Suffolk',6);
Insert into County (County_Name, Region_ID) Values ('Surrey',8);
Insert into County (County_Name, Region_ID) Values ('Tyne and Wear',1);
Insert into County (County_Name, Region_ID) Values ('Warwickshire',5);
Insert into County (County_Name, Region_ID) Values ('West Midlands',5);
Insert into County (County_Name, Region_ID) Values ('West Sussex',8);
Insert into County (County_Name, Region_ID) Values ('West Yorkshire',3);
Insert into County (County_Name, Region_ID) Values ('Wiltshire',9);
Insert into County (County_Name, Region_ID) Values ('Worcestershire',5);

Insert into City (City_Name, County_ID) Values ('Leeds', 45);
Insert into City (City_Name, County_ID) Values('Bramley', 45);
Insert into City (City_Name, County_ID) Values('Pudsey', 45);
Insert into City (City_Name, County_ID) Values('Halifax', 45);
Insert into City (City_Name, County_ID) Values('Ripponden', 45);
Insert into City (City_Name, County_ID) Values('Moortown', 45);
Insert into City (City_Name, County_ID) Values('Huddersfield', 45);
Insert into City (City_Name, County_ID) Values('Manchester', 18);
Insert into City (City_Name, County_ID) Values('Liverpool', 27);
Insert into City (City_Name, County_ID) Values('York', 29);
Insert into City (City_Name, County_ID) Values('Birmingham', 42);
Insert into City (City_Name, County_ID) Values('London', 17);
Insert into City (City_Name, County_ID) Values('Newcastle', 41);
Insert into City (City_Name, County_ID) Values('Lincoln', 26);
Insert into City (City_Name, County_ID) Values('Elland', 45);
Insert into City (City_Name, County_ID) Values('Garforth', 45);
Insert into City (City_Name, County_ID) Values('Sheffield', 37);
Insert into City (City_Name, County_ID) Values('Harrogate', 29);
Insert into City (City_Name, County_ID) Values('Dover', 23);
Insert into City (City_Name, County_ID) Values('Scarborough', 29);
Insert into City (City_Name, County_ID) Values('Whitby', 29);
Insert into City (City_Name, County_ID) Values('Bridlington', 29);
Insert into City (City_Name, County_ID) Values('Brighton', 14);
Insert into City (City_Name, County_ID) Values('Derby', 10);
Insert into City (City_Name, County_ID) Values('Kings Lynn', 28);
Insert into City (City_Name, County_ID) Values('Leicester', 25);
Insert into City (City_Name, County_ID) Values('Middlesborough', 29);
Insert into City (City_Name, County_ID) Values('Tottenham', 17);
Insert into City (City_Name, County_ID) Values('Burnley', 24);
Insert into City (City_Name, County_ID) Values('Burley', 19);
Insert into City (City_Name, County_ID) Values('Hull', 13);
Insert into City (City_Name, County_ID) Values('Everton', 27);
Insert into City (City_Name, County_ID) Values('Bournemouth', 19);
Insert into City (City_Name, County_ID) Values('Stoke', 38);
Insert into City (City_Name, County_ID) Values('Norwich', 28);
Insert into City (City_Name, County_ID) Values('Preston', 24);
Insert into City (City_Name, County_ID) Values('Rotherham', 37);
Insert into City (City_Name, County_ID) Values('Swindon', 46);
Insert into City (City_Name, County_ID) Values('Gillingham', 12);
Insert into City (City_Name, County_ID) Values('Charlton', 17);
Insert into City (City_Name, County_ID) Values('Rochdale', 18);
Insert into City (City_Name, County_ID) Values('Millwall', 17);
Insert into City (City_Name, County_ID) Values('Oldam', 18);
Insert into City (City_Name, County_ID) Values('Fleetwood', 24);
Insert into City (City_Name, County_ID) Values('Colchester', 15);
Insert into City (City_Name, County_ID) Values('Blackpool', 24);
Insert into City (City_Name, County_ID) Values('Yeovil', 36);
Insert into City (City_Name, County_ID) Values('Cheltenham', 16);
Insert into City (City_Name, County_ID) Values('Mansfield', 32);

Insert into Book (Book_Title, Description, Genre) Values ('Introduction to Algorithms ', 'Algorithms', 'Programming');
Insert into Book (Book_Title, Description, Genre) Values ('Structure and Interpretation of Computer Programs ', 'The structure of a program', 'Programming');
Insert into Book (Book_Title, Description, Genre) Values ('The C Programming Language ', 'Everything about C', 'Programming');
Insert into Book (Book_Title, Description, Genre) Values ('The Art of Computer Programming, Volumes 1-3', 'The bible of programming', 'Programming');
Insert into Book (Book_Title, Description, Genre) Values ('Design Patterns: Elements of Reusable Object-Oriented Software ', 'OOP', 'Programming');
Insert into Book (Book_Title, Description, Genre) Values ('How Computers Work (How It Works) ', 'Look inside of a computer', 'Computers');
Insert into Book (Book_Title, Description, Genre) Values ('Lift-the-Flap Computers and Coding ', 'How to code', 'Computers');
Insert into Book (Book_Title, Description, Genre) Values ('Endless Night', 'Endless Night', 'Crime');
Insert into Book (Book_Title, Description, Genre) Values ('A Farewell to Arms', 'A Farewell to Arms', 'Non-fiction');
Insert into Book (Book_Title, Description, Genre) Values ('The Golden Apples of the Sun', 'The Golden Apples of the Sun', 'Science fiction');
Insert into Book (Book_Title, Description, Genre) Values ('The Mirror Cracked from Side to Side', 'The Mirror Cracked from Side to Side', 'Crime');
Insert into Book (Book_Title, Description, Genre) Values ('Moab Is My Washpot', 'Moab Is My Washpot', 'Satire');
Insert into Book (Book_Title, Description, Genre) Values ('Postern of Fate', 'Postern of Fate', 'Crime');
Insert into Book (Book_Title, Description, Genre) Values ('The Proper Study', 'The Proper Study', 'Science');
Insert into Book (Book_Title, Description, Genre) Values ('The Skull Beneath the Skin', 'The Skull Beneath the Skin', 'Mystery');
Insert into Book (Book_Title, Description, Genre) Values ('The Sun Also Rises', 'The Sun Also Rises', 'Non-fiction');
Insert into Book (Book_Title, Description, Genre) Values ('Surprised by Joy', 'Surprised by Joy', 'Autobiographies');
Insert into Book (Book_Title, Description, Genre) Values ('That Hideous Strength', 'That Hideous Strength', 'Journals');
Insert into Book (Book_Title, Description, Genre) Values ('Tiger! Tiger!', 'Tiger! Tiger!', 'Childrens');
Insert into Book (Book_Title, Description, Genre) Values ('Harry Potter', 'Harry Potter', 'Adventure');

Insert into Publisher (PublisherName, City_ID, PostCode) Values ('MIT', 4, 'LQ91 0JK');
Insert into Publisher (PublisherName, City_ID, PostCode) Values ('Alfresco Press', 1, 'V5M 2WB');
Insert into Publisher (PublisherName, City_ID, PostCode) Values ('Garamond Press', 44, 'I5 4JT');
Insert into Publisher (PublisherName, City_ID, PostCode) Values ('Pearson', 23, 'D2V 7QV');
Insert into Publisher (PublisherName, City_ID, PostCode) Values ('Floricanto Press', 16, 'W4 4RC');
Insert into Publisher (PublisherName, City_ID, PostCode) Values ('Penguin', 44, 'R5 6HZ');
Insert into Publisher (PublisherName, City_ID, PostCode) Values ('Bracket Books', 18, 'YV58 6EX');
Insert into Publisher (PublisherName, City_ID, PostCode) Values ('Bloomsbury ', 9, 'L97 8UH');
Insert into Publisher (PublisherName, City_ID, PostCode) Values ('Potters Field Press', 29, 'U27 7PX');
Insert into Publisher (PublisherName, City_ID, PostCode) Values ('City Press', 4, 'O20 1YR');

Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Thomas H. Cormen ', '1944-01-24', '1990-07-10','Phasellus.dapibus@nonlobortis.net');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('C Leiserson', '1955-07-23', '2002-01-02','nunc.sed@non.com');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('C Stein', '1926-12-25', '1973-06-10','sapien.gravida.non@laoreetliberoet.com');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('R Rivest', '1933-11-14', '1980-04-30','faucibus.Morbi@tempor.co.uk');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Harold Abelson ', '1970-12-16', '2014-06-02','dis@risusNulla.org');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Brian W. Kernighan ', '1932-07-14', '1978-12-29','non@velpede.edu');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Donald Ervin Knuth ', '1932-01-15', '1978-07-01','mattis.ornare.lectus@necurna.org');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Erich Gamma ', '1955-01-01', '2001-06-18','Quisque@ligula.co.uk');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Ron White', '1944-01-24', '1990-07-10','faucibus.id.libero@eutempor.ca');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Timothy Edward Downs', '1955-07-23', '2002-01-07','elit.dictum@tincidunt.uk');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Rosie Dickins', '1926-12-25', '2014-06-02','enim@Duiselementumdui.net');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Shaw Nielsen', '1933-11-14', '1980-04-30','risus.Duis@Quisque.edu');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Agatha Christie', '1970-12-16', '1957-06-01','Praesent.eu.dui@urna.net');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Ernest Hemingway', '1932-07-14', '1978-12-29','sit.amet@maurisipsumporta.org');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Ray Bradbury', '1932-01-15', '1978-07-01','Donec.egestas.Aliquam@ante.org');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Stephen Fry', '1955-01-01', '2014-06-02','arcu@nonhendrerit.edu');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Isaac Asimov', '1955-07-23', '1990-07-10','mus.Donec@liberoProin.co.uk');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('P. D. James', '1926-12-25', '2002-01-07','mi.lacinia.mattis@erosNam.org');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('C. S. Lewis', '1933-11-14', '2013-06-19','Nunc.ut@Pellentesquetincidunttempus.edu');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('Rudyard Kipling', '1977-05-16', '1980-04-30','non.sapien.molestie@Donecvitaeerat.org');
Insert into Author (Name, DOB, DateFirstBook, Email) Values ('J K Rowling', '1970-12-16', '2000-07-31','enim.grav@harrypotter.uk');

Insert into ABList (Book_ID, Author_ID) Values (1, 1);
Insert into ABList (Book_ID, Author_ID) Values (1, 2);
Insert into ABList (Book_ID, Author_ID) Values (1, 3);
Insert into ABList (Book_ID, Author_ID) Values (1, 4);
Insert into ABList (Book_ID, Author_ID) Values (2, 5);
Insert into ABList (Book_ID, Author_ID) Values (3, 6);
Insert into ABList (Book_ID, Author_ID) Values (4, 7);
Insert into ABList (Book_ID, Author_ID) Values (5, 8);
Insert into ABList (Book_ID, Author_ID) Values (6, 9);
Insert into ABList (Book_ID, Author_ID) Values (6, 10);
Insert into ABList (Book_ID, Author_ID) Values (7, 11);
Insert into ABList (Book_ID, Author_ID) Values (7, 12);
Insert into ABList (Book_ID, Author_ID) Values (8, 13);
Insert into ABList (Book_ID, Author_ID) Values (9, 14);
Insert into ABList (Book_ID, Author_ID) Values (10, 15);
Insert into ABList (Book_ID, Author_ID) Values (11, 13);
Insert into ABList (Book_ID, Author_ID) Values (12, 16);
Insert into ABList (Book_ID, Author_ID) Values (13, 13);
Insert into ABList (Book_ID, Author_ID) Values (14, 17);
Insert into ABList (Book_ID, Author_ID) Values (15, 18);
Insert into ABList (Book_ID, Author_ID) Values (16, 14);
Insert into ABList (Book_ID, Author_ID) Values (17, 19);
Insert into ABList (Book_ID, Author_ID) Values (18, 19);
Insert into ABList (Book_ID, Author_ID) Values (19, 20);
Insert into ABList (Book_ID, Author_ID) Values (20, 21);

Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (1, '2009-08-20', 1,35, 'Paperback',568,'yes','388D9B18');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (2, '2001-10-12', 2,23, 'Paperback',34,'no','9F3F0163');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (3, '2000-08-02', 3,13, 'Paperback',33,'yes','5545A93B');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (4, '1997-07-07', 4,44, 'Hardback',677,'no','E9270A45');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (4, '2005-02-14', 4,22, 'Paperback',680,'no','BF292931');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (4, '2011-01-12', 4,6, 'Hardback',679,'yes','6A1A6DBF');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (4, '2001-03-03', 4,13, 'Hardback',688,'yes','1E9DA7AB');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (4, '2015-12-08', 4,6, 'Paperback',680,'no','4DCC2789');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (5, '2016-04-05', 2,22, 'Paperback',45,'no','8117A42F');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (6, '2016-08-01', 3,21, 'Paperback',123,'no','B2CF93ED');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (7, '2000-07-08', 3,12, 'Paperback',103,'no','F425968E');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (8, '1999-12-18', 2,14, 'Hardback',112,'no','1CE4354E');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (9, '2001-01-16', 2,5, 'Paperback',89,'yes','8F31CEAE');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (10, '1988-10-12', 2,8, 'Hardback',79,'yes','2D04ABEB');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (11, '2004-05-19', 5,9, 'Hardback',76,'no','8C34A2F0');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (12, '2003-02-06', 6,19, 'Paperback',146,'no','587817DE');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (13, '1998-04-28', 7,17, 'Paperback',63,'yes','5EA7A40B');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (14, '2013-08-10', 2,7, 'Paperback',89,'no','F98C6B5E');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (15, '2006-07-20', 6,4, 'Paperback',88,'yes','4C44EAD7');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (16, '1984-02-28', 3,14, 'Hardback',39,'no','A1912F37');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (17, '2005-06-18', 3,6, 'Paperback',105,'yes','975D231B');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (18, '2014-10-21', 5,16, 'Hardback',29,'no','FE5CECA3');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (19, '2008-09-29', 7,7, 'Hardback',166,'no','DBF72049');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (20, '2000-07-31', 8,89, 'Paperback',204,'yes','41FC2D7D');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (20, '2005-07-31', 8,45, 'Hardback',199,'yes','AEE25977');
Insert into Edition (Book_ID, Date, Publisher_ID, Price, BookCover, NoPage, Illustration, ISBN) Values (20, '2015-07-31', 9,68, 'Hardback',302,'yes','C5AF3080');
