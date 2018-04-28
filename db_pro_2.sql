-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2018 at 12:00 AM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `DB_Proj_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `Applications`
--

CREATE TABLE `Applications` (
  `appid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `jobid` int(11) DEFAULT NULL,
  `apptime` datetime DEFAULT NULL,
  `resid` int(11) DEFAULT NULL,
  `appstatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Applications`
--

INSERT INTO `Applications` (`appid`, `sid`, `jobid`, `apptime`, `resid`, `appstatus`) VALUES
(55501, 1001, 1116, '2018-04-09 08:31:10', 12302, 'Pending'),
(55502, 1006, 1114, '2018-04-10 09:01:10', 12302, 'Pending'),
(55503, 1004, 1113, '2018-04-11 10:10:18', 12307, 'Rejected'),
(55504, 1003, 1111, '2018-04-19 08:31:10', 12305, 'Pending'),
(55505, 1002, 1113, '2018-04-12 08:31:10', 12304, 'Selected'),
(55506, 1001, 1111, '2018-04-17 09:01:00', 12302, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE `Company` (
  `cid` int(11) NOT NULL,
  `cname` varchar(45) DEFAULT NULL,
  `caddr` varchar(45) DEFAULT NULL,
  `ccity` varchar(45) DEFAULT NULL,
  `cstate` varchar(45) DEFAULT NULL,
  `ccountry` varchar(45) DEFAULT NULL,
  `industry` varchar(45) DEFAULT NULL,
  `cpwd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Company`
--

INSERT INTO `Company` (`cid`, `cname`, `caddr`, `ccity`, `cstate`, `ccountry`, `industry`, `cpwd`) VALUES
(10001, 'Microsoft', '11 Times Square', 'New York', 'New York', 'USA', 'Technology', 'Mimosa22'),
(10002, 'Amazon', '5 West Mott st', 'Seattle', 'Washington', 'USA', 'Software', 'Rubiosa90'),
(10003, 'Facebook', '21 Champs Elysees Ave', 'Paris', 'Paris', 'France', 'Artificial Inteligence', 'Merlotfire7'),
(10004, 'FBI', '54 14th st Chelsea', 'New York', 'New York', 'USA', 'Psychology Department', 'Allsalesallstates45'),
(10005, 'All State', '11 Essex st', 'San Francisco', 'California', 'USA', 'Business', 'Pizzaislife4eva'),
(10006, 'Mercury', '54 Atlantic Ave', 'Brooklyn', 'New York', 'USA', 'Construction', 'linguinihappiness77');

-- --------------------------------------------------------

--
-- Table structure for table `Following`
--

CREATE TABLE `Following` (
  `flwid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Following`
--

INSERT INTO `Following` (`flwid`, `sid`, `cid`) VALUES
(7001, 1003, 10001),
(7772, 1006, 10001),
(7773, 1001, 10003),
(7774, 1002, 10005),
(7775, 1005, 10004),
(7776, 1003, 10002);

-- --------------------------------------------------------

--
-- Table structure for table `FriendReq`
--

CREATE TABLE `FriendReq` (
  `frid` int(11) NOT NULL,
  `sidfrom` int(11) DEFAULT NULL,
  `sidto` int(11) DEFAULT NULL,
  `reqtime` datetime DEFAULT NULL,
  `frstatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FriendReq`
--

INSERT INTO `FriendReq` (`frid`, `sidfrom`, `sidto`, `reqtime`, `frstatus`) VALUES
(33301, 1001, 1005, '2018-01-16 12:30:00', 'Accepted'),
(33302, 1001, 1003, '2018-02-15 11:22:50', 'Accepted'),
(33304, 1002, 1001, '2018-03-06 09:43:00', 'Accepted'),
(33305, 1003, 1007, '2018-01-12 12:08:10', 'Accepted'),
(33306, 1004, 1002, '2018-02-09 10:01:10', 'Rejected'),
(33307, 1004, 1001, '2018-04-07 07:35:50', 'Accepted'),
(33308, 1004, 1005, '2018-03-28 11:12:20', 'Pending'),
(33309, 1006, 1007, '2018-03-18 05:47:20', 'Accepted'),
(33310, 1006, 1005, '2018-04-11 08:27:20', 'Accepted'),
(33311, 1005, 1003, '2018-02-11 10:42:00', 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `JobRec`
--

CREATE TABLE `JobRec` (
  `recid` int(11) NOT NULL,
  `recfrom` int(11) DEFAULT NULL,
  `recto` int(11) DEFAULT NULL,
  `jobid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `JobRec`
--

INSERT INTO `JobRec` (`recid`, `recfrom`, `recto`, `jobid`) VALUES
(98701, 1006, 1001, 1114),
(98702, 1007, 1006, 1116),
(98703, 1004, 1002, 1113);

-- --------------------------------------------------------

--
-- Table structure for table `Jobs`
--

CREATE TABLE `Jobs` (
  `jobid` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `jobtitle` varchar(45) DEFAULT NULL,
  `jobpost` datetime DEFAULT NULL,
  `jobstart` datetime DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `degreq` varchar(45) DEFAULT NULL,
  `majorreq` varchar(45) DEFAULT NULL,
  `joblocation` varchar(45) DEFAULT NULL,
  `jobdesc` varchar(45) DEFAULT NULL,
  `jobstatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Jobs`
--

INSERT INTO `Jobs` (`jobid`, `cid`, `jobtitle`, `jobpost`, `jobstart`, `salary`, `degreq`, `majorreq`, `joblocation`, `jobdesc`, `jobstatus`) VALUES
(1111, 10003, 'AI researcher', '2018-04-01 00:00:00', '2018-06-01 00:00:00', 120000, 'MS', 'CS', 'New York', 'Experienced AI programmer willing to learn an', 'Available'),
(1112, 10004, 'Industrial Psychologist', '2018-04-03 00:00:00', '2018-05-25 00:00:00', 120000, 'MS', 'Psychology', 'Boston', 'Experienced Psychologist required with atleas', 'Available'),
(1113, 10005, 'Business Manager', '2018-04-05 00:00:00', '2018-05-30 00:00:00', 150000, 'BS', 'Business Management', 'Seattle', 'Candidate must be from business background wi', 'Taken'),
(1114, 10002, 'Back-End developer', '2018-04-07 00:00:00', '2018-06-05 00:00:00', 84000, 'BS', 'CS', 'San Francisco', 'Highly skilled candidates will be considered ', 'Available'),
(1115, 10006, 'Senior Engineer', '2018-04-15 00:00:00', '2018-07-01 00:00:00', 170000, 'MS', 'Civil Engineering', 'New York', 'Looking for a senior construction engineer wi', 'Available'),
(1116, 10001, 'Full Stack Developer', '2018-04-21 00:00:00', '2018-06-15 00:00:00', 140000, 'MS', 'CS', 'Seattle', 'Candidate must possess expertise in programmi', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `Messages`
--

CREATE TABLE `Messages` (
  `mid` int(11) NOT NULL,
  `msgfrom` int(11) DEFAULT NULL,
  `msgto` int(11) DEFAULT NULL,
  `msgtime` datetime DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Messages`
--

INSERT INTO `Messages` (`mid`, `msgfrom`, `msgto`, `msgtime`, `message`) VALUES
(99901, 1001, 1005, '2018-03-19 10:32:10', 'Hi there, Wanna hang out?'),
(99902, 1003, 1002, '2018-02-22 07:02:00', 'Hi did you get the notes?'),
(99903, 1006, 1007, '2018-04-22 11:22:14', 'Heya!!! Whatsup!'),
(99904, 1006, 1001, '2018-03-03 03:32:09', 'Hellooo... Sorry I could not meet you today. '),
(99905, 1005, 1002, '2018-03-21 12:09:12', 'So.. When do you want to get together?'),
(99906, 1005, 1001, '2018-04-27 18:19:05', 'Hello'),
(99909, 1005, 1001, '2018-04-27 18:22:34', 'Hi');

-- --------------------------------------------------------

--
-- Table structure for table `NotificationCmp`
--

CREATE TABLE `NotificationCmp` (
  `cnid` int(11) NOT NULL,
  `cntype` varchar(45) DEFAULT NULL,
  `cnkey` int(11) DEFAULT NULL,
  `cnrecp` int(11) DEFAULT NULL,
  `cntime` datetime DEFAULT NULL,
  `cnread` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `NotificationCmp`
--

INSERT INTO `NotificationCmp` (`cnid`, `cntype`, `cnkey`, `cnrecp`, `cntime`, `cnread`) VALUES
(201001, 'AP', 1116, 10001, '2018-04-20 00:00:00', 'unseen'),
(201002, 'AP', 1114, 10002, '2018-04-21 00:00:00', 'unseen'),
(201003, 'AP', 1113, 10005, '2018-04-10 00:00:00', 'seen'),
(201004, 'AP', 1111, 10003, '2018-04-19 00:00:00', 'unseen'),
(201005, 'AP', 1113, 10005, '2018-04-20 00:00:00', 'seen'),
(201006, 'AP', 1111, 10003, '2018-04-05 00:00:00', 'unseen'),
(201007, 'FL', 1116, 10001, '2018-04-20 00:00:00', 'unseen'),
(201008, 'FL', 1116, 10001, '2018-04-02 00:00:00', 'unseen'),
(201009, 'FL', 1111, 10003, '2018-04-12 00:00:00', 'unseen'),
(201010, 'FL', 1113, 10005, '2018-04-21 00:00:00', 'unseen'),
(201011, 'FL', 1112, 10004, '2018-03-30 00:00:00', 'unseen'),
(201012, 'FL', 1114, 10002, '2018-04-22 00:00:00', 'unseen');

-- --------------------------------------------------------

--
-- Table structure for table `NotificationStud`
--

CREATE TABLE `NotificationStud` (
  `snid` int(11) NOT NULL,
  `sntype` varchar(45) DEFAULT NULL,
  `snkey` int(11) DEFAULT NULL,
  `snrecp` int(11) DEFAULT NULL,
  `sntime` datetime DEFAULT NULL,
  `snread` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `NotificationStud`
--

INSERT INTO `NotificationStud` (`snid`, `sntype`, `snkey`, `snrecp`, `sntime`, `snread`) VALUES
(101002, 'FRRecv', 33308, 1005, '2018-04-21 00:00:00', 'Unseen'),
(101003, 'FRRecv', 33306, 1002, '2018-03-03 00:00:00', 'Seen'),
(101004, 'FRRecv', 33311, 1003, '2018-04-14 00:00:00', 'Seen'),
(101005, 'FRRecv', 33301, 1005, '2018-04-10 00:00:00', 'Seen'),
(101006, 'FRRecv', 33302, 1003, '2018-03-10 00:00:00', 'Seen'),
(101007, 'FRRecv', 33304, 1001, '2018-04-01 00:00:00', 'Seen'),
(101008, 'FRRecv', 33305, 1007, '2018-04-12 00:00:00', 'Seen'),
(101009, 'FRRecv', 33307, 1001, '2018-04-15 00:00:00', 'Seen'),
(101010, 'FRRecv', 33309, 1007, '2018-04-11 00:00:00', 'Seen'),
(101011, 'FRRecv', 33310, 1005, '2018-03-22 00:00:00', 'Seen'),
(101014, 'MS', 99901, 1005, '2018-04-14 00:00:00', 'Unseen'),
(101015, 'MS', 99902, 1002, '2018-04-20 00:00:00', 'Unseen'),
(101017, 'MS', 99904, 1001, '2018-04-05 00:00:00', 'Unseen'),
(101018, 'MS', 99905, 1002, '2018-04-04 00:00:00', 'Unseen'),
(101019, 'JR', 98701, 1001, '2018-04-06 00:00:00', 'Seen'),
(101020, 'JR', 98702, 1006, '2018-04-22 00:00:00', 'Unseen'),
(101021, 'JR', 98703, 1002, '2018-04-03 00:00:00', 'Seen'),
(101022, 'AP', 55505, 1002, '2018-04-07 00:00:00', 'Unseen'),
(101023, 'FRUpd', 33310, 1006, '2018-04-03 00:00:00', 'Seen'),
(101024, 'FRUpd', 33309, 1006, '2018-04-14 00:00:00', 'Seen'),
(101025, 'FRUpd', 33307, 1004, '2018-04-08 00:00:00', 'Seen'),
(101026, 'FRUpd', 33305, 1003, '2018-04-19 00:00:00', 'Seen'),
(101027, 'FRUpd', 33304, 1002, '2018-03-15 00:00:00', 'Seen'),
(101028, 'FRUpd', 33311, 1005, '2018-04-11 00:00:00', 'Unseen'),
(101029, 'FRUpd', 33306, 1004, '2018-04-05 00:00:00', 'Seen'),
(101031, 'FRUpd', 33302, 1001, '2018-04-09 00:00:00', 'Seen'),
(101039, 'FRUpd', 33301, 1001, '2018-04-10 00:00:00', 'Seen'),
(101040, 'AP', 55503, 1004, '2018-04-16 00:00:00', 'Unseen'),
(101041, 'JB', 1111, 1003, '2018-04-17 00:00:00', 'Unseen'),
(101042, 'JB', 1112, 1003, '2018-04-21 00:00:00', 'Unseen'),
(101043, 'JB', 1116, 1001, '2018-04-22 00:00:00', 'Unseen'),
(101044, 'JB', 1115, 1006, '2018-04-22 00:00:00', 'Unseen'),
(101045, 'JB', 1111, 1002, '2018-03-17 00:00:00', 'Seen'),
(101046, 'JB', 1113, 1005, '2018-03-26 00:00:00', 'Seen'),
(101047, 'JR', 98704, 1006, '2018-04-19 00:00:00', 'Unseen');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `sid` int(11) NOT NULL,
  `sname` varchar(45) DEFAULT NULL,
  `uni` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  `gpa` float DEFAULT NULL,
  `spwd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`sid`, `sname`, `uni`, `degree`, `major`, `gpa`, `spwd`) VALUES
(1001, 'Adam', 'NYU', 'MS', 'CS', 3.2, '$2y$10$QlC0fHRYIMzvwnxgtRiZTevpXjQYr7mT2JvVl3yZcjdAOe9G3J00S'),
(1002, 'Susan', 'Columbia University', 'MS', 'Business management', 4, '$2y$10$WgK.0IGqgS8Dlp5rqkAb3uS2QfW4RhebnEOp2FTLNioX4rYyeb066'),
(1003, 'Amy', 'Cornell University', 'BS', 'CS', 3.7, '$2y$10$S8sVmixgMtwXWKQZw.Ijq.Hw3An93rYd15EazNfKBMabd8Hz6.cyu'),
(1004, 'Chris', 'CUNY', 'MS', 'MOT', 3.6, '$2y$10$JdErZUw2YH7q1eRzsO66fOf7FVSK9vxXLZ57p1ONIzA0DXrjWruo6'),
(1005, 'Naomi', 'SUNY', 'BS', 'Psychology', 3.1, '$2y$10$nFL9D3M6d79wp0FuOo1VbOQKCH1HmKbHXWGk/CBKtpt3XP7DM5OjC'),
(1006, 'Hanna', 'NYU', 'MS', 'CS', 3.8, '$2y$10$FXgi4dyFnaM4rSRRgzNneu7s1Z80E9042apRKLZfEG8Z6eJomHp.i'),
(1007, 'Simon', 'NYU', 'MS', 'Mathematics', 3.7, '$2y$10$Rhh9NcLDFVocVCxJv5jwmeFHldYO/QOpIwk2X95Jhhnrb/XeJZWGK'),
(1012, 'Snehaa', 'NYU', 'MS', 'CS', 4, '$2y$10$Euz97JReWehcijKP5J4Ea.difKIDNDPQIA7qXzWHFjz9xTXEIecQm');

-- --------------------------------------------------------

--
-- Table structure for table `StudInfo`
--

CREATE TABLE `StudInfo` (
  `sid` int(11) NOT NULL,
  `keyword` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `StudInfo`
--

INSERT INTO `StudInfo` (`sid`, `keyword`) VALUES
(1001, 'software'),
(1002, 'civil'),
(1003, 'database'),
(1004, 'python'),
(1005, 'business'),
(1006, 'analyst'),
(1007, 'machine');

-- --------------------------------------------------------

--
-- Table structure for table `StudResume`
--

CREATE TABLE `StudResume` (
  `resid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `resume` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `StudResume`
--

INSERT INTO `StudResume` (`resid`, `sid`, `resume`) VALUES
(12301, 1003, 'Amy - BS in CS. 6 month internship at NYC MTA. Experience with MySQL backend systems. In depth knowledge of database systems. Looking for a full time positions preferably in Database Systems and Back end development.'),
(12302, 1001, 'Adam - New York. Expected to graduate in Spring 2018 with MSCS. BSCS GPA 3.8. Possess practical knowledge in software engineering and development. Worked for 2 years prior to MS. Actively looking for jobs that matc my expertise. Email : adamschummer@gmail.com'),
(12303, 1005, 'Naomi - Final year BS student at CUNY. Major in psychology. Looking for full time jobs fitting my profile to gain experience in clinical psychology before beginning graduate study in clinical psychology. '),
(12304, 1002, 'Susan - MS in Business Management. First of my class with a perfect GPA of 4. Actively looking for top job environment for me to grow in. No prior experience but possess demontrated skills in school projects.'),
(12305, 1003, 'Amy - BS in CS. 6 month internship at NYC MTA. Experience with MySQL backend systems. In depth knowledge of database systems. Looking for a full time positions preferably in Database Systems and Back end an software engineering. Sound knowledge of Big Data analysis. Comfortable working in Hadoop environment. Strong data structures knowledge.'),
(12306, 1007, 'Simon - Diligent graduate student pursuing MS in Mathematics, looking for full time positions in industry and in the research world to expand my skills and apply my knowledge.'),
(12307, 1004, 'Chris - Hardworking student looking for jobs in Management of Technology positions. MS in MOT. Expected to grauate in Summer 2018. Relocation will not be a problem. ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Applications`
--
ALTER TABLE `Applications`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `resid` (`resid`),
  ADD KEY `jobid` (`jobid`);

--
-- Indexes for table `Company`
--
ALTER TABLE `Company`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `Following`
--
ALTER TABLE `Following`
  ADD PRIMARY KEY (`flwid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `FriendReq`
--
ALTER TABLE `FriendReq`
  ADD PRIMARY KEY (`frid`),
  ADD KEY `sidfrom` (`sidfrom`),
  ADD KEY `sidto` (`sidto`);

--
-- Indexes for table `JobRec`
--
ALTER TABLE `JobRec`
  ADD PRIMARY KEY (`recid`),
  ADD KEY `recto` (`recto`);

--
-- Indexes for table `Jobs`
--
ALTER TABLE `Jobs`
  ADD PRIMARY KEY (`jobid`,`cid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `Messages`
--
ALTER TABLE `Messages`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `msgfrom` (`msgfrom`),
  ADD KEY `msgto` (`msgto`);

--
-- Indexes for table `NotificationCmp`
--
ALTER TABLE `NotificationCmp`
  ADD PRIMARY KEY (`cnid`),
  ADD KEY `cnrecp` (`cnrecp`);

--
-- Indexes for table `NotificationStud`
--
ALTER TABLE `NotificationStud`
  ADD PRIMARY KEY (`snid`),
  ADD KEY `snrecp` (`snrecp`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `StudInfo`
--
ALTER TABLE `StudInfo`
  ADD PRIMARY KEY (`sid`,`keyword`);

--
-- Indexes for table `StudResume`
--
ALTER TABLE `StudResume`
  ADD PRIMARY KEY (`resid`),
  ADD KEY `sid` (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Applications`
--
ALTER TABLE `Applications`
  MODIFY `appid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55507;

--
-- AUTO_INCREMENT for table `Company`
--
ALTER TABLE `Company`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10007;

--
-- AUTO_INCREMENT for table `Following`
--
ALTER TABLE `Following`
  MODIFY `flwid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7777;

--
-- AUTO_INCREMENT for table `FriendReq`
--
ALTER TABLE `FriendReq`
  MODIFY `frid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33312;

--
-- AUTO_INCREMENT for table `JobRec`
--
ALTER TABLE `JobRec`
  MODIFY `recid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98704;

--
-- AUTO_INCREMENT for table `Messages`
--
ALTER TABLE `Messages`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99910;

--
-- AUTO_INCREMENT for table `NotificationCmp`
--
ALTER TABLE `NotificationCmp`
  MODIFY `cnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201013;

--
-- AUTO_INCREMENT for table `NotificationStud`
--
ALTER TABLE `NotificationStud`
  MODIFY `snid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101048;

--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1013;

--
-- AUTO_INCREMENT for table `StudResume`
--
ALTER TABLE `StudResume`
  MODIFY `resid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12308;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Applications`
--
ALTER TABLE `Applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`),
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`resid`) REFERENCES `StudResume` (`resid`),
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`jobid`) REFERENCES `Jobs` (`jobid`);

--
-- Constraints for table `Following`
--
ALTER TABLE `Following`
  ADD CONSTRAINT `following_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`),
  ADD CONSTRAINT `following_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `Company` (`cid`);

--
-- Constraints for table `FriendReq`
--
ALTER TABLE `FriendReq`
  ADD CONSTRAINT `friendreq_ibfk_1` FOREIGN KEY (`sidfrom`) REFERENCES `Student` (`sid`),
  ADD CONSTRAINT `friendreq_ibfk_2` FOREIGN KEY (`sidto`) REFERENCES `Student` (`sid`);

--
-- Constraints for table `JobRec`
--
ALTER TABLE `JobRec`
  ADD CONSTRAINT `jobrec_ibfk_1` FOREIGN KEY (`recto`) REFERENCES `Student` (`sid`);

--
-- Constraints for table `Jobs`
--
ALTER TABLE `Jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `Company` (`cid`);

--
-- Constraints for table `Messages`
--
ALTER TABLE `Messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`msgfrom`) REFERENCES `Student` (`sid`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`msgto`) REFERENCES `Student` (`sid`);

--
-- Constraints for table `NotificationCmp`
--
ALTER TABLE `NotificationCmp`
  ADD CONSTRAINT `notificationcmp_ibfk_1` FOREIGN KEY (`cnrecp`) REFERENCES `Company` (`cid`);

--
-- Constraints for table `NotificationStud`
--
ALTER TABLE `NotificationStud`
  ADD CONSTRAINT `notificationstud_ibfk_1` FOREIGN KEY (`snrecp`) REFERENCES `Student` (`sid`);

--
-- Constraints for table `StudInfo`
--
ALTER TABLE `StudInfo`
  ADD CONSTRAINT `studinfo_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`);

--
-- Constraints for table `StudResume`
--
ALTER TABLE `StudResume`
  ADD CONSTRAINT `studresume_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`);