create sequence SEQ_ID start with 1000 increment by 1;
create sequence SEQ_ID2 start with 2000 increment by 1;
create sequence SEQ_ID3 start with 3000 increment by 1;
create sequence SEQ_ID4 start with 4000 increment by 1;
--drop SEQUENCE seq_id4;
create sequence SEQ_ID5 start with 5000 increment by 1;
create sequence SEQ_ID6 start with 6000 increment by 1;
create sequence SEQ_ID3 start with 3000 increment by 1;
create sequence SEQ_ID4 start with 4000 increment by 1;
create sequence SEQ_ID5 start with 5000 increment by 1;
create sequence SEQ_ID6 start with 6000 increment by 1;

create sequence SEQ_ID10 start with 100001 increment by 1;
create sequence COMMUNESEQ start with 20001 increment by 1;

create table register
(
  name varchar(30) not null,
  MAILID varchar(30) not null,
  USERID number not null,
  USERNAME varchar(30) ,
  security varchar(50) ,
  password number(25) ,
  CONFIRMPASSWORD number(25),
  LOGINDATE  timestamp with local time zone,  
  primary key (USERNAME),
  unique (MAILID)
);
commit;
--select count(1) from register where security!='travel';
--select count(1)  username_S  from register  where username like 's%' ;
select * from register;
update register set password=12345678 , CONFIRMPASSWORD=12345678 where MAILID ='talk@chainsys.com';
select count( distinct password ) from register ;

--delete from register where  name='all';

------------------Practice-------------
select concat(SUBSTR(MAILID,1,4),USERID) UNAME from register where name like '%';

select concat(SUBSTR(MAILID,1,4),USERID) as USERNAME from SUBREGISTER;
insert into register (name,MAILID,USERID,security,password,CONFIRMPASSWORD,LOGINDATE)values('aaa','aaa@mail.com',SEQ_ID.nextval,'sec','123456','123456',LOCALTIMESTAMP);
insert into register (name,MAILID,USERID,security,password,CONFIRMPASSWORD,LOGINDATE)values('bbb','ddd@mail.com',SEQ_ID.nextval,'sec','123456','123456',LOCALTIMESTAMP);
insert into register (name,MAILID,USERID,security,password,CONFIRMPASSWORD,LOGINDATE)values('ccc','ccc@mail.com',SEQ_ID.nextval,'sec','123456','123456',LOCALTIMESTAMP);
insert into register (name,MAILID,USERID,security,password,CONFIRMPASSWORD,LOGINDATE)values('ddd','bbb@mail.com',SEQ_ID.nextval,'sec','123456','123456',LOCALTIMESTAMP);

create table SUBREGISTER 
  as (select USERNAME from register);
  
  select USERNAME from SUBREGISTER;


---------------------------------------To Update The User Name by Merging Two Columns------

update register set USERNAME=concat(SUBSTR(MAILID,1,4),USERID) where USERNAME ='Admin';
---select concat(concat(substr(mailid,5),concat(substr(userid,-4)))) as userName from register where userid =2047;

select name,MAILID,USERID,concat(SUBSTR(MAILID,1,4),USERID) as UNAME,security,password, LOGINDATE from register;

--insert into subregister (name,mailId,userId,security,password,confirmPassword,logindate)values('aaa','aaa@mail.com',seq_id.nextval,'sec','123456','123456',localtimestamp);

create table REG
  as (select * from register);

create table REG
  as (select USERID,LOGINDATE from register);
select * from REG;
drop table REG;

---------------------------------------------------------------------------------------------

select * from register;
--drop table register;


insert into register as(select name,MAILID,USERID, security,password,CONFIRMPASSWORD,LOGINDATE from SUBREGISTER);

insert into register (name,MAILID,USERID, USERNAME,security,password,CONFIRMPASSWORD,LOGINDATE)values('admin','admin@chainsys.com',1000,(select concat(SUBSTR(MAILID,1,4),USERID)as USERNAME from register),'control',600095,600095,LOCALTIMESTAMP);



select name,MAILID,USERID,security,password,CONFIRMPASSWORD,LOGINDATE from SUBREGISTER;
select name,MAILID,USERID,concat(SUBSTR(MAILID,1,4),USERID) as UNAME,security,password, LOGINDATE from SUBREGISTER;

insert into register (name,MAILID,USERID,concat(concat(SUBSTR(MAIL_ID,5),concat(SUBSTR(USER_ID,-4))) as USERNAME,security,password,CONFIRMPASSWORD,LOGINDATE)values(?,?,SEQ_ID.nextval,?,?,?,?,LOCALTIMESTAMP)
--alter table register modify userId number generated always as ('seq_id.nextval');
-------------------------------------------------------------------------------------------------------------------concat('+91-',concat(substr(contact_no,1,3),concat('-',concat(substr(contact_no,4,3),concat('-',substr(contact_no,-4)))))) as contact_isd
insert into register (name,MAILID,USERID,USERNAME,security,password,CONFIRMPASSWORD,LOGINDATE)values('admin3','admin3@chainsys.com',SEQ_ID.nextval,concat(concat(SUBSTR(MAIL_ID,5),concat(SUBSTR(USER_ID,-4),'support',600095,600095,LOCALTIMESTAMP);
  
insert into register (name,MAILID,USERID, USERNAME,security,password,CONFIRMPASSWORD,LOGINDATE)values('admin','admin@chainsys.com',1000,'Admin','control',600095,600095,LOCALTIMESTAMP);
select * from register;

--update register set username=CONCAT(substr(mailid,1,4),userid) where mailId = 'greencomet@chainsys.com';





insert into register (name,MAILID,USERID,USERNAME,security,password,CONFIRMPASSWORD,LOGINDATE)values('admin2','admin2@chainsys.com',SEQ_ID.nextval,'admin2','support',600095,600095,LOCALTIMESTAMP);
--insert into register (name,mailId,userId,userName,security,password,confirmPassword,logindate)values('baced','bac@ed.com',seq_id.nextval,'abc1003','tik',621113,621113,to_date('11-october-2022','dd-mm-yyyy'));
--insert into register (name,mailId,userId,userName,security,password,confirmPassword,logindate)values('baced','acb@ed.com',seq_id.nextval,'abc1004','tik',621114,621114,'11-12-22');


create table PERSONAL
(
  SENDER varchar(30) not null,
 RECEIVER varchar(30) not null,
 MESSAGETIME timestamp with local time zone not null ,
  REQSTATUS varchar(30) not null,
  MESSAGE varchar(1000) not null,
  MESSAGEID number(10) not null,
 -- userName VARCHAR(30) NOT NULL,
  primary key (MESSAGEID),
  foreign key (SENDER) references register(USERNAME),
foreign key (RECEIVER) references register(USERNAME)
);

insert into PERSONAL (SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,MESSAGEID)values('wall2089','frog2082',LOCALTIMESTAMP,'Yes','Passing test message with receiver',SEQ_ID3.nextval);
insert into PERSONAL (SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,MESSAGEID)values('wall2089','frog2082',LOCALTIMESTAMP,'Yes','Passing test message with receiver',SEQ_ID10.nextval);
select SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,MESSAGEID from PERSONAL;
select * from PERSONAL;
--insert into personal (sender,receiver,messageTime,reqStatus,message,messageId)values('wall2089','frog2082',localtimestamp,'Sending message','Trails on spring',seq_id10.nextval);

--(select sender, message, messageTime,messageId from personal )and update personal set reqStatus='Received' where receiver='frog2082' ;

--select sender, message, messageTime,messageId from personal  update personal set reqStatus='Received' where receiver='frog2082' ;
select SENDER, MESSAGE, MESSAGETIME,MESSAGEID from PERSONAL where  RECEIVER = 'frog2082';
--Query check --
--update personal set reqStatus='Received' where receiver in (select receiver from personal where receiver ='frog2082');


--update personal set personal.reqstatus='Received' =(select personal.sender, personal.message, personal.messageTime,personal.messageId from  personal
--where personal.receiver='frog2082';

--update personal set reqstatus='Received' where receiver in (select sender,message,messageTime,messageId from  personal where receiver='frog2082');










---------------------------------------------Send Table Not Exists----(not required)-----------
create table SEND
(
  SENDER varchar(30) not null,
  REQSTATUS varchar(30) not null,
  MESSAGE varchar(1000) not null,
  MESSAGEDATE date not null,
  RECEIVER varchar(30) not null,
  MESSAGEID number(10) not null,
 -- userName VARCHAR(30) NOT NULL,
  foreign key (MESSAGEID) references PERSONAL(MESSAGEID),
  foreign key (SENDER) references register(USERNAME),
foreign key (RECEIVER) references register(USERNAME)
);

insert into SEND(SENDER,REQSTATUS,MESSAGE,MESSAGEDATE,RECEIVER,MESSAGEID)values
('wall2089','yes','Welcome user to Enjoy your Experience on making and Sharing Your Thoughts as a message',LOCALTIMESTAMP,'frog2082',2080);
insert into SEND(SENDER,REQSTATUS,MESSAGE,MESSAGEDATE,RECEIVER,MESSAGEID)values
('wall2089','no','Welcome user to Enjoy your Experience on making and Sharing Your Thoughts as a message',LOCALTIMESTAMP,'frog2082',2081);
update SEND set REQSTATUS ='received' where MESSAGEID=2081; 
select MESSAGE from SEND where MESSAGEID = 2081 and RECEIVER ='frog2082';

select * from SEND;

-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------Send Table Not Exists----(not required)--------------------------------------
create table RECEIVE
(
  SENDER varchar(30) not null,
  RECEIVER varchar(30) not null,
  REQSTATUS varchar(30) not null,
  MESSAGE varchar(1000),
  MESSAGEDATE date not null,
  MESSAGEID number(10) not null,
 --userName VARCHAR(30) NOT NULL,
  foreign key (MESSAGEID) references PERSONAL(MESSAGEID),
  foreign key (SENDER) references register(USERNAME),
  foreign key (RECEIVER) references register(USERNAME)
);

insert into RECEIVE (SENDER,RECEIVER,REQSTATUS,MESSAGE,MESSAGEDATE,MESSAGEID)values('wall2089','frog2082','yes','Welcome user to Enjoy your Experience on making',LOCALTIMESTAMP,2081);

select * from RECEIVE;
-------------------------------------------------------------------------------------------------------------------------


create table COMMUNE
(
  COMMUNENAME varchar(30) not null,
  COMMUNEID number not null,
 -- members VARCHAR(30) NOT NULL,
  password number not null,
  MEMBERS varchar(20) not null,
  MEMBERNAME varchar(20) not null,
 DATEOFCREATION timestamp with local time zone,
  primary key (COMMUNEID),
  foreign key (MEMBERS) references register(USERNAME),
  unique (COMMUNENAME,MEMBERNAME)
);

insert into COMMUNE (COMMUNENAME,COMMUNEID,password,MEMBERS,MEMBERNAME,DATEOFCREATION)values
('Welcome users',SEQ_ID4.nextval,1,'wall2089','Neo wall',LOCALTIMESTAMP);
--drop sequence seq_id4;
select * from COMMUNE;




create table MESSAGE
(
  COMMUNEID number not null,
  SENDER varchar(30) not null,
  MESSAGE varchar(1000) not null,
  MESSAGETIME timestamp with local time zone,
  VIEWEDBY varchar(20) ,
  foreign key (COMMUNEID) references COMMUNE(COMMUNEID)
 -- FOREIGN KEY (sender) REFERENCES commune(memberName)
);
--------------------------------------------------------------------------------------------------
insert into MESSAGE (MESSAGE,MESSAGETIME,COMMUNEID,USERNAME) values
('Welcome Users to the Commune ',LOCALTIMESTAMP,3000,'abc1001');
insert into MESSAGE (MESSAGE,MESSAGETIME,COMMUNEID,USERNAME) values
('Have Your Thoughts With Your Teams ',LOCALTIMESTAMP,3000,'abc1001');
----------------------------------------------------------------------------------------------------
insert into MESSAGE (COMMUNEID,SENDER,MESSAGE,MESSAGETIME,VIEWEDBY) values
(4000,'Neo wall','Welcome user`s to the group',LOCALTIMESTAMP,'');
select MESSAGE,MESSAGETIME,COMMUNEID,SENDER from MESSAGE;
--select message from message where userName='abc1001';
select MESSAGE from MESSAGE where SENDER='Neo wall';

select MESSAGE from MESSAGE order by MESSAGETIME asc;
select MESSAGE from MESSAGE order by MESSAGETIME desc;



create table report
(
  REPORTID number not null,
  REPORTDATE timestamp with local time zone,
  REPORTUSERNAME varchar(30) not null,
  REPORTCONTENT varchar(250) not null,
 -- communeId number ,
  USERNAME varchar(30) not null,
  MESSAGEID number(10) ,
  REPORTSTATUS varchar(30),
  primary key (REPORTID),
 -- FOREIGN KEY (communeId) REFERENCES Commune(communeId),
  foreign key (USERNAME) references register(USERNAME),
  foreign key (MESSAGEID) references PERSONAL(MESSAGEID)
);



insert into report (REPORTID,REPORTDATE,REPORTUSERNAME,REPORTCONTENT,COMMUNEID,USERNAME,MESSAGEID,REPORTSTATUS) values
(SEQ_ID4.nextval,to_date('27-dec-2022','dd-mm-yyyy'),'abc001','(sample)Wrong Mention ',3000,'abc1001','');
select * from report;
insert into report (REPORTID,REPORTDATE,REPORTUSERNAME,REPORTCONTENT,COMMUNEID,USERNAME,MESSAGEID) values
(SEQ_ID4.nextval,'09-01-23','frog2082','(sample)Wrong Mention ','','wall2089',3062);

select REPORTID,REPORTDATE,REPORTUSERNAME,REPORTCONTENT,COMMUNEID,USERNAME,MESSAGEID from report;

create table admin
(
  PETITIONER varchar(30) not null,
  REQSTATUS varchar(30) not null,
 -- viewId INT NOT NULL,
  REASON varchar(50) not null,
  SUSPECT varchar(30) not null,
  SUSPECTEDMESSAGE varchar(1000) not null,
  RECOMMEND varchar(250),
  ACTIONTAKEN varchar(250),
  REPORTID number not null,
  USERNAME varchar(30) not null,
  MESSAGEID number(10) ,
  COMMUNEID number ,
  foreign key (REPORTID) references report(REPORTID),
  foreign key (USERNAME) references register(USERNAME),
  foreign key (MESSAGEID) references PERSONAL(MESSAGEID),
  foreign key (COMMUNEID) references COMMUNE(COMMUNEID)
);


insert into admin(PETITIONER,REQSTATUS,REASON,SUSPECT,SUSPECTEDMESSAGE,RECOMMEND,ACTIONTAKEN,REPORTID,USERNAME,MESSAGEID,COMMUNEID) values
('abc1002','pending','Wrong Mention','abc001','(sample)Wrong Mention ','','',4001,'abc1003','',3000);

insert into admin(PETITIONER,REQSTATUS,REASON,SUSPECT,SUSPECTEDMESSAGE,RECOMMEND,ACTIONTAKEN,REPORTID,USERNAME,MESSAGEID,COMMUNEID) values
(' abc1002 ',' On Progress ',' Wrong Mention ',' abc001 ',' (sample)Wrong Mention ',' user been mentioned wrong ','',4001,'abc1003','',3000);


insert into admin(PETITIONER,REQSTATUS,REASON,SUSPECT,SUSPECTEDMESSAGE,RECOMMEND,ACTIONTAKEN,REPORTID,USERNAME,MESSAGEID,COMMUNEID) values
('abc1002','Decision Made!','Wrong Mention','abc001','(sample)Wrong Mention ','user been mentioned wrong','User Mention Removed',4001,'abc1003','',3000);

insert into admin(PETITIONER,REQSTATUS,REASON,SUSPECT,SUSPECTEDMESSAGE,RECOMMEND,ACTIONTAKEN,REPORTID,USERNAME,MESSAGEID,COMMUNEID) values
('abc1002','Decision Made!','Wrong Mention','abc001','(sample)Wrong Mention ','user been mentioned wrong','User Mention Removed',4001,'abc1003','',3000);



select PETITIONER,REQSTATUS,REASON,SUSPECT,SUSPECTEDMESSAGE,RECOMMEND,ACTIONTAKEN,REPORTID,USERNAME,MESSAGEID,COMMUNEID from admin;

select ACTIONTAKEN from admin where REQSTATUS ='Decision Made!';
select ACTIONTAKEN,REQSTATUS from admin where REQSTATUS ='Decision Made!';

commit;

--drop table register;
--drop table personal;
--drop table receive;
--drop table send;
--drop table commune;
--drop table message;
--drop table report;
--drop table admin;
-----------------------------------------------------------------------------------------------practicing on learning
create table  IMAGETAB  
   (   name varchar2(4000),   
  PHOTO blob  
   )  ;
   
   select name,PHOTO from IMAGETAB;
   drop table  IMAGETAB   ;
   
   create table PM_OF_INDIA (
  id number(11) not null,
  PHOTO blob,
  primary key (id)
);


insert into PM_OF_INDIA(id,PHOTO) values(10,'');
insert into PM_OF_INDIA(id,PHOTO) values(13,'');
update PM_OF_INDIA set PHOTO ='C:\Users\suth3338\Downloads\car2.jfif' where id=11;
select * from PM_OF_INDIA;

select PHOTO from PM_OF_INDIA;
select count(1) from PM_OF_INDIA where id=11;
select sum(CONFIRMPASSWORD) from register where password=123456;

create table TABLEEEEEE(
DOB date not null,DATEOFREG timestamp) ;
--drop table tableeeeee;
insert into TABLEEEEEE DOB,DATEOFREG values ( '03-may-2021','to_TIMESTAMP('12-FEB-21 01.00.44.720000 AM','DD-MON-YY HH24.MI.SS.MS');');
insert into TABLEEEEEE DATEOFREG values (TO_TIMESTAMP('12-FEB-21 01.00.44.720000 AM','DD-MON-YY HH24.MI.SS.MS'));
select TO_CHAR(DATEOFREG, 'yyyy-mm-dd hh24:mi:ss') from TABLEEEEEE;
select DOB from TABLEEEEEE;

-------------------------------------------------------------------------------------------





create table PERSONAL
(
  SENDER varchar(30) not null,
 RECEIVER varchar(30) not null,
 MESSAGETIME timestamp with local time zone not null ,
  REQSTATUS varchar(30) not null,
  MESSAGE varchar(1000) not null,
  MESSAGEID number(10) not null,
 -- userName VARCHAR(30) NOT NULL,
  primary key (MESSAGEID),
  foreign key (SENDER) references register(USERNAME),
foreign key (RECEIVER) references register(USERNAME)
);
-------------------------------------------------------------------
create table PERSONALCHAT
  as (select * from PERSONAL);
insert into PERSONALCHAT (SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,MESSAGEID)values('wall2089','frog2082',LOCALTIMESTAMP,'Yes','Passing test message with receiver',SEQ_ID3.nextval);
insert into PERSONALCHAT (SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,MESSAGEID)values('wall2089','frog2082',LOCALTIMESTAMP,'Yes','Passing test message with receiver',SEQ_ID10.nextval);
select SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,MESSAGEID,IMAGE from PERSONALCHAT;
select * from PERSONALCHAT;
commit;

alter table  PERSONALCHAT add IMAGE blob;
   insert into PERSONALCHAT (SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,MESSAGEID,IMAGE)values('wall2089','frog2082',LOCALTIMESTAMP,'Yes','Passing test message with receiver',SEQ_ID10.nextval,UTL_RAW.CAST_TO_RAW('C:\Users\suth3338\Downloads\bus.gif'));
--------------------------------------------------------------------------------------------------------------------Data stored next to retrieve
commit;
select SENDER,MESSAGETIME,MESSAGEID,MESSAGE,IMAGE from PERSONALCHAT; where RECEIVER = 'frog2082';
select * from personalchat;

select distinct sender,reqstatus from personalChat where receiver ='frog2082'   ;

select name,USERNAME, password,MAILID from register;
-----------------------------------------------------------------------------------------------------------------------message retrirved
--drop table report;
create table report
(
  REPORTID number not null,
  REPORTDATE timestamp with local time zone,
  REPORTUSERNAME varchar(30) not null,
  REPORTCONTENT varchar(250) not null,
 -- communeId number ,
  USERNAME varchar(30) not null,
  MESSAGEID number(10) ,
  REPORTSTATUS varchar(30),
  primary key (REPORTID),
 -- FOREIGN KEY (communeId) REFERENCES Commune(communeId),
  foreign key (USERNAME) references register(USERNAME),
  foreign key (MESSAGEID) references PERSONALCHAT(MESSAGEID)
);

insert into report (REPORTID,REPORTDATE,REPORTUSERNAME,REPORTCONTENT,COMMUNEID,USERNAME,MESSAGEID,) values
(SEQ_ID4.nextval,to_date('27-dec-2022','dd-mm-yyyy'),'abc001','(sample)Wrong Mention ',3000,'abc1001','');
select * from register;
select * from report;
insert into report (REPORTID,REPORTDATE,REPORTUSERNAME,REPORTCONTENT,USERNAME,MESSAGEID,REPORTSTATUS) values
(SEQ_ID4.nextval,LOCALTIMESTAMP,'frog2082','(sample)Wrong Mention ','wall2089',3062,'made report');
commit;
select REPORTID,REPORTDATE,REPORTUSERNAME,REPORTCONTENT,USERNAME,MESSAGEID,REPORTSTATUS from report where username='frog2082';
--alter table PERSONALCHAT modify messageId number(10) primary key;

select SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,MESSAGEID from PERSONAL;
-----------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------

create table COMMUNE_A
  as (select * from COMMUNE);
  
  create table MESSAGE_A
  as (select * from MESSAGE);

drop table COMMUNE;
drop table MESSAGE;

create table COMMUNE
(
  COMMUNENAME varchar(30) not null,
  COMMUNEID number not null,
  MEMBERS varchar(30) not null,
  password number not null,
 DATEOFCREATION timestamp with local time zone,
  foreign key (MEMBERS) references register(USERNAME)
);

insert into COMMUNE (COMMUNENAME,COMMUNEID,password,MEMBERS,DATEOFCREATION)values
('Welcome users',COMMUNESEQ.nextval,1234,'wall2089',LOCALTIMESTAMP);
--drop sequence seq_id4;
--may include member added by----


alter table commune modify communeId number primary key ;

alter table commune modify communeName varchar(30) unique ;


--insert into COMMUNE (COMMUNENAME,COMMUNEID,password,MEMBERS,DATEOFCREATION)values
--('Welcome user',2202,1234,'wall2089',LOCALTIMESTAMP);

select * from COMMUNE;
select * from register;

 
create table communeMembers(communeId number,members varchar(30),dateOfJoin timestamp with local time zone , foreign key (communeId) references commune(communeId));

alter table communeMembers add communeName varchar(30) ;

select communeName,communeId,members,dateOfJoin from communeMembers;

--drop table communemembers;

--DELETE FROM communemembers WHERE communeid NOT IN ( SELECT MAX(communeid) FROM communemembers GROUP BY members);


-------------
--drop table message;
create table MESSAGE
(
  COMMUNEID number not null,
  SENDER varchar(30) not null,
  MESSAGE varchar(1000) not null,
  docs blob,
  MESSAGETIME timestamp with local time zone,
  views number,VIEWEDBY varchar(30) ,
    foreign key (sender) references register(USERNAME)

 -- foreign key (COMMUNEID) references COMMUNE(COMMUNEID)
 -- FOREIGN KEY (sender) REFERENCES commune(memberName)
);
--------------------------------------------------------------------------------------------------
insert into MESSAGE (MESSAGE,MESSAGETIME,COMMUNEID,USERNAME) values
('Welcome Users to the Commune ',LOCALTIMESTAMP,3000,'abc1001');
insert into MESSAGE (MESSAGE,MESSAGETIME,COMMUNEID,USERNAME) values
('Have Your Thoughts With Your Teams ',LOCALTIMESTAMP,3000,'abc1001');
----------------------------------------------------------------------------------------------------
insert into MESSAGE (COMMUNEID,SENDER,MESSAGE,docs,MESSAGETIME,VIEWEDBY) values
(4000,'wall2089','Welcome user`s to the group','',LOCALTIMESTAMP,'');

insert into MESSAGE (COMMUNEID,SENDER,MESSAGE,docs,MESSAGETIME,views,VIEWEDBY) values
(4000,'wall2089','Welcome user`s to the group','',LOCALTIMESTAMP,'0','');

select SENDER,MESSAGE,docs,MESSAGETIME,COMMUNEID,views,viewedby from MESSAGE;
update message set views=views+1 where communeId=4000;

select distinct communeId, communename from communeMembers where members='wago2090';





select distinct communemembers.communeId,register.username,register.name
from register
  inner join communemembers
  on register.username = communemembers.members
order by  communemembers.communeid;

select distinct commune.communeId,register.username,register.name
from register,commune
where register.username = commune.members
order by commune.communeId;

create table textMESSAGE
(
  COMMUNEID number not null,
  SENDER varchar(30) not null,
  MESSAGE varchar(1000) not null,
  MESSAGETIME timestamp with local time zone,
  views number,
    foreign key (sender) references register(USERNAME)

 
);
               
               select SENDER,MESSAGE,MESSAGETIME,COMMUNEID,views from textMESSAGE;

commit;
                                              
insert into textMESSAGE (COMMUNEID,SENDER,MESSAGE,MESSAGETIME,views) values
(4000,'wall2089','Welcome user`s to the group',LOCALTIMESTAMP,'0');

----------------------------------------------------------------------image personal--------

create table personalFiles
(
  SENDER varchar(30) not null,
 RECEIVER varchar(30) not null,
 MESSAGETIME timestamp with local time zone not null ,
  REQSTATUS varchar(30) not null,
  MESSAGE varchar(1000) not null,
   docs blob,
  MESSAGEID number(10) not null,

  primary key (MESSAGEID),
  foreign key (SENDER) references register(USERNAME),
foreign key (RECEIVER) references register(USERNAME)
);
  
insert into PERSONALFiles (SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,Docs,MESSAGEID)values('wall2089','frog2082',LOCALTIMESTAMP,'Yes','Passing test message with receiver','',SEQ_ID3.nextval);

select SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,Docs,MESSAGEID from PERSONALFiles;
select * from PERSONALfiles;
commit;

alter table  PERSONALCHAT add IMAGE blob;
   insert into PERSONALCHAT (SENDER,RECEIVER,MESSAGETIME,REQSTATUS,MESSAGE,MESSAGEID,IMAGE)values('wall2089','frog2082',LOCALTIMESTAMP,'Yes','Passing test message with receiver',SEQ_ID10.nextval,UTL_RAW.CAST_TO_RAW('C:\Users\suth3338\Downloads\bus.gif'));
--------------------------------------------------------------------------------------------------------------------Data stored next to retrieve
commit;
select SENDER,MESSAGETIME,MESSAGEID,MESSAGE,IMAGE from PERSONALCHAT where RECEIVER = 'frog2082';
	select sender,receiver,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,messageId,message from personalChat where receiver ='frog2082' order by messageId desc;


