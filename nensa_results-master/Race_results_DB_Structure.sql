-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: nensa_results_2017
-- ------------------------------------------------------
-- Server version	5.6.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `JN_U16_RANKING`
--

DROP TABLE IF EXISTS `JN_U16_RANKING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JN_U16_RANKING` (
  `Rank` int(11) NOT NULL,
  `USSA_Num` int(11) NOT NULL,
  `NENSA_Num` int(11) NOT NULL,
  `Season` int(11) NOT NULL,
  `Athlete_Name` varchar(45) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Age_Group` varchar(3) DEFAULT NULL,
  `Club_Name` varchar(45) DEFAULT NULL,
  `Num_Races` int(11) DEFAULT NULL,
  `1stBest_Race_Pts` decimal(5,2) DEFAULT NULL,
  `2ndBest_Race_Pts` decimal(5,2) DEFAULT NULL,
  `3rdBest_Race_Pts` decimal(5,2) DEFAULT NULL,
  `4thBest_Race_Pts` decimal(5,2) DEFAULT NULL,
  `Best2_Avg_Pts` decimal(8,4) DEFAULT NULL,
  `Best3_Avg_Pts` decimal(8,4) DEFAULT NULL,
  `Best4_Avg_Pts` decimal(8,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JN_U18U20_RANKING`
--

DROP TABLE IF EXISTS `JN_U18U20_RANKING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JN_U18U20_RANKING` (
  `Rank` int(11) NOT NULL,
  `USSA_Num` int(11) NOT NULL,
  `NENSA_Num` int(11) NOT NULL,
  `Season` int(11) NOT NULL,
  `Athlete_Name` varchar(45) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Age_Group` varchar(3) DEFAULT NULL,
  `Club_Name` varchar(45) DEFAULT NULL,
  `Num_Races` int(11) DEFAULT NULL,
  `1stBest_Race_Pts` decimal(5,2) DEFAULT NULL,
  `2ndBest_Race_Pts` decimal(5,2) DEFAULT NULL,
  `3rdBest_Race_Pts` decimal(5,2) DEFAULT NULL,
  `4thBest_Race_Pts` decimal(5,2) DEFAULT NULL,
  `Best2_Avg_Pts` decimal(8,4) DEFAULT NULL,
  `Best3_Avg_Pts` decimal(8,4) DEFAULT NULL,
  `Best4_Avg_Pts` decimal(8,4) DEFAULT NULL,
  `JN_Qualification` varchar(45) DEFAULT NULL COMMENT 'Column for Nensa to designate who qualified for the JN team. Auto Qualified, etc.',
  PRIMARY KEY (`NENSA_Num`,`Season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MEMBER_SEASON`
--

DROP TABLE IF EXISTS `MEMBER_SEASON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEMBER_SEASON` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) NOT NULL,
  `nensa_num` mediumint(9) NOT NULL,
  `season` mediumint(4) NOT NULL DEFAULT '0',
  `member_status` varchar(50) NOT NULL DEFAULT 'EXPIRED',
  `member_level` varchar(50) DEFAULT NULL,
  `age_group` varchar(3) NOT NULL DEFAULT '',
  `age_season` tinyint(4) NOT NULL,
  `club_name` varchar(100) DEFAULT NULL,
  `team_name` varchar(100) DEFAULT NULL,
  `school_name` varchar(100) DEFAULT NULL,
  `created_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `JN_qualification` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id_2` (`member_id`,`season`),
  KEY `season` (`season`,`id`),
  KEY `member_id` (`member_id`),
  KEY `id` (`id`,`season`)
) ENGINE=MyISAM AUTO_INCREMENT=6499 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MEMBER_SKIER`
--

DROP TABLE IF EXISTS `MEMBER_SKIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEMBER_SKIER` (
  `member_id` int(7) NOT NULL AUTO_INCREMENT,
  `nensa_num` mediumint(8) DEFAULT NULL,
  `ussa_num` mediumint(8) DEFAULT NULL,
  `first` varchar(50) NOT NULL DEFAULT '',
  `last` varchar(50) NOT NULL DEFAULT '',
  `sex` char(1) NOT NULL DEFAULT '',
  `birthdate` date NOT NULL DEFAULT '0000-00-00',
  `Birth_Year` int(4) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` varchar(50) NOT NULL DEFAULT '',
  `club_name` varchar(50) DEFAULT NULL,
  `created_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `ussa_num` (`ussa_num`),
  UNIQUE KEY `nensa_num_2` (`nensa_num`),
  KEY `birthdate` (`birthdate`,`last`(3)),
  KEY `last` (`last`(1)),
  KEY `nensa_num` (`nensa_num`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=56433 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RACE_EVENT`
--

DROP TABLE IF EXISTS `RACE_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RACE_EVENT` (
  `event_id` int(7) NOT NULL AUTO_INCREMENT,
  `parent_event_id` int(7) DEFAULT NULL,
  `season` mediumint(4) NOT NULL DEFAULT '0',
  `event_name` varchar(150) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `age_group` varchar(255) DEFAULT NULL,
  `technique` varchar(25) DEFAULT NULL,
  `start_format` varchar(30) DEFAULT NULL,
  `distance` double(3,1) DEFAULT NULL,
  `event_fee` decimal(6,2) DEFAULT NULL,
  `member_event_fee` decimal(6,2) DEFAULT NULL,
  `host` varchar(50) DEFAULT NULL,
  `venue` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `USSA_code` varchar(10) DEFAULT NULL,
  `f_value` mediumint(6) DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `description` text,
  `event_url` varchar(100) DEFAULT NULL,
  `created_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1972 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RACE_RESULTS`
--

DROP TABLE IF EXISTS `RACE_RESULTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RACE_RESULTS` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `member_season_id` mediumint(8) DEFAULT NULL,
  `ussa_num` int(11) DEFAULT NULL,
  `event_id` int(7) NOT NULL,
  `Finish_Place` int(5) DEFAULT NULL,
  `Full_Name` varchar(50) DEFAULT NULL,
  `Birth_Year` int(4) DEFAULT NULL,
  `Division` varchar(20) DEFAULT NULL,
  `Race_Time` varchar(20) DEFAULT NULL,
  `Race_Points` decimal(5,2) DEFAULT NULL,
  `USSA_Result` decimal(6,2) DEFAULT NULL,
  `WC_Points` decimal(6,2) DEFAULT NULL,
  `created_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DNF_DNS` text COMMENT 'DNF or DNS',
  PRIMARY KEY (`id`),
  UNIQUE KEY `AK_1` (`member_season_id`,`event_id`) USING BTREE,
  KEY `FK_Event_Id` (`event_id`) USING BTREE,
  KEY `ussa_num` (`ussa_num`)
) ENGINE=MyISAM AUTO_INCREMENT=3004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `event_results`
--

DROP TABLE IF EXISTS `event_results`;
/*!50001 DROP VIEW IF EXISTS `event_results`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `event_results` AS SELECT 
 1 AS `Event`,
 1 AS `Season`,
 1 AS `NENSA`,
 1 AS `USSA`,
 1 AS `Finish`,
 1 AS `Name`,
 1 AS `Birth Year`,
 1 AS `Division`,
 1 AS `Age Group`,
 1 AS `Club`,
 1 AS `Race Time`,
 1 AS `Points`,
 1 AS `USSA Result`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `member_season_rankings`
--

DROP TABLE IF EXISTS `member_season_rankings`;
/*!50001 DROP VIEW IF EXISTS `member_season_rankings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `member_season_rankings` AS SELECT 
 1 AS `season`,
 1 AS `nensa_num`,
 1 AS `First Name`,
 1 AS `Sex`,
 1 AS `Last Name`,
 1 AS `Division`,
 1 AS `age_group`,
 1 AS `# Races`,
 1 AS `Best Race Results`,
 1 AS `Best_USSA_Result`,
 1 AS `2ndBest_USSA_Result`,
 1 AS `3rdBest_USSA_Result`,
 1 AS `Avg Top 2`,
 1 AS `Avg Top 3`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `member_season_top_results`
--

DROP TABLE IF EXISTS `member_season_top_results`;
/*!50001 DROP VIEW IF EXISTS `member_season_top_results`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `member_season_top_results` AS SELECT 
 1 AS `season`,
 1 AS `nensa_num`,
 1 AS `First Name`,
 1 AS `Last Name`,
 1 AS `Sex`,
 1 AS `Division`,
 1 AS `age_group`,
 1 AS `# Races`,
 1 AS `Best Race Results`,
 1 AS `Best_USSA_Result`,
 1 AS `2ndBest_USSA_Result`,
 1 AS `3rdBest_USSA_Result`,
 1 AS `Avg Top 2`,
 1 AS `Avg Top 3`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `member_season_u16_jn_rankings`
--

DROP TABLE IF EXISTS `member_season_u16_jn_rankings`;
/*!50001 DROP VIEW IF EXISTS `member_season_u16_jn_rankings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `member_season_u16_jn_rankings` AS SELECT 
 1 AS `Season`,
 1 AS `USSA_num`,
 1 AS `NENSA`,
 1 AS `Athletes_Name`,
 1 AS `Sex`,
 1 AS `Club_Name`,
 1 AS `Age_Group`,
 1 AS `#_Races`,
 1 AS `Best_USSA_Result`,
 1 AS `2ndBest_USSA_Result`,
 1 AS `3rdBest_USSA_Result`,
 1 AS `4thBest_USSA_Result`,
 1 AS `Avg_2_Best`,
 1 AS `Avg_3_Best`,
 1 AS `Avg_4_Best`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `member_season_u20_jn_rankings`
--

DROP TABLE IF EXISTS `member_season_u20_jn_rankings`;
/*!50001 DROP VIEW IF EXISTS `member_season_u20_jn_rankings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `member_season_u20_jn_rankings` AS SELECT 
 1 AS `Season`,
 1 AS `USSA_num`,
 1 AS `NENSA`,
 1 AS `Athletes_Name`,
 1 AS `Sex`,
 1 AS `Club_Name`,
 1 AS `Age_Group`,
 1 AS `#_Races`,
 1 AS `Best_USSA_Result`,
 1 AS `2ndBest_USSA_Result`,
 1 AS `3rdBest_USSA_Result`,
 1 AS `4thBest_USSA_Result`,
 1 AS `Avg_2_Best`,
 1 AS `Avg_3_Best`,
 1 AS `Avg_4_Best`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `event_results`
--

/*!50001 DROP VIEW IF EXISTS `event_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `event_results` AS select `e`.`event_name` AS `Event`,`e`.`season` AS `Season`,`m`.`nensa_num` AS `NENSA`,`s`.`ussa_num` AS `USSA`,`r`.`Finish_Place` AS `Finish`,`r`.`Full_Name` AS `Name`,`r`.`Birth_Year` AS `Birth Year`,`r`.`Division` AS `Division`,`m`.`age_group` AS `Age Group`,`m`.`club_name` AS `Club`,`r`.`Race_Time` AS `Race Time`,`r`.`Race_Points` AS `Points`,`r`.`USSA_Result` AS `USSA Result` from (((`race_results` `r` join `race_event` `e` on((`e`.`event_id` = `r`.`event_id`))) left join `member_season` `m` on((`m`.`id` = `r`.`member_season_id`))) left join `member_skier` `s` on((`s`.`member_id` = `m`.`member_id`))) where (`r`.`Finish_Place` <> 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `member_season_rankings`
--

/*!50001 DROP VIEW IF EXISTS `member_season_rankings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `member_season_rankings` AS select `member_season_top_results`.`season` AS `season`,`member_season_top_results`.`nensa_num` AS `nensa_num`,`member_season_top_results`.`First Name` AS `First Name`,`member_season_top_results`.`Sex` AS `Sex`,`member_season_top_results`.`Last Name` AS `Last Name`,`member_season_top_results`.`Division` AS `Division`,`member_season_top_results`.`age_group` AS `age_group`,`member_season_top_results`.`# Races` AS `# Races`,`member_season_top_results`.`Best Race Results` AS `Best Race Results`,`member_season_top_results`.`Best_USSA_Result` AS `Best_USSA_Result`,`member_season_top_results`.`2ndBest_USSA_Result` AS `2ndBest_USSA_Result`,`member_season_top_results`.`3rdBest_USSA_Result` AS `3rdBest_USSA_Result`,((`member_season_top_results`.`Best_USSA_Result` + `member_season_top_results`.`2ndBest_USSA_Result`) / 2) AS `Avg Top 2`,(((`member_season_top_results`.`Best_USSA_Result` + `member_season_top_results`.`2ndBest_USSA_Result`) + `member_season_top_results`.`3rdBest_USSA_Result`) / 3) AS `Avg Top 3` from `member_season_top_results` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `member_season_top_results`
--

/*!50001 DROP VIEW IF EXISTS `member_season_top_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `member_season_top_results` AS select `s`.`season` AS `season`,`m`.`nensa_num` AS `nensa_num`,`m`.`first` AS `First Name`,`m`.`last` AS `Last Name`,`m`.`sex` AS `Sex`,`e`.`Division` AS `Division`,`s`.`age_group` AS `age_group`,count(`e`.`USSA_Result`) AS `# Races`,min(`e`.`USSA_Result`) AS `Best Race Results`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) AS `Best_USSA_Result`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1) AS `2ndBest_USSA_Result`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 2,1) AS `3rdBest_USSA_Result`,(((select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1)) / 2) AS `Avg Top 2`,((((select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1)) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 2,1)) / 2) AS `Avg Top 3` from ((`member_season` `s` join `race_results` `e` on((`e`.`member_season_id` = `s`.`id`))) join `member_skier` `m` on((`m`.`member_id` = `s`.`member_id`))) where (`e`.`USSA_Result` <> 0) group by `s`.`id` order by `Best_USSA_Result` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `member_season_u16_jn_rankings`
--

/*!50001 DROP VIEW IF EXISTS `member_season_u16_jn_rankings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `member_season_u16_jn_rankings` AS select `s`.`season` AS `Season`,`e`.`ussa_num` AS `USSA_num`,`m`.`nensa_num` AS `NENSA`,`e`.`Full_Name` AS `Athletes_Name`,`m`.`sex` AS `Sex`,`s`.`club_name` AS `Club_Name`,`s`.`age_group` AS `Age_Group`,count(`e`.`USSA_Result`) AS `#_Races`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) AS `Best_USSA_Result`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1) AS `2ndBest_USSA_Result`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 2,1) AS `3rdBest_USSA_Result`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 3,1) AS `4thBest_USSA_Result`,(((select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1)) / 2) AS `Avg_2_Best`,((((select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1)) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 2,1)) / 3) AS `Avg_3_Best`,(((((select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1)) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 2,1)) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 3,1)) / 4) AS `Avg_4_Best` from ((`member_season` `s` join `race_results` `e` on((`e`.`member_season_id` = `s`.`id`))) join `member_skier` `m` on((`m`.`member_id` = `s`.`member_id`))) where ((`e`.`USSA_Result` <> 0) and (`s`.`age_group` = 'U16')) group by `s`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `member_season_u20_jn_rankings`
--

/*!50001 DROP VIEW IF EXISTS `member_season_u20_jn_rankings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `member_season_u20_jn_rankings` AS select `s`.`season` AS `Season`,`e`.`ussa_num` AS `USSA_num`,`m`.`nensa_num` AS `NENSA`,`e`.`Full_Name` AS `Athletes_Name`,`m`.`sex` AS `Sex`,`s`.`club_name` AS `Club_Name`,`s`.`age_group` AS `Age_Group`,count(`e`.`USSA_Result`) AS `#_Races`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) AS `Best_USSA_Result`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1) AS `2ndBest_USSA_Result`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 2,1) AS `3rdBest_USSA_Result`,(select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 3,1) AS `4thBest_USSA_Result`,(((select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1)) / 2) AS `Avg_2_Best`,((((select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1)) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 2,1)) / 3) AS `Avg_3_Best`,(((((select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 0,1) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 1,1)) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 2,1)) + (select `race_results`.`USSA_Result` from `race_results` where ((`race_results`.`member_season_id` = `s`.`id`) and (`race_results`.`USSA_Result` <> 0)) group by `race_results`.`USSA_Result` having (count(0) > 0) order by `race_results`.`USSA_Result` limit 3,1)) / 4) AS `Avg_4_Best` from ((`member_season` `s` join `race_results` `e` on((`e`.`member_season_id` = `s`.`id`))) join `member_skier` `m` on((`m`.`member_id` = `s`.`member_id`))) where ((`e`.`USSA_Result` <> 0) and ((`s`.`age_group` = 'U20') or (`s`.`age_group` = 'U18'))) group by `s`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-24 21:28:51
