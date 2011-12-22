DROP TABLE IF EXISTS `ranking`;
CREATE TABLE `ranking` (
       `id` int(10) unsigned NOT NULL  AUTO_INCREMENT,
       `userid` int(10) unsigned NOT NULL,
       `score` int(10) unsigned NOT NULL,
       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
