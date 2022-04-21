select * from task;
select * from batch;
select * from student;
select * from mentordetails;
select * from mentorbatchdetails;

update task set Pending_Task=0,Completed_task=10 where studentid=5 and batchid=5;
delete from mentordetails where mentorid=6;

select id,name,email,batchname,s.batchid,b.coursename,mentorname from 
	student s join batch b on s.batchid=b.batchid
    join mentorbatchdetails mb on b.batchid=mb.batchid
    join mentordetails md on mb.mentorid=md.mentorid;