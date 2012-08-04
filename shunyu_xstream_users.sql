-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 04, 2012 at 11:33 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shunyu_xstream_users`
--

-- --------------------------------------------------------

--
-- Table structure for table `share`
--

CREATE TABLE IF NOT EXISTS `share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `videoId` int(11) DEFAULT NULL,
  `sharepersonId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `videoId` (`videoId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `share`
--

INSERT INTO `share` (`id`, `userId`, `videoId`, `sharepersonId`) VALUES
(3, 6, 2, 5),
(47, 7, 22, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `token` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `email`, `token`) VALUES
(4, 'terence', 'f56b2700382c1c9513a881d2c2af9f1b', 'terence', 'terence@terence.com', 'T1==cGFydG5lcl9pZD0xNzAwMzE1MSZzaWc9MjY4MDU2NGEyZDZmZTRhNzBlYjYzOWYyNTEzMWYzMzRjZDg2ZDZiNDpzZXNzaW9uX2lkPTFfTVg0eE1UUXlNVGczTW41LU1qQXhNaTB3Tmkwd09DQXdNVG93TmpvMU1DNDBOVE14TXpJck1EQTZNREItTUM0ME9UWTBPVE0zTmpJek1qaCZjcmVhdGVfd'),
(5, 'terence2', '914ed82d244e1eccb92ac5834d435c00', 'terence2', 'terence2', 'T1==cGFydG5lcl9pZD0xNzAwMzE1MSZzaWc9ZTg5NjZmZWI5YWFjOGQ0MmNiYWI2YmYzNDQzOTI2YzUxYzdkZDUzZjpzZXNzaW9uX2lkPTFfTVg0eE1UUXlNVGczTW41LU1qQXhNaTB3Tmkwd09DQXdNVG93TmpvMU1DNDBOVE14TXpJck1EQTZNREItTUM0ME9UWTBPVE0zTmpJek1qaCZjcmVhdGVfdGltZT0xMzQ0MDkwNzMzJnJvbGU9bW9kZXJhdG9yJm5vbmNlPTEzNDQwOTA3MzMuOTUyNTE4MTU3MjEzODAmZXhwaXJlX3RpbWU9MTM0NDUyMjczMyZjb25uZWN0aW9uX2RhdGE9aGVsbG8rd29ybGQlMjE='),
(6, 'congchen5', '669d3ced7b4286dc039ebbeb8aa4017a', 'congchen5', 'congchen5@gmail.com', 'T1==cGFydG5lcl9pZD0xNzAwMzE1MSZzaWc9NjI3YTNjYmRhM2JhMzRiY2ZiNjcwYjc5ZWQ0OWI4NTVmOWEyYzQ0NjpzZXNzaW9uX2lkPTFfTVg0eE1UUXlNVGczTW41LU1qQXhNaTB3Tmkwd09DQXdNVG93TmpvMU1DNDBOVE14TXpJck1EQTZNREItTUM0ME9UWTBPVE0zTmpJek1qaCZjcmVhdGVfdGltZT0xMzQ0MTAxOTIzJnJvbGU9bW9kZXJhdG9yJm5vbmNlPTEzNDQxMDE5MjMuMjU3OTE3MTc3NjA1NzEmZXhwaXJlX3RpbWU9MTM0NDUzMzkyMyZjb25uZWN0aW9uX2RhdGE9aGVsbG8rd29ybGQlMjE='),
(7, 'abc', 'c4ca4238a0b923820dcc509a6f75849b', 'abc', '1', 'T1==cGFydG5lcl9pZD0xNzAwMzE1MSZzaWc9MmUxMTcwZDlhNzUxOWM3NjQ1NGJiYTc3Yzg3ZWQyNGFjMWYzZmNjZjpzZXNzaW9uX2lkPTFfTVg0eE1UUXlNVGczTW41LU1qQXhNaTB3Tmkwd09DQXdNVG93TmpvMU1DNDBOVE14TXpJck1EQTZNREItTUM0ME9UWTBPVE0zTmpJek1qaCZjcmVhdGVfdGltZT0xMzQ0MTE0MTQwJnJvbGU9bW9kZXJhdG9yJm5vbmNlPTEzNDQxMTQxNDAuOTQzMTE0OTMzODUwODcmZXhwaXJlX3RpbWU9MTM0NDU0NjE0MCZjb25uZWN0aW9uX2RhdGE9aGVsbG8rd29ybGQlMjE=');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `archiveId` varchar(225) DEFAULT NULL,
  `filename` varchar(225) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `userId`, `archiveId`, `filename`, `comment`, `username`) VALUES
(2, 6, '4a99d56e-cf55-482a-a029-889b488226e8', 'Watch me!', 'This is super fun fun', 'congchen5'),
(22, 7, '6ce8a61d-37c1-4a6d-9360-8614dd0187be', '123', '123', 'abc');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `share`
--
ALTER TABLE `share`
  ADD CONSTRAINT `share_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `share_ibfk_2` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
