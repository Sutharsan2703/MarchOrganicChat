create sequence seq_id start with 1000 increment by 1;
create sequence seq_id2 start with 2000 increment by 1;
create sequence seq_id3 start with 3000 increment by 1;
create sequence seq_id4 start with 4000 increment by 1;
create sequence seq_id5 start with 5000 increment by 1;
create sequence seq_id6 start with 6000 increment by 1;
create sequence seq_id3 start with 3000 increment by 1;
create sequence seq_id4 start with 4000 increment by 1;
create sequence seq_id5 start with 5000 increment by 1;
create sequence seq_id6 start with 6000 increment by 1;


CREATE TABLE register
(
  name VARCHAR(30) NOT NULL,
  mailId VARCHAR(30) NOT NULL,
  userId number NOT NULL,
  userName VARCHAR(30) NOT NULL,
  security VARCHAR(50) NOT NULL,
  password number(25) NOT NULL,
  confirmPassword number(25) NOT NULL,
  loginDate DATE NOT NULL,
  PRIMARY KEY (userName),
  UNIQUE (mailId)
);



--alter table register modify userId number generated always as ('seq_id.nextval');
  
insert into register (name,mailId,userId,userName,security,password,confirmPassword,logindate)values('Abcde','abc@de.com',seq_id.nextval,'abc1001','kit','621112','621112',to_date('sep-11-2022','mm-dd-yyyy'));
select * from register;
insert into register (name,mailId,userId,userName,security,password,confirmPassword,logindate)values('cbaed','cba@ed.com',seq_id.nextval,'abc1002','kit',621113,621113,to_date('11-dec-2022','dd-mm-yyyy'));
insert into register (name,mailId,userId,userName,security,password,confirmPassword,logindate)values('baced','bac@ed.com',seq_id.nextval,'abc1003','tik',621113,621113,to_date('11-october-2022','dd-mm-yyyy'));



CREATE TABLE personal
(
  userName VARCHAR(30) NOT NULL,
  loginTime TIMESTAMP with local time zone not null ,
  reqStatus VARCHAR(30) NOT NULL,
  messageId number(10) NOT NULL,
 -- userName VARCHAR(30) NOT NULL,
  PRIMARY KEY (messageId),
  FOREIGN KEY (userName) REFERENCES register(userName)
);

insert into personal (userName,loginTime,reqStatus,messageId)values('abc1001',localtimestamp,'Yes',seq_id2.nextval);
insert into personal (userName,loginTime,reqStatus,messageId)values('abc1002',localtimestamp,'No',seq_id2.nextval);
insert into personal (userName,loginTime,reqStatus,messageId)values('abc1003',localtimestamp(4),'No',seq_id2.nextval);

select * from personal;


CREATE TABLE send
(
  userName VARCHAR(30) NOT NULL,
  reqStatus VARCHAR(30) NOT NULL,
  message VARCHAR(1000) NOT NULL,
  messageDate DATE NOT NULL,
  selectUser VARCHAR(30) NOT NULL,
  messageId number(10) NOT NULL,
 -- userName VARCHAR(30) NOT NULL,
  FOREIGN KEY (messageId) REFERENCES personal(messageId),
  FOREIGN KEY (userName) REFERENCES register(userName)
);

insert into send(userName,reqStatus,message,messagedate,selectUser,messageId)values
('abc1001','yes','Welcome user to Enjoy your Experience on making and Sharing Your Thoughts as a message',localtimestamp,'abc1002',2010);

select * from send;



CREATE TABLE receive
(
  userName VARCHAR(30) NOT NULL,
  reqStatus VARCHAR(30) NOT NULL,
  message VARCHAR(1000),
  messageDate DATE NOT NULL,
  messageId number(10) NOT NULL,
 --userName VARCHAR(30) NOT NULL,
  FOREIGN KEY (messageId) REFERENCES personal(messageId),
  FOREIGN KEY (userName) REFERENCES register(userName)
);

insert into receive (userName,reqStatus,message,messagedate,messageId)values('abc1002','yes','Welcome user to Enjoy your Experience on making and Sharing Your Thoughts as a message',to_date('26-12-2022','dd-mm-yyyy'),2012);

select * from receive;



CREATE TABLE commune
(
  communeName VARCHAR(30) NOT NULL,
  communeId number NOT NULL,
 -- members VARCHAR(30) NOT NULL,
  password number NOT NULL,
  userName VARCHAR(20) NOT NULL,
 dateOfCreation timestamp with local time zone,
  PRIMARY KEY (communeId),
  FOREIGN KEY (userName) REFERENCES register(userName),
  UNIQUE (communeName)
);

insert into commune (communeName,communeId,password,userName,dateOfCreation)values
('Welcome Users',seq_id3.nextval,1,'abc1001',localtimestamp);

select * from commune;




CREATE TABLE message
(
  message VARCHAR(1000) NOT NULL,
  messageTime timestamp with local time zone,
 -- from VARCHAR NOT NULL,
  communeId number NOT NULL,
  UserName VARCHAR(30) NOT NULL,
  FOREIGN KEY (communeId) REFERENCES Commune(communeId),
  FOREIGN KEY (userName) REFERENCES register(userName)
);

insert into message (message,messageTime,communeId,userName) values
('Welcome Users to the Commune ',localtimestamp,3000,'abc1001');
insert into message (message,messageTime,communeId,userName) values
('Have Your Thoughts With Your Teams ',localtimestamp,3000,'abc1001');

select message,messageTime,communeId,userName from message;
select message from message where userName='abc1001';
select message from message order by messageTime asc;
select message from message order by messageTime desc;



CREATE TABLE report
(
  reportId number NOT NULL,
  reportDate DATE NOT NULL,
  reportUserName VARCHAR(30) NOT NULL,
  reportContent VARCHAR(250) NOT NULL,
  communeId number ,
  userName VARCHAR(30) NOT NULL,
  messageId number(10) ,
  PRIMARY KEY (reportId),
  FOREIGN KEY (communeId) REFERENCES Commune(communeId),
  FOREIGN KEY (userName) REFERENCES register(userName),
  FOREIGN KEY (messageId) REFERENCES personal(messageId)
);



insert into report (reportId,reportDate,reportUserName,reportContent,communeId,userName,messageId) values
(SEQ_ID4.nextval,to_date('27-dec-2022','dd-mm-yyyy'),'abc001','(sample)Wrong Mention ',3000,'abc1001','');

select reportId,reportDate,reportUserName,reportContent,communeId,userName,messageId from report;

CREATE TABLE Admin
(
  petitioner VARCHAR(30) NOT NULL,
  reqStatus VARCHAR(30) NOT NULL,
 -- viewId INT NOT NULL,
  reason VARCHAR(50) NOT NULL,
  suspect VARCHAR(30) NOT NULL,
  suspectedMessage VARCHAR(1000) NOT NULL,
  recommend VARCHAR(250),
  actionTaken VARCHAR(250),
  reportId number NOT NULL,
  userName VARCHAR(30) NOT NULL,
  messageId number(10) ,
  communeId number ,
  FOREIGN KEY (reportId) REFERENCES Report(reportId),
  FOREIGN KEY (userName) REFERENCES register(userName),
  FOREIGN KEY (messageId) REFERENCES personal(messageId),
  FOREIGN KEY (communeId) REFERENCES Commune(communeId)
);


insert into admin(petitioner,reqStatus,reason,suspect,suspectedMessage,recommend,actionTaken,reportId,userName,messageId,communeId) values
('abc1002','pending','Wrong Mention','abc001','(sample)Wrong Mention ','','',4001,'abc1003','',3000);

insert into admin(petitioner,reqStatus,reason,suspect,suspectedMessage,recommend,actionTaken,reportId,userName,messageId,communeId) values
(' abc1002 ',' On Progress ',' Wrong Mention ',' abc001 ',' (sample)Wrong Mention ',' user been mentioned wrong ','',4001,'abc1003','',3000);


insert into admin(petitioner,reqStatus,reason,suspect,suspectedMessage,recommend,actionTaken,reportId,userName,messageId,communeId) values
('abc1002','Decision Made!','Wrong Mention','abc001','(sample)Wrong Mention ','user been mentioned wrong','User Mention Removed',4001,'abc1003','',3000);

select petitioner,reqStatus,reason,suspect,suspectedMessage,recommend,actionTaken,reportId,userName,messageId,communeId from admin;

select actionTaken from admin where reqStatus ='Decision Made!';
select actionTaken,reqStatus from admin where reqStatus ='Decision Made!';


drop table register;
drop table personal;
drop table receive;
drop table send;
drop table commune;
drop table message;
drop table report;
drop table admin;