-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 04, 2012 at 10:07 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `share`
--

INSERT INTO `share` (`id`, `userId`, `videoId`, `sharepersonId`) VALUES
(15, 7, 25, 5),
(16, 7, 26, 5),
(17, 5, 30, 0),
(18, 5, 30, 5);

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
(5, 'abc', 'c4ca4238a0b923820dcc509a6f75849b', 'abc', '123@abc', 'T1==cGFydG5lcl9pZD0xNzAwMzE1MSZzaWc9ZDlkYzAxZTBiNjFlNmU4NzA4NDIxYzZiMzdmOTg1NjRkYmZmNGMzOTpzZXNzaW9uX2lkPTFfTVg0eE1UUXlNVGczTW41LU1qQXhNaTB3Tmkwd09DQXdNVG93TmpvMU1DNDBOVE14TXpJck1EQTZNREItTUM0ME9UWTBPVE0zTmpJek1qaCZjcmVhdGVfdGltZT0xMzQ0MDkyNjYwJnJvbGU9bW9kZXJhdG9yJm5vbmNlPTEzNDQwOTI2NjAuNjAzMjQyNDQ2MDk4MiZleHBpcmVfdGltZT0xMzQ0NTI0NjYwJmNvbm5lY3Rpb25fZGF0YT1oZWxsbyt3b3JsZCUyMQ=='),
(6, 'a', 'c4ca4238a0b923820dcc509a6f75849b', 'a', '1', 'T1==cGFydG5lcl9pZD0xNzAwMzE1MSZzaWc9MjBlZDdmYzdmZjNhMzBlYzQzNWFlNjEyMjRjZDA4ODI4ZGE3ODhmOTpzZXNzaW9uX2lkPTFfTVg0eE1UUXlNVGczTW41LU1qQXhNaTB3Tmkwd09DQXdNVG93TmpvMU1DNDBOVE14TXpJck1EQTZNREItTUM0ME9UWTBPVE0zTmpJek1qaCZjcmVhdGVfdGltZT0xMzQ0MDk4NTQzJnJvbGU9bW9kZXJhdG9yJm5vbmNlPTEzNDQwOTg1NDMuNjM2MTIwNzYzMTY3NDYmZXhwaXJlX3RpbWU9MTM0NDUzMDU0MyZjb25uZWN0aW9uX2RhdGE9aGVsbG8rd29ybGQlMjE='),
(7, 'test', 'c4ca4238a0b923820dcc509a6f75849b', 'test', '1', 'T1==cGFydG5lcl9pZD0xNzAwMzE1MSZzaWc9N2FmNzdiMzFjMDRhYTYwOTRiYzliYmU5MTIzNzIyMDE3NTZhMjc5MjpzZXNzaW9uX2lkPTFfTVg0eE1UUXlNVGczTW41LU1qQXhNaTB3Tmkwd09DQXdNVG93TmpvMU1DNDBOVE14TXpJck1EQTZNREItTUM0ME9UWTBPVE0zTmpJek1qaCZjcmVhdGVfdGltZT0xMzQ0MTAwODU5JnJvbGU9bW9kZXJhdG9yJm5vbmNlPTEzNDQxMDA4NTkuMzU4Nzc3MzU5MTc1OCZleHBpcmVfdGltZT0xMzQ0NTMyODU5JmNvbm5lY3Rpb25fZGF0YT1oZWxsbyt3b3JsZCUyMQ==');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `archiveId` varchar(225) DEFAULT NULL,
  `filename` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `userId`, `archiveId`, `filename`) VALUES
(1, 7, 'f297f900-83bf-4755-9421-7186f1c26760', 'test'),
(2, 7, '16dff4d1-3611-4d97-8f5f-44b23fa54419', 'test'),
(3, 7, '18f1df40-ea9d-43ef-920c-edb31a9e429a', 'test'),
(4, 7, 'b16777f9-40e5-4245-a25d-1ceb76be1be8', 'test'),
(5, 7, 'a3de37d1-94e2-4cca-9109-649f6212bed8', 'test'),
(6, 7, '88e8392a-cdbf-4b84-88d4-2d32f8c8d630', 'test'),
(7, 7, '04a43273-ec17-4463-ad97-e9653bdef3a3', 'test'),
(8, 7, '346b0093-11fb-4d05-b1d6-a5983e160f17', 'test'),
(9, 7, '920d2fd6-c3c7-49f3-bccb-5dfbdddcf61c', 'test'),
(10, 7, '5b38c9bf-f483-4385-92f3-4b6c6734769c', 'test'),
(11, 7, '03f5c69e-d393-40bb-80f8-20868c19bb88', 'test'),
(12, 7, '3fb86842-4274-4d6a-ab3b-cd42522306cc', 'test'),
(13, 7, '36f60c44-14dc-461f-a59d-a161d0970e12', 'test'),
(14, 7, '6fbc2a32-7c93-4bac-9591-47ee6bba89d8', 'test'),
(15, 7, 'f2546118-8106-4c9c-8f8e-fa4c7ff85465', 'test'),
(16, 7, 'bfc06634-63a0-462d-88d9-4c07e702a1af', 'test'),
(17, 7, 'a84d1dcb-51f1-4260-bc3f-ec70a5eb7844', 'test'),
(18, 7, '7febbd20-42cd-4c84-9308-c07bfd5d4ecf', 'test'),
(19, 7, 'b1caf02f-b10c-4c87-9798-64b40b6004d0', 'test'),
(20, 7, 'dad021e5-6134-4aba-87e3-dd01324c1247', 'test'),
(21, 7, 'e042cc9c-e45e-4bf2-a171-e905b26be073', 'test'),
(22, 7, '7be84002-0056-4db9-8fe3-a881ce70c690', 'test'),
(23, 7, '76d05ef4-9669-42a3-9c56-7c248f4fd082', 'test'),
(24, 7, '43eee9ec-600f-4f7d-801c-b0843c0d3f8a', 'test'),
(25, 7, '95f26f89-d969-4466-9e46-f1e4065e45ec', 'test'),
(26, 7, '52de71cd-941f-463b-a50d-9354bc0cb416', 'test'),
(27, 7, 'cc765d64-6d4b-430d-af88-5a53e53f89ae', 'test'),
(28, 7, '2082ab56-dd28-4f87-9d27-3d2b702423c9', 'test'),
(29, 7, '2082ab56-dd28-4f87-9d27-3d2b702423c9', 'test'),
(30, 5, '4955990a-bc96-4ab2-8f99-28260d4db2c0', 'abc');

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
