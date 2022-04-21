create database guvizenclass;

create table student (
	ID int primary key auto_increment,
    Name varchar(255) not null,
    email varchar(255) unique,
    Company varchar(255) default null,
    College varchar(255),
    BatchID int not null,
    foreign key (BatchID) references batch(BatchID) 
);

insert into student (name,email,company,college,batchid) values ('Susheel','susi31398@gmail.com','Infosys Limited','Mepco',1);
insert into student (name,email,college,batchid) values ('AAA','aaa@gmail.com','AAColege',2);
insert into student (name,email,company,college,batchid) values ('BBB','BBB@gmail.com','BBCompany','BBCollege',4);
insert into student (name,email,company,college,batchid) values ('CCC','CCC@gmail.com',null,'CCCollege',5);

insert into student (name,email,company,college,batchid) values ('DDD','DDD@gmail.com','DDCompany','DDD',6);
insert into student (name,email,college,batchid) values ('EEE','EE@gmail.com','AAColege',1);
insert into student (name,email,company,college,batchid) values ('FFF','FFF@gmail.com','FFCompany','FFCollege',2);
insert into student (name,email,company,college,batchid) values ('GGG','GGG@gmail.com',null,'GGCollege',4);

update student set college='DDCollege' where id='5';

create table Batch (
	BatchID int primary key auto_increment,
    BatchName varchar(255) unique,
    CourseName varchar(255) not null
);

insert into batch (batchname,coursename) values ('B30WETAMIL','FullStackDevelopment');
insert into batch (batchname,coursename) values ('B30WDTAMIL','FronEndDevelopment');
insert into batch (batchname,coursename) values ('B31WETAMIL','BackEndDevelopment');
insert into batch (batchname,coursename) values ('B31WDTAMIL','Database');
insert into batch (batchname,coursename) values ('B32WETAMIL','AutomationTesting');

create table Task (
	StudentID int not null,
    BatchID int not null,
    Pending_Task int default 0,
    Completed_task int default 0,
    AverageMark int default 0,
    foreign key (studentid) references student(id),
    foreign key (batchid) references batch(batchid),
    primary key(studentid,batchid)
);

insert into Task(StudentID,BatchID,Pending_Task,Completed_task,AverageMark) values (1,1,3,10,70);
insert into Task(StudentID,BatchID,Pending_Task,Completed_task,AverageMark) values (1,2,4,9,67);
insert into Task(StudentID,BatchID,Pending_Task,Completed_task,AverageMark) values (2,4,5,6,57);
insert into Task(StudentID,BatchID,Pending_Task,Completed_task,AverageMark) values (4,2,4,9,67);

insert into Task(StudentID,BatchID,Pending_Task,Completed_task,AverageMark) values (5,5,10,0,100),(6,6,9,1,91),(7,1,3,7,30),(8,2,7,3,70),(10,4,0,10,100);

create table mentordetails (
	mentorid int primary key auto_increment,
    mentorname varchar(255) not null,
    mentormailid varchar(255),
    mentorrating enum('1','2','3','4','5') not null
);

create table mentorbatchdetails (
	mentorid int,
    batchid int unique,
    foreign key (batchid) references batch(batchid),
    foreign key (mentorid) references mentordetails(mentorid),
    primary key(mentorid,batchid)
);

insert into mentorbatchdetails values (1,1),(1,2),(2,4);
insert into mentorbatchdetails values (3,5),(4,6);

drop table mentorbatchdetails;

insert into mentordetails (mentorname,mentormailid,mentorrating) values ('MMM','mm@guvi.in',4);

insert into mentordetails (mentorname,mentormailid,mentorrating) values ('ppp','nn@guvi.in',4),('qqq','qq@guvi.in',3),('rrr','rr@guvi.in',4);

select * from batch;
drop table task;

select * from student s inner join batch b on  s.batchid=b.batchid order by s.id;
