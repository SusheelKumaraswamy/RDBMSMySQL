create database guvi;

drop table student;

create table guvi.student (ID int auto_increment,name varchar(255),email varchar(255),Address ENUM('Chennai','Banglore'),primary key(ID));

insert into student (name,email,address) values ('Susheel','susi31398@gmail.com','Chennai');

select * from student;

update guvi.student set name='Kumaraswamy' ,email='kumar@gmail.com' where id=3;

create table mark (
	markid int primary key auto_increment,
    studentid int,
    studentname varchar(255),
    marks int,
    foreign key (studentid) references student(id)
   -- foreign key (studentname) references student(name)
);

select * from student;

insert into mark(studentid,studentname,marks) values(1,'Susheel',100);
insert into mark(studentid,studentname,marks) values(3,'kumaraswamy',100);
insert into mark(studentid,studentname,marks) values(2,'AAA',100);

select * from student where id in (select studentid from mark where marks>=100);
select * from student s inner join mark m on s.id=m.studentid;
select * from student s left join mark m on s.id=m.studentid;
select * from student s right join mark m on s.id=m.studentid;