CREATE TABLE `Student` (
    `sid` INT NOT NULL,
    `sname` VARCHAR(45),
    `uni` VARCHAR(45),
    `degree` VARCHAR(45),
    `major` VARCHAR(45),
    `gpa` FLOAT(2),
    `spwd` VARCHAR(45),
    PRIMARY KEY (`sid`)
);

CREATE TABLE `StudInfo` (
    `sid` INT NOT NULL,
    `keyword` VARCHAR(45),
    PRIMARY KEY (`sid`, `keyword`),
    FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`)
);

CREATE TABLE `StudResume` (
    `resid` INT NOT NULL,
    `sid` INT,
    `resume` TEXT,
    PRIMARY KEY (`resid`),
    FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`)
);

CREATE TABLE `FriendReq` (
    `frid` INT NOT NULL,
    `sidfrom` INT,
    `sidto` INT,
    `reqtime` DATETIME,
    `frstatus` VARCHAR(45),
    PRIMARY KEY (`frid`),
    FOREIGN KEY (`sidfrom`) REFERENCES `Student` (`sid`),
    FOREIGN KEY (`sidto`) REFERENCES `Student` (`sid`)
);

CREATE TABLE `Company` (
    `cid` INT NOT NULL,
    `cname` VARCHAR(45),
    `caddr` VARCHAR(45),
    `ccity` VARCHAR(45),
    `cstate` VARCHAR(45),
    `ccountry` VARCHAR(45),
    `industry` VARCHAR(45),
    `cpwd` VARCHAR(45),
    PRIMARY KEY (`cid`)
);

CREATE TABLE `Jobs` (
    `jobid` INT NOT NULL,
    `cid` INT,
    `jobtitle` VARCHAR(45),
    `jobpost` DATETIME,
    `jobstart` DATETIME,
    `salary` INT,
    `degreq` VARCHAR(45),
    `majorreq` VARCHAR(45),
    `joblocation` VARCHAR(45),
    `jobdesc` VARCHAR(45),
    `jobstatus` VARCHAR(45),
    PRIMARY KEY (`jobid`, `cid`),
    FOREIGN KEY (`cid`) REFERENCES `Company` (`cid`)
);

CREATE TABLE `Following` (
	`flwid` INT NOT NULL,
    `sid` INT,
    `cid` INT,
    PRIMARY KEY (`flwid`),
    FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`),
    FOREIGN KEY (`cid`) REFERENCES `Company` (`cid`)
);

CREATE TABLE `Applications` (
    `appid` INT NOT NULL,
    `sid` INT,
    `jobid` INT,
    `apptime` DATETIME,
    `resid` INT,
    `appstatus` VARCHAR(45),
    PRIMARY KEY (`appid`),
    FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`),
    FOREIGN KEY (`resid`) REFERENCES `StudResume` (`resid`),
    FOREIGN KEY (`jobid`) REFERENCES `Jobs` (`jobid`)
);

CREATE TABLE `JobRec` (
	`recid` INT NOT NULL,
    `recfrom` INT,
    `recto` INT,
    `jobid` INT,
    PRIMARY KEY (`recid`),
    FOREIGN KEY (`recto`) REFERENCES `Student` (`sid`)
);

CREATE TABLE `Messages` (
	`mid` INT NOT NULL,
    `msgfrom` INT,
    `msgto` INT,
    `msgtime` DATETIME,
    `message` VARCHAR(45),
    PRIMARY KEY (`mid`),
    FOREIGN KEY (`msgfrom`) REFERENCES `Student` (`sid`),
    FOREIGN KEY (`msgto`) REFERENCES `Student` (`sid`)
);

CREATE TABLE `NotificationStud` (
	`snid` INT NOT NULL AUTO_INCREMENT,
	`sntype` VARCHAR(45),
    `snkey` INT,
    `snrecp` INT,
    `sntime` DATETIME,
    `snread` VARCHAR(45),
    PRIMARY KEY (`snid`),
    FOREIGN KEY (`snrecp`) REFERENCES `Student` (`sid`)
);

CREATE TABLE `NotificationCmp` (
	`cnid` INT NOT NULL AUTO_INCREMENT,
	`cntype` VARCHAR(45),
    `cnkey` INT,
    `cnrecp` INT,
    `cntime` DATETIME,
    `cnread` VARCHAR(45),
    PRIMARY KEY (`cnid`),
    FOREIGN KEY (`cnrecp`) REFERENCES `Company` (`cid`)
);

#INSERT DATA

INSERT INTO `Applications` (`appid`, `sid`, `jobid`, `apptime`, `resid`, `appstatus`)
VALUES
	(55501,1001,1116,'2018-04-09 08:31:10',12302,'Pending');

INSERT INTO `Applications` (`appid`, `sid`, `jobid`, `apptime`, `resid`, `appstatus`)
VALUES
	(55502,1006,1114,'2018-04-10 09:01:10',12302,'Pending');

INSERT INTO `Applications` (`appid`, `sid`, `jobid`, `apptime`, `resid`, `appstatus`)
VALUES
	(55503,1004,1113,'2018-04-11 10:10:18',12307,'Rejected');

INSERT INTO `Applications` (`appid`, `sid`, `jobid`, `apptime`, `resid`, `appstatus`)
VALUES
	(55504,1003,1111,'2018-04-19 08:31:10',12305,'Pending');

INSERT INTO `Applications` (`appid`, `sid`, `jobid`, `apptime`, `resid`, `appstatus`)
VALUES
	(55505,1002,1113,'2018-04-12 08:31:10',12304,'Selected');

INSERT INTO `Applications` (`appid`, `sid`, `jobid`, `apptime`, `resid`, `appstatus`)
VALUES
	(55506,1001,1111,'2018-04-17 09:01:00',12302,'Pending');

INSERT INTO `Company` (`cid`, `cname`, `caddr`, `ccity`, `cstate`, `ccountry`, `industry`, `cpwd`)
VALUES
	(10001,'Microsoft','11 Times Square','New York','New York','USA','Technology','Mimosa22');

INSERT INTO `Company` (`cid`, `cname`, `caddr`, `ccity`, `cstate`, `ccountry`, `industry`, `cpwd`)
VALUES
	(10002,'Amazon','5 West Mott st','Seattle','Washington','USA','Software','Rubiosa90');

INSERT INTO `Company` (`cid`, `cname`, `caddr`, `ccity`, `cstate`, `ccountry`, `industry`, `cpwd`)
VALUES
	(10003,'Facebook','21 Champs Elysees Ave','Paris','Paris','France','Artificial Inteligence','Merlotfire7');

INSERT INTO `Company` (`cid`, `cname`, `caddr`, `ccity`, `cstate`, `ccountry`, `industry`, `cpwd`)
VALUES
	(10004,'FBI','54 14th st Chelsea','New York','New York','USA','Psychology Department','Allsalesallstates45');

INSERT INTO `Company` (`cid`, `cname`, `caddr`, `ccity`, `cstate`, `ccountry`, `industry`, `cpwd`)
VALUES
	(10005,'All State','11 Essex st','San Francisco','California','USA','Business','Pizzaislife4eva');

INSERT INTO `Company` (`cid`, `cname`, `caddr`, `ccity`, `cstate`, `ccountry`, `industry`, `cpwd`)
VALUES
	(10006,'Mercury','54 Atlantic Ave','Brooklyn','New York','USA','Construction','linguinihappiness77');

INSERT INTO `Following` (`flwid`, `sid`, `cid`)
VALUES
	(7001,1003,10001);

INSERT INTO `Following` (`flwid`, `sid`, `cid`)
VALUES
	(7772,1006,10001);

INSERT INTO `Following` (`flwid`, `sid`, `cid`)
VALUES
	(7773,1001,10003);

INSERT INTO `Following` (`flwid`, `sid`, `cid`)
VALUES
	(7774,1002,10005);

INSERT INTO `Following` (`flwid`, `sid`, `cid`)
VALUES
	(7775,1005,10004);

INSERT INTO `Following` (`flwid`, `sid`, `cid`)
VALUES
	(7776,1003,10002);

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33301,1001,1005,'2018-01-16 12:30:00','Accepted');

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33302,1001,1003,'2018-02-15 11:22:50','Accepted');

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33304,1002,1001,'2018-03-06 09:43:00','Accepted');

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33305,1003,1007,'2018-01-12 12:08:10','Accepted');

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33306,1004,1002,'2018-02-09 10:01:10','Rejected');

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33307,1004,1001,'2018-04-07 07:35:50','Accepted');

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33308,1004,1005,'2018-03-28 11:12:20','Pending');

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33309,1006,1007,'2018-03-18 05:47:20','Accepted');

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33310,1006,1005,'2018-04-11 08:27:20','Accepted');

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`)
VALUES
	(33311,1005,1003,'2018-02-11 10:42:00','Rejected');


INSERT INTO `JobRec` (`recid`, `recfrom`, `recto`, `jobid`)
VALUES
	(98701,1006,1001,1114);

INSERT INTO `JobRec` (`recid`, `recfrom`, `recto`, `jobid`)
VALUES
	(98702,1007,1006,1116);

INSERT INTO `JobRec` (`recid`, `recfrom`, `recto`, `jobid`)
VALUES
	(98703,1004,1002,1113);

INSERT INTO `Jobs` (`jobid`, `cid`, `jobtitle`, `jobpost`, `jobstart`, `salary`, `degreq`, `majorreq`, `joblocation`, `jobdesc`, `jobstatus`)
VALUES
	(1111,10003,'AI researcher','2018-04-01 00:00:00','2018-06-01 00:00:00',120000,'MS','CS','New York','Experienced AI programmer willing to learn an','Available');

INSERT INTO `Jobs` (`jobid`, `cid`, `jobtitle`, `jobpost`, `jobstart`, `salary`, `degreq`, `majorreq`, `joblocation`, `jobdesc`, `jobstatus`)
VALUES
	(1112,10004,'Industrial Psychologist','2018-04-03 00:00:00','2018-05-25 00:00:00',120000,'MS','Psychology','Boston','Experienced Psychologist required with atleas','Available');

INSERT INTO `Jobs` (`jobid`, `cid`, `jobtitle`, `jobpost`, `jobstart`, `salary`, `degreq`, `majorreq`, `joblocation`, `jobdesc`, `jobstatus`)
VALUES
	(1113,10005,'Business Manager','2018-04-05 00:00:00','2018-05-30 00:00:00',150000,'BS','Business Management','Seattle','Candidate must be from business background wi','Taken');

INSERT INTO `Jobs` (`jobid`, `cid`, `jobtitle`, `jobpost`, `jobstart`, `salary`, `degreq`, `majorreq`, `joblocation`, `jobdesc`, `jobstatus`)
VALUES
	(1114,10002,'Back-End developer','2018-04-07 00:00:00','2018-06-05 00:00:00',84000,'BS','CS','San Francisco','Highly skilled candidates will be considered ','Available');

INSERT INTO `Jobs` (`jobid`, `cid`, `jobtitle`, `jobpost`, `jobstart`, `salary`, `degreq`, `majorreq`, `joblocation`, `jobdesc`, `jobstatus`)
VALUES
	(1115,10006,'Senior Engineer','2018-04-15 00:00:00','2018-07-01 00:00:00',170000,'MS','Civil Engineering','New York','Looking for a senior construction engineer wi','Available');

INSERT INTO `Jobs` (`jobid`, `cid`, `jobtitle`, `jobpost`, `jobstart`, `salary`, `degreq`, `majorreq`, `joblocation`, `jobdesc`, `jobstatus`)
VALUES
	(1116,10001,'Full Stack Developer','2018-04-21 00:00:00','2018-06-15 00:00:00',140000,'MS','CS','Seattle','Candidate must possess expertise in programmi','Available');

INSERT INTO `Messages` (`mid`, `msgfrom`, `msgto`, `msgtime`, `message`)
VALUES
	(99901,1001,1005,'2018-03-19 10:32:10','Hi there, Wanna hang out?');

INSERT INTO `Messages` (`mid`, `msgfrom`, `msgto`, `msgtime`, `message`)
VALUES
	(99902,1003,1002,'2018-02-22 07:02:00','Hi did you get the notes?');

INSERT INTO `Messages` (`mid`, `msgfrom`, `msgto`, `msgtime`, `message`)
VALUES
	(99903,1006,1007,'2018-04-22 11:22:14','Heya!!! Whatsup!');

INSERT INTO `Messages` (`mid`, `msgfrom`, `msgto`, `msgtime`, `message`)
VALUES
	(99904,1006,1001,'2018-03-03 03:32:09','Hellooo... Sorry I could not meet you today. ');

INSERT INTO `Messages` (`mid`, `msgfrom`, `msgto`, `msgtime`, `message`)
VALUES
	(99905,1005,1002,'2018-03-21 12:09:12','So.. When do you want to get together?');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES;

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201001,'AP',1116,10001,'2018-04-20 00:00:00','unseen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201002,'AP',1114,10002,'2018-04-21 00:00:00','unseen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201003,'AP',1113,10005,'2018-04-10 00:00:00','seen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201004,'AP',1111,10003,'2018-04-19 00:00:00','unseen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201005,'AP',1113,10005,'2018-04-20 00:00:00','seen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201006,'AP',1111,10003,'2018-04-05 00:00:00','unseen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201007,'FL',1116,10001,'2018-04-20 00:00:00','unseen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201008,'FL',1116,10001,'2018-04-02 00:00:00','unseen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201009,'FL',1111,10003,'2018-04-12 00:00:00','unseen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201010,'FL',1113,10005,'2018-04-21 00:00:00','unseen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201011,'FL',1112,10004,'2018-03-30 00:00:00','unseen');

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`)
VALUES
	(201012,'FL',1114,10002,'2018-04-22 00:00:00','unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101001,'FRRecv',33303,1005,'2018-03-19 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101002,'FRRecv',33308,1005,'2018-04-21 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101003,'FRRecv',33306,1002,'2018-03-03 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101004,'FRRecv',33311,1003,'2018-04-14 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101005,'FRRecv',33301,1005,'2018-04-10 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101006,'FRRecv',33302,1003,'2018-03-10 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101007,'FRRecv',33304,1001,'2018-04-01 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101008,'FRRecv',33305,1007,'2018-04-12 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101009,'FRRecv',33307,1001,'2018-04-15 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101010,'FRRecv',33309,1007,'2018-04-11 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101011,'FRRecv',33310,1005,'2018-03-22 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101014,'MS',99901,1005,'2018-04-14 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101015,'MS',99902,1002,'2018-04-20 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101017,'MS',99904,1001,'2018-04-05 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101018,'MS',99905,1002,'2018-04-04 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101019,'JR',98701,1001,'2018-04-06 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101020,'JR',98702,1006,'2018-04-22 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101021,'JR',98703,1002,'2018-04-03 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101022,'AP',55505,1002,'2018-04-07 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101023,'FRUpd',33310,1006,'2018-04-03 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101024,'FRUpd',33309,1006,'2018-04-14 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101025,'FRUpd',33307,1004,'2018-04-08 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101026,'FRUpd',33305,1003,'2018-04-19 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101027,'FRUpd',33304,1002,'2018-03-15 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101028,'FRUpd',33311,1005,'2018-04-11 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101029,'FRUpd',33306,1004,'2018-04-05 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101031,'FRUpd',33302,1001,'2018-04-09 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101039,'FRUpd',33301,1001,'2018-04-10 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101040,'AP',55503,1004,'2018-04-16 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101041,'JB',10001,1003,'2018-04-17 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101042,'JB',10002,1003,'2018-04-21 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101043,'JB',10003,1001,'2018-04-22 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101044,'JB',10001,1006,'2018-04-22 00:00:00','Unseen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101045,'JB',10005,1002,'2018-03-17 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101046,'JB',10004,1005,'2018-03-26 00:00:00','Seen');

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`)
VALUES
	(101047,'JR',98704,1006,'2018-04-19 00:00:00','Unseen');

INSERT INTO `Student` (`sid`, `sname`, `uni`, `degree`, `major`, `gpa`, `spwd`)
VALUES
	(1001,'Adam','NYU','MS','CS',3.2,'Madagascar');

INSERT INTO `Student` (`sid`, `sname`, `uni`, `degree`, `major`, `gpa`, `spwd`)
VALUES
	(1002,'Susan','Columbia University','MS','Business management',4,'fan21lol');

INSERT INTO `Student` (`sid`, `sname`, `uni`, `degree`, `major`, `gpa`, `spwd`)
VALUES
	(1003,'Amy','Cornell University','BS','CS',3.7,'newbeequeenbee');

INSERT INTO `Student` (`sid`, `sname`, `uni`, `degree`, `major`, `gpa`, `spwd`)
VALUES
	(1004,'Chris','CUNY','MS','MOT',3.6,'whenyou34sum');

INSERT INTO `Student` (`sid`, `sname`, `uni`, `degree`, `major`, `gpa`, `spwd`)
VALUES
	(1005,'Naomi','SUNY','BS','Psychology',3.1,'nnn789freshfood');

INSERT INTO `Student` (`sid`, `sname`, `uni`, `degree`, `major`, `gpa`, `spwd`)
VALUES
	(1006,'Hanna','NYU','MS','CS',3.8,'deppdepp0987');

INSERT INTO `Student` (`sid`, `sname`, `uni`, `degree`, `major`, `gpa`, `spwd`)
VALUES
	(1007,'Simon','NYU','MS','Mathematics',3.7,'comeangelgoodbye5');

INSERT INTO `StudentInfo` (`sid`, `keyword`)
VALUES
	(1001,'software');

INSERT INTO `StudentInfo` (`sid`, `keyword`)
VALUES
	(1002,'civil');

INSERT INTO `StudentInfo` (`sid`, `keyword`)
VALUES
	(1003,'database');

INSERT INTO `StudentInfo` (`sid`, `keyword`)
VALUES
	(1004,'python');

INSERT INTO `StudentInfo` (`sid`, `keyword`)
VALUES
	(1005,'business');

INSERT INTO `StudentInfo` (`sid`, `keyword`)
VALUES
	(1006,'analyst');

INSERT INTO `StudentInfo` (`sid`, `keyword`)
VALUES
	(1007,'machine');

INSERT INTO `StudResume` (`resid`, `sid`, `resume`)
VALUES
	(12301,1003,'Amy - BS in CS. 6 month internship at NYC MTA. Experience with MySQL backend systems. In depth knowledge of database systems. Looking for a full time positions preferably in Database Systems and Back end development.');

INSERT INTO `StudResume` (`resid`, `sid`, `resume`)
VALUES
	(12302,1001,'Adam - New York. Expected to graduate in Spring 2018 with MSCS. BSCS GPA 3.8. Possess practical knowledge in software engineering and development. Worked for 2 years prior to MS. Actively looking for jobs that matc my expertise. Email : adamschummer@gmail.com');

INSERT INTO `StudResume` (`resid`, `sid`, `resume`)
VALUES
	(12303,1005,'Naomi - Final year BS student at CUNY. Major in psychology. Looking for full time jobs fitting my profile to gain experience in clinical psychology before beginning graduate study in clinical psychology. ');

INSERT INTO `StudResume` (`resid`, `sid`, `resume`)
VALUES
	(12304,1002,'Susan - MS in Business Management. First of my class with a perfect GPA of 4. Actively looking for top job environment for me to grow in. No prior experience but possess demontrated skills in school projects.');

INSERT INTO `StudResume` (`resid`, `sid`, `resume`)
VALUES
	(12305,1003,'Amy - BS in CS. 6 month internship at NYC MTA. Experience with MySQL backend systems. In depth knowledge of database systems. Looking for a full time positions preferably in Database Systems and Back end an software engineering. Sound knowledge of Big Data analysis. Comfortable working in Hadoop environment. Strong data structures knowledge.');

INSERT INTO `StudResume` (`resid`, `sid`, `resume`)
VALUES
	(12306,1007,'Simon - Diligent graduate student pursuing MS in Mathematics, looking for full time positions in industry and in the research world to expand my skills and apply my knowledge.');

INSERT INTO `StudResume` (`resid`, `sid`, `resume`)
VALUES
	(12307,1004,'Chris - Hardworking student looking for jobs in Management of Technology positions. MS in MOT. Expected to grauate in Summer 2018. Relocation will not be a problem. ');


#TRIGGERS
#Notify a student of a new friend request received
CREATE TRIGGER freqsent AFTER INSERT ON FriendReq
BEGIN
	INSERT INTO `NotificationStud` (`sntype`, `snkey`, `snrecp`, `snread`)
	VALUES ('FRRecv', 'NEW.frid', 'NEW.sidto', 'Unseen');
END;

#Notify a student of the response to a friend request sent.
CREATE TRIGGER frequpdate AFTER UPDATE ON FriendReq
BEGIN
	IF NEW.frstatus = 'Accepted' or NEW.frstatus = 'Rejected' 
	INSERT INTO `NotificationStud` (`sntype`, `snkey`, `snrecp`, `snread`)
	VALUES ('FRUpd', 'NEW.frid', 'NEW.sidfrom', 'Unseen');
END;

#Notify a company of a new follower.
CREATE TRIGGER followcmp AFTER INSERT ON Following
BEGIN
	INSERT INTO `NotificationCmp` (`cntype`, `cnkey`, `cnrecp`, `cnread`)
	VALUES ('FL', 'NEW.flwid', 'NEW.cid', 'Unseen');
END;

#Notify a company of a new application received for a job listing.
CREATE TRIGGER appcmp AFTER INSERT ON Applications
BEGIN
	INSERT INTO `NotificationCmp` (`cntype`, `cnkey`, `cnrecp`, `cnread`)
	VALUES ('APC', 'NEW.jobid', 'NEW.cid', 'Unseen');
END;

#Notify the student of a decision on a job application.
CREATE TRIGGER appstd AFTER UPDATE ON Applications
BEGIN
	IF NEW.appstatus = 'Selected' or NEW.appstatus = 'Rejected' 
	INSERT INTO `NotificationStud` (`sntype`, `snkey`, `snrecp`, `snread`)
	VALUES ('APS', 'NEW.jobid', 'NEW.sid', 'Unseen');
END;

#Update the job listing to show the position has been filled.
CREATE TRIGGER jobstat AFTER UPDATE ON Applications
BEGIN
	IF NEW.appstatus = 'Selected'
	UPDATE Jobs
	Set jobstatus = 'Taken'
	Where jobid = NEW.jobid
END;

#Notify a student of a job recommendation.
CREATE TRIGGER jobrec AFTER INSERT ON JobRec
BEGIN
	INSERT INTO `NotificationStud` (`sntype`, `snkey`, `snrecp`, `snread`)
	VALUES ('JB', 'NEW.recid', 'NEW.recto', 'Unseen');
END;


#Notify a student of a new message.
CREATE TRIGGER newmsg AFTER INSERT ON Messages
BEGIN
	INSERT INTO `NotificationStud` (`sntype`, `snkey`, `snrecp`, `snread`)
	VALUES ('MS', 'NEW.mid', 'NEW.msgto', 'Unseen');
END;
