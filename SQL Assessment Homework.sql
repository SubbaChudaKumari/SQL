create table students
(
Id int, 
First_name varchar(50),
primary key (id)
);

create table papers
(
Title varchar(50),
Grade int, 
Student_id int,
foreign key (Student_id) references students(Id)
);

insert into students (Id, First_name) values 
(1, 'Caleb'),
(2, 'Samantha'),
(3, 'Raj'),
(4, 'Carlos'),
(5, 'Lisa');

select*from students;

insert into papers (Student_id, Title, Grade) values 
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select*from papers;

#TABLE 1 
create table Table_1
(
select a.First_name,b.Title,b.Grade
from students a inner join papers b
on Id = Student_id
);

#TABLE 2 
create table Table_2
(
select a.First_name,b.Title,b.Grade
from students a left join papers b
on Id = Student_id
);
select*from Table_2;

#TABLE 3
update Table_2 
set Title = 'Missing', Grade = 0
where Title is Null;
select*from Table_2;

#TABLE 4 
create table Table_4
(
select First_name, round(avg(Grade),1) as 'Average' from Table_2 group by First_name
);
select*from Table_4;


#TABLE 5
create table Table_5
(
select First_name, Average, if(Average > 75, "Passing", "Failing") as Passing_status from Table_4
);
select*from Table_5;