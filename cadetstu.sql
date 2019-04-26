-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2019 at 04:59 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cadetstu`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblprivileges`
--

CREATE TABLE `tblprivileges` (
  `UserSecGroup` varchar(25) DEFAULT NULL,
  `PrivilegeID` int(11) DEFAULT NULL,
  `ssnView` tinyint(1) NOT NULL COMMENT 'SSN_VIEW',
  `cnView` tinyint(1) NOT NULL COMMENT 'Counselor Notes_View',
  `cnEdit` tinyint(1) NOT NULL COMMENT 'Counselor Notes_Edit',
  `mtView` tinyint(1) NOT NULL COMMENT 'Medical tab_View',
  `mtEdit` tinyint(1) NOT NULL COMMENT 'Medical tab_Edit',
  `eaEdit` tinyint(1) NOT NULL COMMENT 'Enrollment Address_Edit',
  `phEdit` tinyint(1) NOT NULL COMMENT 'Person Header_Edit',
  `bmEdit` tinyint(1) NOT NULL COMMENT 'Budget Module_View',
  `rmView` tinyint(1) NOT NULL COMMENT 'Reports Menu_View',
  `amView` tinyint(1) NOT NULL COMMENT 'Admin Menu_View',
  `smEdit` tinyint(1) NOT NULL COMMENT 'Staff Menu_View/Edit',
  `gUpdates` tinyint(1) NOT NULL COMMENT 'Group Updates',
  `ecApplication` tinyint(1) NOT NULL COMMENT 'Enter Cadet Application',
  `emApplication` tinyint(1) NOT NULL COMMENT 'Enter Mentor Application',
  `fpSearch` tinyint(1) NOT NULL COMMENT 'Find a Person Search'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblprivileges`
--

INSERT INTO `tblprivileges` (`UserSecGroup`, `PrivilegeID`, `ssnView`, `cnView`, `cnEdit`, `mtView`, `mtEdit`, `eaEdit`, `phEdit`, `bmEdit`, `rmView`, `amView`, `smEdit`, `gUpdates`, `ecApplication`, `emApplication`, `fpSearch`) VALUES
('Custom1', 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1),
('Admissions', 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1),
('Cadre', 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1),
('Case Mgr', 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1),
('Custom4', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1),
('Custom3', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1),
('Admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
('Custom5', 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1),
('Custom6', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1),
('Custom7', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1),
('Custom8', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1),
('Custom9', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1),
('Custom10', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1),
('Custom2', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1),
('Teacher', 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `UserLoginName` varchar(25) NOT NULL,
  `UserPW` varchar(12) NOT NULL,
  `Identity` varchar(50) DEFAULT NULL,
  `Privilege` varchar(255) NOT NULL,
  `IsSuperuser` tinyint(1) DEFAULT '0',
  `fkSiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`UserLoginName`, `UserPW`, `Identity`, `Privilege`, `IsSuperuser`, `fkSiteID`) VALUES
('abbott', 'Hello', 'Teacher', 'Admin', 1, 1),
('admissions', 'Hello', 'Admissions', 'Admissions', 0, 0),
('aervin', 'Hello', 'Recruiter', 'Admissions', 0, 0),
('alexander', 'Hello', 'Post-Res', 'Case Mgr', 0, 0),
('allen', 'Hello', 'Operations', 'Custom2', 0, 0),
('Bailey', 'Hello', 'Director', 'Admin', 1, 0),
('bates', 'Hello', 'Post-Res', 'Case Mgr', 0, 0),
('bello', 'Hello', 'CAN', 'Custom4', 0, 0),
('bill', 'Hello', 'Director Recruitment', 'Admin', 1, 0),
('bostic', 'Hello', '2nd LT', 'Custom3', 0, 0),
('broach', 'Hello', 'Operations', 'Custom2', 0, 0),
('butts', 'Hello', 'LPN', 'Custom1', 0, 0),
('cmosley', 'Hello', 'LPN', 'Custom1', 0, 0),
('counselor', 'Hello', 'counselors', 'Counselor', 0, 0),
('cwall', 'Hello', 'CAN', 'Custom1', 0, 0),
('dbutts', 'Hello', NULL, 'Custom4', 0, 0),
('drummand', 'Hello', 'Counselor', 'Counselor', 0, 0),
('durham', 'Hello', 'Senior TAC', 'Custom3', 0, 0),
('edu', 'Helloly', 'Education', 'Teacher', 0, 0),
('ehamilton', 'Hello', 'Recruiter', 'Admissions', 0, 0),
('gilbert', 'Hello', 'Post-Res', 'Case Mgr', 0, 0),
('givens', 'Hellotry', 'LPN', 'Custom4', 1, 0),
('gp', 'Hello', 'Designer', 'Admin', 1, 1),
('green', 'Hello', 'Senior TAC', 'Custom3', 1, 0),
('harrison', 'Hello', 'Operatons', 'Custom3', 0, 0),
('hartman', 'Hello', 'Executive Assistant', 'Admin', 1, 0),
('howland', 'Hello', 'Deputy Director', 'Admin', 0, 0),
('jhelms', 'Hello', 'Recruiter', 'Admissions', 0, 0),
('jyam', 'Hello', 'Counselor', 'Custom3', 0, 0),
('kaufman', 'Hello', 'Post-Res', 'Admin', 1, 0),
('king', 'Hello', 'OPS', 'Custom2', 0, 0),
('lawrence', 'Hello', 'Senior TAC', 'Custom3', 0, 0),
('lhamilton', 'Hello', 'Teacher', 'Teacher', 0, 0),
('longacre', 'Hello', 'Operations', 'Custom2', 0, 0),
('ltsmith', 'Hello', 'Senior TAC', 'Custom2', 0, 0),
('major', 'Hello', 'Commadant', 'Custom3', 0, 0),
('med', 'Hello', 'Medical', 'Custom1', 0, 0),
('mintz', 'Hello', 'LT', 'Custom3', 0, 0),
('mis', 'Hello', 'Site Point of Contact', 'Admin', 1, 0),
('pjohnson', 'Hello', 'Senior TAC', 'Custom3', 0, 0),
('postres', 'Hello', 'Post-Res', 'Case Mgr', 0, 0),
('prescott', 'Hello', 'Admissions', 'Admissions', 0, 0),
('rich', 'Hello', 'IT Specialist', 'Admin', 0, 0),
('rjackson', 'Hello', 'Teacher', 'Teacher', 0, 0),
('rsmith', 'Hello', 'Dep Director', 'Admin', 0, 0),
('ryan', 'Hello', 'Post-Res', 'Case Mgr', 0, 0),
('s', 'Hello', 'HR', 'Custom3', 1, 0),
('schoemann', 'Hello', 'Counselor', 'Custom3', 0, 0),
('sdjones', 'Hello', 'Education', 'Teacher', 0, 0),
('sharrison', 'Hello', 'HR', 'Admin', 1, 0),
('sreaves', 'Hello', 'Teacher', 'Teacher', 0, 0),
('su', 'Hello', 'Designer', 'Admin', 1, 1),
('su2', 'Hello', 'Designer', 'Admin', 1, 2),
('tac', 'Hello', 'Senior TAC', 'Cadre', 0, 0),
('wright', 'Hello', 'Lead Teacher', 'Custom3', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tlkpsite`
--

CREATE TABLE `tlkpsite` (
  `SiteID` int(11) NOT NULL,
  `SiteName` varchar(50) DEFAULT NULL,
  `SiteCode` varchar(5) NOT NULL,
  `SiteAddress` varchar(50) DEFAULT NULL,
  `SiteCity` varchar(30) DEFAULT NULL,
  `SiteState` varchar(2) DEFAULT NULL,
  `SiteZip` varchar(5) DEFAULT NULL,
  `SitePhone` varchar(10) DEFAULT NULL,
  `SiteFax` varchar(10) DEFAULT NULL,
  `SchoolType` varchar(25) DEFAULT NULL,
  `StartingNGB` int(11) DEFAULT NULL,
  `USDASchoolLunch` tinyint(1) DEFAULT '0',
  `StudentGovt` tinyint(1) DEFAULT '0',
  `BackgroundChkSrc` varchar(100) DEFAULT NULL,
  `DefaultTABEVers` varchar(10) DEFAULT NULL,
  `UnionsCount` int(11) DEFAULT NULL,
  `Sec501c3AltFunding` tinyint(1) DEFAULT '0',
  `Sec501c3Foundation` tinyint(1) DEFAULT '0',
  `RequireSSN` tinyint(1) DEFAULT '0',
  `SiteLogo` varchar(255) DEFAULT NULL,
  `LegislatorLink` longtext,
  `PrimaryColor` varchar(8) NOT NULL,
  `SecondaryColor` varchar(8) NOT NULL,
  `TertiaryColor` varchar(8) NOT NULL,
  `InputTextColor` varchar(8) NOT NULL,
  `LabelTextColor` varchar(8) NOT NULL,
  `InputBackgroundColor` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tlkpsite`
--

INSERT INTO `tlkpsite` (`SiteID`, `SiteName`, `SiteCode`, `SiteAddress`, `SiteCity`, `SiteState`, `SiteZip`, `SitePhone`, `SiteFax`, `SchoolType`, `StartingNGB`, `USDASchoolLunch`, `StudentGovt`, `BackgroundChkSrc`, `DefaultTABEVers`, `UnionsCount`, `Sec501c3AltFunding`, `Sec501c3Foundation`, `RequireSSN`, `SiteLogo`, `LegislatorLink`, `PrimaryColor`, `SecondaryColor`, `TertiaryColor`, `InputTextColor`, `LabelTextColor`, `InputBackgroundColor`) VALUES
(0, 'Site Three', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '', '', '', '', '', '#000000'),
(1, 'Fort Stewart Youth ChalleNGe Academy', 'Code1', 'Niles Avenue & 16th Street', 'Fort Stewart', 'GA', '31315', '9128761715', '9127675566', 'ChalleNGe', 48, 1, 1, 'tests', '9/10', 0, 0, 0, 0, 'GaYCP_LOGOv4.png', '', '#ffffff', '#0080FF', '#FFFF66', '#ff0000', '#66ccff', '#000000'),
(2, 'Fort Gordon Youth ChalleNGe Academy', 'Code2', 'Youth Challenge Academy P.O. Box 7620', 'Fort Gordon', 'GA', '30905', '7068238000', '7067915979', 'ChalleNGe', 48, 0, 0, 'tests', '9/10', 0, 0, 0, 0, 'fglogo.jpg', '', '#E0E0E0', '#0080FF', '#FFFF66', '#202020', '#00ffff', '#000000'),
(3, 'Milledgeville Youth ChalleNGe Academy', 'Code3', '451 Baland Circle', 'Milledgeville', 'GA', '31061', '4784450100', '4784450101', 'ChalleNGe', 48, 0, 0, 'tests', '9/10', 0, 0, 0, 0, 'mvlogo.jpg', '', '#E0E0E0', '#0080FF', '#FFFF66', '#202020', '#66ffff', '#000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblprivileges`
--
ALTER TABLE `tblprivileges`
  ADD KEY `PrivilegeID` (`PrivilegeID`),
  ADD KEY `UserSecGroup` (`UserSecGroup`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`UserLoginName`),
  ADD KEY `Identity` (`Identity`);

--
-- Indexes for table `tlkpsite`
--
ALTER TABLE `tlkpsite`
  ADD PRIMARY KEY (`SiteID`),
  ADD UNIQUE KEY `SiteCode` (`SiteCode`),
  ADD UNIQUE KEY `SiteID` (`SiteID`),
  ADD KEY `SiteState` (`SiteState`),
  ADD KEY `UnionsCount` (`UnionsCount`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tlkpsite`
--
ALTER TABLE `tlkpsite`
  MODIFY `SiteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
