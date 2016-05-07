# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.63)
# Database: books
# Generation Time: 2016-04-25 21:12:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bookmarks`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `folders`;

CREATE TABLE `Bookmarks` (
  `id`           int(11) unsigned       NOT NULL AUTO_INCREMENT,
  `url`          varchar(512)           DEFAULT NOT NULL,
  `folderId`     int(11) unsigned       DEFAULT NOT NULL,
  `name`         varchar(40)            DEFAULT NULL,
  `description`  varchar(2048)          DEFAULT NULL,
  `keywords`     varchar(256)           DEFAULT NULL,
  `favorite`     int(1) unsigned        DEFAULT NOT NULL,

  PRIMARY KEY (`id`),
  KEY FK_FolderId (folderId),
    CONSTRAINT FK_Folder FOREIGN KEY (folderId) REFERENCES Folders (id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `Folders` (
   `id`           int(11) unsigned       NOT NULL AUTO_INCREMENT,
   `name`         varchar(64)            DEFAULT NOT NULL,
   `parent`       int(11) unsigned       NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `Users` (
  `id`          int(11) unsigned       NOT NULL AUTO_INCREMENT,
  `username`    varchar(32)            DEFAULT NOT NULL,
  `password`    varchar(32)            DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


LOCK TABLES `folders` WRITE;
INSERT INTO `folders` (`id`, `name`, `parent`)

VALUE
    (1, 'root', 0)


LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;

INSERT INTO `bookmarks` (`id`, `url`, `folderId`, `name`, `description`, `keywords`, `favorite`)

VALUES
	(1, 'https://mail.google.com'  ,1 , , , , ),
	(2, 'https://www.facebook.com/',1 , , , , ),
	(3, 'https://angularjs.org/'   ,1 , , , , ),
	(4, 'https://github.com/'      ,1 , , , , )

/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



DROP TABLE IF EXISTS `Bookmarks`;
DROP TABLE IF EXISTS `Users`;
DROP TABLE IF EXISTS `Folders`;

CREATE TABLE `Bookmarks` (
  `id`           int(11) unsigned       NOT NULL AUTO_INCREMENT,
  `url`          varchar(512)           NOT NULL,
  `folderId`     int(11) unsigned       NOT NULL,
  `name`         varchar(40)            DEFAULT NULL,
  `description`  varchar(2048)          DEFAULT NULL,
  `keywords`     varchar(256)           DEFAULT NULL,
  `favorite`     int(1) unsigned        NOT NULL,

  PRIMARY KEY (`id`),
  KEY FK_FolderId (folderId),
    CONSTRAINT FK_Folder FOREIGN KEY (folderId) REFERENCES Folders (id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `Folders` (
   `id`           int(11) unsigned       NOT NULL AUTO_INCREMENT,
   `name`         varchar(64)            NOT NULL,
   `parent`       int(11) unsigned       NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `Users` (
  `id`          int(11) unsigned       NOT NULL AUTO_INCREMENT,
  `username`    varchar(32)            NOT NULL,
  `password`    varchar(32)            DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



LOCK TABLES `Folders` WRITE;
/*!40000 ALTER TABLE `Folders` DISABLE KEYS */;

INSERT INTO `Folders` (`id`, `name`, `parent`)

VALUE
    (1, 'root', 0);


/*!40000 ALTER TABLE `Folders` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `Bookmarks` WRITE;
/*!40000 ALTER TABLE `Bookmarks` DISABLE KEYS */;

INSERT INTO `Bookmarks` (`id`, `url`, `folderId`, `name`, `description`, `keywords`, `favorite`)

VALUES
	(1, 'https://mail.google.com'  ,1, NULL,NULL ,NULL ,0 ),
	(2, 'https://www.facebook.com/',1, NULL,NULL ,NULL ,0 ),
	(3, 'https://angularjs.org/'   ,1, NULL,NULL ,NULL ,0 ),
	(4, 'https://github.com/'      ,1, NULL,NULL ,NULL ,0 );
--	(5, ''  ,1, NULL,NULL ,NULL ,0 ),
--    (6, 'https://www.facebook.com/',1, NULL,NULL ,NULL ,0 ),
--    (7, 'https://angularjs.org/'   ,1, NULL,NULL ,NULL ,0 ),
--    (8, 'https://github.com/'      ,1, NULL,NULL ,NULL ,0 );


/*!40000 ALTER TABLE `Bookmarks` ENABLE KEYS */;
UNLOCK TABLES;





