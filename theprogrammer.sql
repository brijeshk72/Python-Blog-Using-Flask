-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2018 at 08:06 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theprogrammer`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(5) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'Amit', '1234567890', 'Hello Amit', '2018-12-28 04:46:41', 'amit@gmail.com'),
(2, 'fake', '2345678998', 'hello all fake user', '2018-12-28 05:28:58', 'fake@gmail.com'),
(3, 'Brijesh Singh Kushwaha', '78978978', 'Please Solve my problem', '2018-12-29 09:10:46', 'kushwahab46@gmail.com'),
(4, 'Mr. km', '5676567887', 'how to make web application using flask', '2018-12-29 12:27:39', 'km@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `date`) VALUES
(1, 'A stock market, equity market or share market', 'first-post', 'A stock market, equity market or share market, crypto market is the aggregation of buyers and sellers (a loose network of economic transactions, not a physical facility or discrete entity) of stocks (also called shares), which represent ownership claims on businesses; these may include securities listed on a public stock exchange, as well as stock that is only traded privately. Examples of the latter include shares of private companies which are sold to investors through equity crowdfunding platforms. Stock exchanges list shares of common equity as well as other security types', '2018-12-29 07:51:54'),
(2, 'Instagram Blames \'Bug\' for Design Change That Prompted Backlash', 'Second-post', 'Instagram said Thursday it accidentally rolled out a design change to a large number of users and quickly ended the test after complaints from users of the Facebook-owned social network.\r\n\r\nThe redesign required users to swipe horizontally instead of the normal vertical scroll to see their feed, befuddling many members of the photo- and video-sharing application, which has over one billion users worldwide.', '2018-12-28 13:49:28'),
(3, 'Netflix Users Being Targeted by Phishing Scam, US FTC Warns', 'Netflix-user-scam', 'If you are a Netflix subscriber and have received a strange email, it is likely to be another phishing scam. The US Federal Trade Commission (FTC) has issued a warning for a reported email phishing scam targeted at users of the streaming service.\r\n\r\nIn a phishing scam, scammers can use fake emails to pose as authentic company in order to steal personal data of the users such as account numbers, social security numbers, financial details, even passwords', '2018-12-29 07:53:06'),
(4, 'LazyPay Ties Up With Airtel, Flipkart to Expand Its \'Buy Now Pay Later\' Model', 'LazyPay-Ties-Airtel-flipk', 'LazyPay on Thursday announced its partnership with Airtel(telecom) and Flipkart. With the new development, customers purchasing through Flipkart will be able to avail EMI option at the time of checking out. Similar will be the case for Airtel subscribers as they\'ll now get \'buy now pay later\' option while buying prepaid recharges. Since its launch in April last year, LazyPay is claimed to have seen 35 percent month-on-month growth. The deferred payment platform owned by fintech giant PayU is also offering the emerging \'buy now pay later\' model on apps such as Swiggy, Ixigo, and BookMyShow.', '2018-12-29 10:55:02'),
(6, 'Twitter suspends account impersonating Russian president Putin', 'Twitter-suspends-account', 'The social media twitter platform said it had suspended @putinRF_eng \"for impersonation based on a valid report we received from Russian officials\".  The account was reportedly created in 2012 and posted mainly official links to Mr Putin\'s public appearances.', '2018-12-29 09:30:28'),
(8, 'Why India needs to take technology seriously', 'India-needs-technology', 'In the recent years, rising income inequality and jobless growth have been subjects of discussion and debate. A February 2018 New World Wealth report (‘Global Wealth Migration Review’, goo.gl/R9x5qX) claimed that India is the second-most ‘unequal’ country in the world, with millionaires controlling 54% of the wealth', '2018-12-29 12:23:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
