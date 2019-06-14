-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 14, 2019 at 05:21 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_site`
--
CREATE DATABASE IF NOT EXISTS `blog_site` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blog_site`;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `about`, `username`, `password`) VALUES
(1, 'Hello', 'This is something', 'lana', '111'),
(3, 'My Awesome Blog', 'bla', 'blabla', '1111'),
(4, 'My Awesome Blog', 'lol', 'vitalii', '1'),
(5, 'My Awesome Blog', 'Super duper awesome blog!', 'lalalala', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `blogs_communities`
--

CREATE TABLE `blogs_communities` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `name`, `description`) VALUES
(1, 'Sport', 'Yoga bla  bla'),
(2, 'Travelling', 'Bla bla bla'),
(3, 'fff', 'fffff');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `blog_id`, `title`, `content`, `date`, `file`) VALUES
(1, 1, 'This is first post', 'This is content of a very first post', '2019-05-20 00:00:00', NULL),
(2, 1, 'This is second post', 'This is a second post content', '2019-05-20 00:00:00', NULL),
(3, 1, 'Hello', 'Hello world', '2019-05-21 00:00:00', NULL),
(4, 0, 'bla', 'bnls', '2019-05-21 21:57:14', NULL),
(5, 3, 'bla', 'bla', '2019-05-21 22:23:25', NULL),
(6, 3, 'bla', 'bla', '2019-05-21 22:24:25', NULL),
(7, 1, 'Test', 'dfgdfg dfg dfg df', '2019-05-21 23:08:11', NULL),
(8, 1, 'Test2', 'dfgdfg dfg dfg df', '2019-05-21 23:09:04', NULL),
(9, 3, 'bla', 'bla', '2019-05-22 00:20:49', '1.jpg'),
(10, 3, 'bla1', 'bla1', '2019-05-22 00:22:40', NULL),
(11, 1, 'test3', 'test test', '2019-05-22 09:28:42', '1.jpg'),
(29, 5, 'My super shitty day', 'Lorem ipsum shitty day', '2019-05-23 14:41:30', '1.jpg'),
(30, 5, 'My super duper day', 'Lorem ipsum bla bla bla', '2019-05-23 14:53:46', NULL),
(31, 5, 'bla', 'bla', '2019-05-23 21:50:08', '1.jpg'),
(53, 5, 'bla', 'Lorem ipsum dolor sit amet, ea nemore saperet sea. Nec te aeterno probatus principes, autem dolor ex ius. At has eirmod ancillae scriptorem, at patrioque euripidis nam, vix facer errem verterem in. An autem commodo quo, te sit possim impetus, his quas ubique aliquando an. Veniam melius explicari sit ex, causae utamur no pri, his no convenire iudicabit. Eos nisl verear eu, no quod vide saepe cum, detracto vulputate per ea.\r\n\r\nSummo explicari constituto at mel, ei vel zril eripuit philosophia, dicat maiestatis id vim. Ea audire debitis ancillae his. Timeam sententiae an sed, ex his officiis tincidunt. Adhuc argumentum ad sea. Soleat periculis eam ex.\r\n\r\nCu cum esse reformidans, ut nam sint doctus, quo te falli regione. Tota omittantur sea id, an vel tamquam legendos salutandi, pro ferri fierent dissentias et. Cum ut mundi audire, vim in essent labores deterruisset. At quodsi vocent mediocritatem quo.\r\n\r\nVocibus graecis ne usu, vel ei quis liberavisse. Scripta urbanitas vel ad, vim ornatus maluisset te. Nulla quaeque nec eu, aperiri lobortis vim ad. Ne sea case wisi civibus, in postea probatus mei.\r\n\r\nSimul splendide appellantur eu ius, per in accusata interpretaris. Mazim recteque definitionem sea at, id usu possit commodo. Autem explicari sea ne, in lorem graece quidam cum. Eam suas mediocrem et. An etiam intellegebat pri, error ludus homero te vim, mea odio ullum epicurei ut.\r\n\r\nConsetetur appellantur et quo, et dicam detracto mei, elit munere probatus mei ei. Mel noster fastidii atomorum cu, eam solet aliquid erroribus id. Vix soluta electram appellantur ea. Case docendi duo te. Vide legimus ea sit, soleat recteque salutandi ex sea.\r\n\r\nUsu et movet omnium, his ea utroque omnesque pericula. Ius ad docendi expetenda percipitur, sed in civibus definitiones. Ius ne intellegat inciderint adversarium. Omnium lobortis cu per. At debitis salutatus sit, sed populo nostro audire ut, quaeque docendi his ut. Cu vim porro legendos platonem.\r\n\r\nEx aperiri detraxit nam. Ut has iudico disputationi, duo ex adhuc nonumes eloquentiam. Nulla fuisset ancillae at quo, sea et quis dicat utroque, minimum percipitur mel an. Ad vim vide inciderint, per mucius suavitate te. Ut vidisse senserit quo, quo mentitum nominavi elaboraret ut, at omnium ullamcorper consectetuer sit.\r\n\r\nHas ut option feugiat, cu dicit facilisis aliquando qui, per cu diam omnium facilisi. In sea sumo sanctus ceteros, efficiendi instructior eam in, ocurreret incorrupte usu ei. Duo ea vitae legere menandri, vix id saepe voluptatibus. Id ius iisque lucilius, eu probo verear deleniti est. Quo at erant luptatum sententiae, voluptatum disputando id eam. At eum inani scripserit, in sed scripta aperiri.\r\n\r\nVoluptaria inciderint sit ea, summo evertitur ei usu. Simul volumus similique nam ut, te verterem interesset his, id sed gloriatur percipitur. Duo cu facer saepe possim, ad mei dicit eirmod, viris iudicabit vix in. Te volutpat intellegat nam. Vix dico posidonium cu, eam id nonumy lobortis maiestatis.', '2019-05-24 12:28:39', '636942982067809370DSC_0377.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `session_blogs`
--

CREATE TABLE `session_blogs` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session_blogs`
--

INSERT INTO `session_blogs` (`id`, `blog_id`) VALUES
(5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs_communities`
--
ALTER TABLE `blogs_communities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_blogs`
--
ALTER TABLE `session_blogs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs_communities`
--
ALTER TABLE `blogs_communities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `communities`
--
ALTER TABLE `communities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `session_blogs`
--
ALTER TABLE `session_blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
