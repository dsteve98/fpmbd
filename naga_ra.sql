/*
SQLyog Ultimate v10.42 
MySQL - 5.5.5-10.1.30-MariaDB : Database - vkvxweok_mbd_05111640000064
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vkvxweok_mbd_05111640000064` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `vkvxweok_mbd_05111640000064`;

/*Table structure for table `debuging` */

DROP TABLE IF EXISTS `debuging`;

CREATE TABLE `debuging` (
  `hp1` int(11) DEFAULT NULL,
  `hp2` int(11) DEFAULT NULL,
  `att1` int(11) DEFAULT NULL,
  `att2` int(11) DEFAULT NULL,
  `cur1` int(11) DEFAULT NULL,
  `cur2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `debuging` */

insert  into `debuging`(`hp1`,`hp2`,`att1`,`att2`,`cur1`,`cur2`) values (255,255,70,70,1,1),(255,255,70,70,1,1),(255,255,81,81,2,2),(255,255,81,81,3,3);

/*Table structure for table `donetemp` */

DROP TABLE IF EXISTS `donetemp`;

CREATE TABLE `donetemp` (
  `kepunyaan_id` bigint(20) DEFAULT NULL,
  KEY `kepunyaan_id` (`kepunyaan_id`),
  CONSTRAINT `donetemp_ibfk_1` FOREIGN KEY (`kepunyaan_id`) REFERENCES `kepunyaan` (`kepunyaan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `donetemp` */

/*Table structure for table `kepunyaan` */

DROP TABLE IF EXISTS `kepunyaan`;

CREATE TABLE `kepunyaan` (
  `player_id` varchar(15) DEFAULT NULL,
  `naga_id` int(11) DEFAULT NULL,
  `naga_level` int(11) DEFAULT NULL,
  `kepunyaan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`kepunyaan_id`),
  KEY `player_id` (`player_id`),
  KEY `naga_id` (`naga_id`),
  CONSTRAINT `kepunyaan_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kepunyaan_ibfk_2` FOREIGN KEY (`naga_id`) REFERENCES `naga` (`naga_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `kepunyaan` */

insert  into `kepunyaan`(`player_id`,`naga_id`,`naga_level`,`kepunyaan_id`) values ('steve',1,3,11),('steve',1,3,12),('steve',1,4,13),('steve',2,1,14),('steve',5,1,15),('halo',3,1,22),('steve',2,2,24),('steve',3,1,25),('steve',3,1,26),('steve',3,1,27),('halo',5,1,28),('halo',1,1,29),('halo',1,1,30),('halo',1,1,31),('saya',5,1,33),('daniels',2,1,34),('halo',2,1,35),('halo',2,1,36);

/*Table structure for table `listnaiklevel` */

DROP TABLE IF EXISTS `listnaiklevel`;

CREATE TABLE `listnaiklevel` (
  `kepunyaan_id` bigint(20) DEFAULT NULL,
  `waktuselesai` datetime DEFAULT NULL,
  KEY `kepunyaan_id` (`kepunyaan_id`),
  CONSTRAINT `listnaiklevel_ibfk_1` FOREIGN KEY (`kepunyaan_id`) REFERENCES `kepunyaan` (`kepunyaan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `listnaiklevel` */

/*Table structure for table `menangseason` */

DROP TABLE IF EXISTS `menangseason`;

CREATE TABLE `menangseason` (
  `player_id` varchar(15) DEFAULT NULL,
  `kemenangan` int(11) DEFAULT NULL,
  KEY `player_id` (`player_id`),
  CONSTRAINT `menangseason_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menangseason` */

/*Table structure for table `naga` */

DROP TABLE IF EXISTS `naga`;

CREATE TABLE `naga` (
  `naga_id` int(11) NOT NULL AUTO_INCREMENT,
  `naga_nama` varchar(30) DEFAULT NULL,
  `naga_hp` int(11) DEFAULT NULL,
  `naga_attack` int(11) DEFAULT NULL,
  `naga_elemen` int(1) DEFAULT NULL,
  `naga_kelangkaan` int(1) DEFAULT NULL,
  PRIMARY KEY (`naga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `naga` */

insert  into `naga`(`naga_id`,`naga_nama`,`naga_hp`,`naga_attack`,`naga_elemen`,`naga_kelangkaan`) values (1,'basic water',200,70,1,1),(2,'basic fire',200,70,2,1),(3,'basic wind',200,70,3,1),(4,'basic earth',200,70,4,1),(5,'basic thunder',200,70,5,1);

/*Table structure for table `naiklevel` */

DROP TABLE IF EXISTS `naiklevel`;

CREATE TABLE `naiklevel` (
  `level` int(11) NOT NULL,
  `waktu` bigint(20) NOT NULL,
  `perlumakan` int(11) DEFAULT NULL,
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `naiklevel` */

insert  into `naiklevel`(`level`,`waktu`,`perlumakan`) values (1,10,100),(2,20,200),(3,30,300),(4,40,400),(5,50,500),(6,60,600),(7,70,700),(8,80,800),(9,90,900),(10,100,1000),(11,120,1200),(12,140,1400),(13,160,1600),(14,180,1800),(15,200,2000);

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `player_id` varchar(15) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `totalmenang` int(11) DEFAULT '0',
  `stamina` smallint(6) DEFAULT '10',
  `max_dragon` int(11) DEFAULT '10',
  `current_gold` int(11) DEFAULT '100',
  `current_food` int(11) DEFAULT '0',
  `last_claim_gold` datetime DEFAULT NULL,
  `u_naga1` bigint(20) DEFAULT NULL,
  `u_naga2` bigint(20) DEFAULT NULL,
  `u_naga3` bigint(20) DEFAULT NULL,
  `last_claim_stamina` datetime DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `FK_U1` (`u_naga1`),
  KEY `FK_U2` (`u_naga2`),
  KEY `FK_U3` (`u_naga3`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`u_naga1`) REFERENCES `kepunyaan` (`kepunyaan_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`u_naga2`) REFERENCES `kepunyaan` (`kepunyaan_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `player_ibfk_3` FOREIGN KEY (`u_naga3`) REFERENCES `kepunyaan` (`kepunyaan_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `player` */

insert  into `player`(`player_id`,`password`,`nama`,`totalmenang`,`stamina`,`max_dragon`,`current_gold`,`current_food`,`last_claim_gold`,`u_naga1`,`u_naga2`,`u_naga3`,`last_claim_stamina`) values ('daniels','00e11252db1051387c47521767296b42',NULL,0,10,10,-160,0,'2018-05-26 15:50:27',NULL,NULL,NULL,'2018-05-27 14:40:05'),('halo','57f842286171094855e51fc3a541c1e2',NULL,1,20,10,119240,100,'2018-05-27 19:59:19',29,30,31,'2018-05-27 19:59:19'),('saya','20c1a26a55039b30866c9d0aa51953ca',NULL,0,10,10,-280,0,'2018-05-26 15:50:08',NULL,NULL,NULL,'2018-05-27 14:40:05'),('steve','484ea5618aaf3e9c851c28c6dbca6a1f',NULL,0,10,15,399170,0,'2018-05-26 15:45:22',27,12,15,'2018-05-27 14:40:05');

/* Function  structure for function  `fn_ceknagavalid` */

/*!50003 DROP FUNCTION IF EXISTS `fn_ceknagavalid` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_ceknagavalid`(
	id_naga INT(11)
    ) RETURNS tinyint(1)
BEGIN
	IF EXISTS (SELECT 1 FROM `naga` WHERE `naga_id` = id_naga) THEN
		RETURN TRUE;
	ELSE RETURN FALSE;
	END IF;
    END */$$
DELIMITER ;

/* Function  structure for function  `fn_cekpunyanaga` */

/*!50003 DROP FUNCTION IF EXISTS `fn_cekpunyanaga` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_cekpunyanaga`(
	p_id VARCHAR(15),
	id_naga INT(11)
    ) RETURNS tinyint(1)
BEGIN
	IF EXISTS (SELECT 1 FROM `kepunyaan` WHERE `player_id` = p_id AND `kepunyaan_id` = id_naga) 
	/*AND `fn_ceknagavalid`(id_naga)*/
	THEN
		RETURN TRUE;
	ELSE RETURN FALSE;
	END IF;
    END */$$
DELIMITER ;

/* Function  structure for function  `fn_check3deploy` */

/*!50003 DROP FUNCTION IF EXISTS `fn_check3deploy` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_check3deploy`(p_pid VARCHAR(15)) RETURNS tinyint(1)
BEGIN
	SET @istrue = exists(SELECT 1 FROM `player` WHERE `player_id` = p_pid 
		AND (`u_naga1` IS NULL OR `u_naga2` IS NULL OR `u_naga3` IS NULL));
	iF (@istrue = 1) THEN
		RETURN FALSE;
	ELSE RETURN TRUE;
	END IF;
    END */$$
DELIMITER ;

/* Function  structure for function  `fn_iseffective` */

/*!50003 DROP FUNCTION IF EXISTS `fn_iseffective` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_iseffective`(
	e1 INT(1),
	e2 INT(1)
    ) RETURNS tinyint(1)
BEGIN
	IF (e1 = e2 + 1) OR (e1 = e2 - 4) THEN
		RETURN TRUE;
	ELSE RETURN FALSE;
	END IF;
    END */$$
DELIMITER ;

/* Function  structure for function  `fn_isupgradedone` */

/*!50003 DROP FUNCTION IF EXISTS `fn_isupgradedone` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_isupgradedone`(p_idpunya bigint(20)) RETURNS tinyint(1)
begin
	SET @selisihwaktu = (
		SELECT TIMESTAMPDIFF(SECOND, `waktuselesai`, NOW()) 
		FROM `listnaiklevel` WHERE `kepunyaan_id`=p_idpunya
		);
	RETURN (@selisihwaktu>=0);
end */$$
DELIMITER ;

/* Function  structure for function  `f_randomdragongacha` */

/*!50003 DROP FUNCTION IF EXISTS `f_randomdragongacha` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `f_randomdragongacha`() RETURNS int(11)
BEGIN
	RETURN (SELECT `naga_id` FROM `naga`
		ORDER BY RAND()
		LIMIT 1);
    END */$$
DELIMITER ;

/* Function  structure for function  `f_upgrademaxdvalue` */

/*!50003 DROP FUNCTION IF EXISTS `f_upgrademaxdvalue` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `f_upgrademaxdvalue`(
	p_pid VARCHAR(15)
    ) RETURNS int(11)
BEGIN
	SET @maxd = (SELECT `max_dragon` FROM `player` WHERE p_pid = `player_id`);
	RETURN ((@maxd - 10) * 10000 + 1000 * (100 - @maxd));
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_buyfood` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_buyfood` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buyfood`(
	p_pid VARCHAR(15),
	p_food INT(11)
    )
BEGIN
	SET @gold = (SELECT `current_gold` from `player` WHERE p_pid = `player_id`);
	if (@gold >= p_food) THEN
		UPDATE `player` SET `current_gold` = `current_gold` - p_food ,`current_food` = `current_food` + p_food WHERE p_pid = `player_id`;
		SELECT 0, 'beli sukses';
	ELSE SELECT -1, 'Gagal, gold Anda kurang!';
	END if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_claimstamina` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_claimstamina` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_claimstamina`(p_id VARCHAR(15))
BEGIN
	SET @diff = (SELECT TIMESTAMPDIFF(MINUTE,`last_claim_stamina`,NOW()) FROM `player` WHERE `player_id` = p_id);
	UPDATE `player` SET `last_claim_stamina` = TIMESTAMPADD(MINUTE, @diff, `last_claim_stamina`) WHERE `player_id` = p_id;
	SET @maxstamina = 20;
	SET @current = (SELECT `stamina` FROM `player` WHERE `player_id` = p_id);
	IF (@diff > 20 - @current ) THEN
		SET @diff = 20 - @current;
	END IF;
	UPDATE `player` SET `stamina` = `stamina` + @diff WHERE `player_id` = p_id;
	update `player` set `last_claim_stamina` = now() where `player_id`=p_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_collectgold` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_collectgold` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_collectgold`(p_pid VARCHAR(15))
BEGIN
	SET @diff = (SELECT TIMESTAMPDIFF(MINUTE, `last_claim_gold`, NOW()) FROM `player` WHERE p_pid = `player_id`);
	SET @revenue = (
		SELECT SUM(a.gold_revenue) FROM
		(SELECT k.`naga_level` * n.`naga_kelangkaan` * 10 AS gold_revenue FROM `naga` n
		INNER JOIN (SELECT `naga_id`,`naga_level` FROM `kepunyaan` WHERE p_pid = `player_id`) k
		on n.`naga_id`=k.`naga_id`) a
	);
	SET @total = @diff * @revenue;
	IF (@total > 100000) THEN
		SET @total = 100000;
	END IF;
	UPDATE `player` SET `last_claim_gold` = TIMESTAMPADD(MINUTE, @diff, `last_claim_gold`), `current_gold` = `current_gold` + (@total) WHERE p_pid = `player_id`;
	SELECT 0, 'Gold ditambahkan';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_daftar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_daftar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_daftar`(
	p_id VARCHAR(15),
	p_password VARCHAR(30)
    )
BEGIN
	IF NOT EXISTS (SELECT 1 FROM `player` WHERE `player_id`=p_id) THEN
	INSERT INTO `player` (`player_id`, `password`, `last_claim_gold`,`last_claim_stamina`)  
		VALUES (p_id, MD5(p_password), NOW(), NOW());
	SELECT 0, 'pendaftaran sukses';
	ELSE SELECT -1, 'Gagal, id sudah terdaftar!';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deploynaga` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deploynaga` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deploynaga`(
	p_pid VARCHAR(15),
	u1 INT(11),
	u2 INT(11),
	u3 INT(11)
    )
BEGIN
	if (u1 = u2 or u1 = u3 or u2 = u3) then
		select -1,'Tidak boleh memilih naga yang sama';
	elseIF (`fn_cekpunyanaga`(p_pid,u1) AND `fn_cekpunyanaga`(p_pid,u2) AND `fn_cekpunyanaga`(p_pid,u3)) THEN
		UPDATE `player` SET `u_naga1`=u1 , `u_naga2`=u2 , `u_naga3`=u3 where `player_id`=p_pid;
		SELECT 0, 'Deploy sukses';
	ELSE SELECT -1, 'Deploy gagal, harap divalidasi';
	END iF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_detail1` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_detail1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detail1`(
		p_id varchar(15)
	)
BEGIN
set @KI = (select `u_naga1` from `player` where `player_id`=p_id);
select `naga_nama`, `naga_level`, `naga_elemen` from `naga`,`kepunyaan` 
	where `kepunyaan_id` = @KI and `kepunyaan`.`naga_id`=`naga`.`naga_id`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_detail2` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_detail2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detail2`(
		p_id VARCHAR(15)
	)
BEGIN
SET @KI = (SELECT `u_naga2` FROM `player` WHERE `player_id`=p_id);
SELECT `naga_nama`, `naga_level`, `naga_elemen` FROM `naga`,`kepunyaan` 
	WHERE `kepunyaan_id` = @KI AND `kepunyaan`.`naga_id`=`naga`.`naga_id`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_detail3` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_detail3` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detail3`(
		p_id VARCHAR(15)
	)
BEGIN
SET @KI = (SELECT `u_naga3` FROM `player` WHERE `player_id`=p_id);
SELECT `naga_nama`, `naga_level`, `naga_elemen` FROM `naga`,`kepunyaan` 
	WHERE `kepunyaan_id` = @KI AND `kepunyaan`.`naga_id`=`naga`.`naga_id`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_battle` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_battle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_battle`(
	p_p1 VARCHAR(15),
	p_p2 VARCHAR(15)
    )
BEGIN
	SET @stamina = (SELECT `stamina` FROM `player` WHERE `player_id` = p_p1);
	IF p_p1 = p_p2 THEN
		SELECT -1,"Tidak bisa nantang diri sendiri";
	ELSEIF (@stamina - 2 < 0) THEN
		SELECT -1,"Stamina Kurang";
	ELSEIF (`fn_check3deploy`(p_p1) AND `fn_check3deploy`(p_p2)) THEN
		UPDATE `player` SET `stamina` = `stamina` - 2 WHERE `player_id` = p_p1;
		SET @p1_c = 1;
		SET @p2_c = 1;		
		
		DROP TABLE IF EXISTS `tab1`;
		DROP TABLE IF EXISTS `tab2`;
		CREATE TEMPORARY TABLE tab1(n_id INT, n_lvl INT, id_kepunyaan INT, urutan INT );
		INSERT INTO tab1(n_id, n_lvl, id_kepunyaan , urutan) (SELECT k.`naga_id`, k.`naga_level`, p.`u_naga1`,1 FROM `player` p, `kepunyaan` k WHERE p.`player_id` = k.`player_id` AND p.`player_id`=p_p1 AND p.`u_naga1` = k.`kepunyaan_id`);
		INSERT INTO tab1(n_id, n_lvl, id_kepunyaan , urutan) (SELECT k.`naga_id`, k.`naga_level`, p.`u_naga2`,2 FROM `player` p, `kepunyaan` k WHERE p.`player_id` = k.`player_id` AND p.`player_id`=p_p1 AND p.`u_naga2` = k.`kepunyaan_id`);
		INSERT INTO tab1(n_id, n_lvl, id_kepunyaan , urutan) (SELECT k.`naga_id`, k.`naga_level`, p.`u_naga3`,3 FROM `player` p, `kepunyaan` k WHERE p.`player_id` = k.`player_id` AND p.`player_id`=p_p1 AND p.`u_naga3` = k.`kepunyaan_id`);
		
		CREATE TEMPORARY TABLE tab2(n_id INT, n_lvl INT, id_kepunyaan INT, urutan INT );
		INSERT INTO tab2(n_id, n_lvl, id_kepunyaan , urutan) (SELECT k.`naga_id`, k.`naga_level`, p.`u_naga1`,1 FROM `player` p, `kepunyaan` k WHERE p.`player_id` = k.`player_id` AND p.`player_id`=p_p1 AND p.`u_naga1` = k.`kepunyaan_id`);
		INSERT INTO tab2(n_id, n_lvl, id_kepunyaan , urutan) (SELECT k.`naga_id`, k.`naga_level`, p.`u_naga2`,2 FROM `player` p, `kepunyaan` k WHERE p.`player_id` = k.`player_id` AND p.`player_id`=p_p1 AND p.`u_naga2` = k.`kepunyaan_id`);
		INSERT INTO tab2(n_id, n_lvl, id_kepunyaan , urutan) (SELECT k.`naga_id`, k.`naga_level`, p.`u_naga3`,3 FROM `player` p, `kepunyaan` k WHERE p.`player_id` = k.`player_id` AND p.`player_id`=p_p1 AND p.`u_naga3` = k.`kepunyaan_id`);
		
		SET @hp1 = (SELECT `naga_hp` FROM `naga` WHERE `naga_id` = (SELECT n_id FROM tab1 WHERE urutan=1));
		SET @hp2 = (SELECT `naga_hp` FROM `naga` WHERE `naga_id` = (SELECT n_id FROM tab2 WHERE urutan=1));
		SET @att1 = (SELECT `naga_attack` FROM `naga` WHERE `naga_id` = (SELECT n_id FROM tab1 WHERE urutan=1));
		SET @att2 = (SELECT `naga_attack` FROM `naga` WHERE `naga_id` = (SELECT n_id FROM tab2 WHERE urutan=1));
		SET @lv1 = (SELECT n_lvl FROM tab1 WHERE urutan=1);
		SET @lv2 = (SELECT n_lvl FROM tab2 WHERE urutan=1);
		SET @hp1 = @hp1 + @lv1 * (50 + @lv1 * 5);
		SET @hp2 = @hp2 + @lv2 * (50 + @lv2 * 5);
		WHILE @p1_c <= 3 and @p2_c <= 3 DO
			SET @current_p1 = (SELECT n_id FROM tab1 WHERE urutan = @p1_c);
			SET @current_p2 = (SELECT n_id FROM tab2 WHERE urutan = @p2_c);
			SET @att1 = (SELECT `naga_attack` FROM `naga` WHERE `naga_id` = @current_p1);
			SET @att2 = (SELECT `naga_attack` FROM `naga` WHERE `naga_id` = @current_p2);
			SET @el1 = (SELECT `naga_elemen` FROM `naga` WHERE `naga_id` = @current_p1);
			SET @el2 = (SELECT `naga_elemen` FROM `naga` WHERE `naga_id` = @current_p2);
			IF @hp1 <= 0 THEN 
				SET @hp1 = (SELECT `naga_hp` FROM `naga` WHERE `naga_id` = @current_p1);
				SET @lv1 = (SELECT n_lvl FROM tab1 WHERE urutan = @p1_c);
				SET @hp1 = @hp1 + @lv1 * (50 + @lv1 * 5);
				SET @att1 = @att1 + @lv1 * (10 + @lv1 * 1);
			END IF;
			IF @hp2 <= 0 THEN 
				SET @hp2 = (SELECT `naga_hp` FROM `naga` WHERE `naga_id` = @current_p2);
				SET @lv2 = (SELECT n_lvl FROM tab2 WHERE urutan = @p2_c);
				SET @hp2 = @hp2 + @lv2 * (50 + @lv2 * 5);
				SET @att2 = @att2 + @lv2 * (10 + @lv2 * 1);
			END IF;
			WHILE @hp1 > 0 AND @hp2 > 0 DO
				SET @hp1 = @hp1 - @att2;
				SET @hp2 = @hp2 - @att1;
			END WHILE;
			
			IF @hp1 <= 0 THEN 
				SET @p1_c = @p1_c + 1;
			END IF;
			IF @hp2 <= 0 THEN 
				SET @p2_c = @p2_c + 1;
			END IF;
		END WHILE;
		if @p1_c > 3 THEN
			UPDATE `player` SET `totalmenang` = `totalmenang` + 1 WHERE `player_id` = p_p1;
			SELECT 0,"p2 win";
		ELSEIF @p2_c > 3 THEN
			UPDATE `player` SET `totalmenang` = `totalmenang` + 1 WHERE `player_id` = p_p2;
			SELECT 0,"p1 win";
		ELSE SELECT 0,"Draw";
		
		END IF;
	ELSE SELECT -1, "Terjadi Error / deploy tidak valid";
	
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_dragown` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_dragown` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dragown`(
		p_id varchar(15)
	)
BEGIN 
select `kepunyaan_id`,`naga_nama`,`naga_level`,`naga_elemen` from `kepunyaan`,`naga` 
where(`player_id`=p_id and `kepunyaan`.`naga_id`=`naga`.`naga_id`)
	order by `kepunyaan`.`naga_id`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_findfoe` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_findfoe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_findfoe`(
		p_id varchar(15)
	)
BEGIN
	SET @ID = (select `player_id` from `player` where `player_id` != p_id and `fn_check3deploy`(`player_id`)
		order by RAND()
		limit 1);
	select `player_id`,`u_naga1`,`u_naga2`,`u_naga3` from `player`
	where `player`.`player_id`= @ID ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_growthcheck` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_growthcheck` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_growthcheck`()
BEGIN
/*update `kepunyaan` set `naga_level`=(`naga_level`+1) where `kepunyaan_id`=`v_upgradedone`.`kepunyaan_id`;
delete from `listnaiklevel` where `kepunyaan_id` in
	(select kepunyaan_id from v_upgradedone);*/
	
UPDATE `kepunyaan`,`v_upgradedone` SET `naga_level`=(`naga_level`+1) WHERE `kepunyaan`.`kepunyaan_id`=`v_upgradedone`.`kepunyaan_id`;
INSERT INTO `donetemp` SELECT kepunyaan_id FROM v_upgradedone;
DELETE FROM `listnaiklevel` WHERE `kepunyaan_id` IN (SELECT `kepunyaan_id` FROM `donetemp`);
TRUNCATE TABLE donetemp;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(p_pid VARCHAR(50), p_password VARCHAR(50))
BEGIN
	IF EXISTS(SELECT 1 FROM `player` WHERE `player_id` = p_pid  AND `password` =MD5(p_password)) THEN
		SELECT 0, 'Login Sukses';
	ELSE
		SELECT -1, 'Login Gagal';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_normalgacha` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_normalgacha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_normalgacha`(
	p_pid VARCHAR(15)
    )
BEGIN
	SET @CURRENT = (SELECT COUNT(`naga_id`) FROM `kepunyaan` WHERE `player_id` = p_pid);
	SET @MAXCURRENT = (SELECT `max_dragon` FROM `player` WHERE `player_id` = p_pid);
	SET @MONEY = (SELECT `current_gold` FROM `player` WHERE `player_id` = p_pid);
	IF (@CURRENT < @MAXCURRENT and @MONEY >= 100) THEN
		UPDATE `player` SET `current_gold` = `current_gold` - 100;
		INSERT INTO `kepunyaan`(`player_id`,`naga_id`,`naga_level`) VALUES(p_pid,f_randomdragongacha(),1);
		SELECT 0, 'Beli gacha sukses';
	ELSE SELECT -1, 'Gold kurang atau dragon limit exceeded';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_set1` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_set1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_set1`(p_id VARCHAR(15),k_id INT)
BEGIN
	SET @u2 = (SELECT `u_naga2` FROM `player` WHERE `player_id` = p_id);
	SET @u3 = (SELECT `u_naga3` FROM `player` WHERE `player_id` = p_id);
	IF (k_id = @u2 OR k_id = @u3) THEN
		SELECT -1,'Tidak boleh memilih naga yang sama';
	ELSEIF (`fn_cekpunyanaga`(p_id,k_id)) THEN
		UPDATE `player` SET `u_naga1`= k_id WHERE `player_id`=p_id;
		SELECT 0, 'Deploy sukses';
	ELSE SELECT -2, 'Deploy gagal, harap divalidasi';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_lvlup` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_lvlup` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lvlup`(
	p_id varchar(15),
	p_nid int(11)
)
BEGIN
	if exists(select 1 from `kepunyaan` where(`player_id`=p_id and `kepunyaan_id`=p_nid)) then
		SET @LVL = (SELECT `naga_level` FROM `kepunyaan` WHERE `kepunyaan_id`=p_nid);
		set @FOOD = (select `current_food` from `player` where `player_id`=p_id);
		set @REQ = (select `perlumakan` from `naiklevel` where `level`=@LVL);
		IF EXISTS (SELECT 1 FROM `listnaiklevel` WHERE `kepunyaan_id`=p_nid) THEN
			SELECT -1,'Naga sedang dilatih';
		elseif (@FOOD >= @REQ) then 
			update `player` set `current_food` = `current_food` - @FOOD where `player_id`=p_id;
			SET @TIME = (SELECT `waktu` FROM `naiklevel` WHERE `level`=@LVL);
			insert into `listnaiklevel`(`kepunyaan_id`,`waktuselesai`) values(p_nid,TIMESTAMPADD(SECOND,@TIME,NOW()));
			SELECT 0, 'Proses naik level mulai dilakukan';
		else select -1, 'Makanan tidak cukup';
		end if;
	else select -1,'Naga tidak ditemukan';
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_selldragon` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_selldragon` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_selldragon`(
	p_id VARCHAR(15),
	p_nid int(11)
    )
BEGIN
	IF EXISTS (SELECT 1 FROM `kepunyaan` WHERE (`player_id`=p_id and `kepunyaan_id`=p_nid)) THEN
		SET @level = (SELECT `naga_level` FROM `kepunyaan` WHERE `player_id`= p_id AND `kepunyaan_id` = p_nid);
		SET @rarity = (SELECT n.`naga_kelangkaan` FROM `naga` n,(SELECT `naga_id` FROM `kepunyaan` WHERE `kepunyaan_id` = p_nid) k 
			WHERE n.`naga_id` = k.`naga_id`);
		DELETE FROM `kepunyaan` WHERE `player_id`= p_id AND `kepunyaan_id` = p_nid;
		UPDATE `player` SET `current_gold` =`current_gold` + (@level * @rarity * 50) WHERE `player_id`= p_id;
		SELECT 0, 'Penjualan sukses';
	ELSE SELECT -1, 'Gagal, tidak ditemukan!';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_set2` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_set2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_set2`(p_id VARCHAR(15),k_id INT)
BEGIN
	SET @u1 = (SELECT `u_naga1` FROM `player` WHERE `player_id` = p_id);
	SET @u3 = (SELECT `u_naga3` FROM `player` WHERE `player_id` = p_id);
	IF (k_id = @u1 OR k_id = @u3) THEN
		SELECT -1,'Tidak boleh memilih naga yang sama';
	ELSEIF (`fn_cekpunyanaga`(p_id,k_id)) THEN
		UPDATE `player` SET `u_naga2`= k_id WHERE `player_id`=p_id;
		SELECT 0, 'Deploy sukses';
	ELSE SELECT -2, 'Deploy gagal, harap divalidasi';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_set3` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_set3` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_set3`(p_id VARCHAR(15),k_id INT)
BEGIN
	SET @u1 = (SELECT `u_naga1` FROM `player` WHERE `player_id` = p_id);
	SET @u2 = (SELECT `u_naga2` FROM `player` WHERE `player_id` = p_id);
	IF (k_id = @u1 OR k_id = @u2) THEN
		SELECT -1,'Tidak boleh memilih naga yang sama';
	ELSEIF (`fn_cekpunyanaga`(p_id,k_id)) THEN
		UPDATE `player` SET `u_naga3`= k_id WHERE `player_id`=p_id;
		SELECT 0, 'Deploy sukses';
	ELSE SELECT -2, 'Deploy gagal, harap divalidasi';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_showresource` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_showresource` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_showresource`(
		p_id varchar(15)
	)
BEGIN
	select `current_gold` gold,`current_food` food,`stamina` from `player` where `player_id`=p_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_upgrademaxdragon` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_upgrademaxdragon` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_upgrademaxdragon`(
	p_pid VARCHAR(15)
    )
BEGIN
	SET @gold = (SELECT `current_gold` from `player` where p_pid = `player_id`);
	SET @maxd = (SELECT `max_dragon` FROM `player` WHERE p_pid = `player_id`);
	
	IF (@gold >= f_upgrademaxdvalue(p_pid) AND @maxd < 100) THEN
		UPDATE `player` SET `current_gold` = `current_gold` - f_upgrademaxdvalue(p_pid), `max_dragon` = `max_dragon` + 5 WHERE p_pid = `player_id`;	
		SELECT 0, 'upgrade sukses';
	ELSE SELECT -1, 'Gagal, gold Anda kurang!';
	End if;
END */$$
DELIMITER ;

/*Table structure for table `v_upgradedone` */

DROP TABLE IF EXISTS `v_upgradedone`;

/*!50001 DROP VIEW IF EXISTS `v_upgradedone` */;
/*!50001 DROP TABLE IF EXISTS `v_upgradedone` */;

/*!50001 CREATE TABLE  `v_upgradedone`(
 `kepunyaan_id` bigint(20) ,
 `waktuselesai` datetime 
)*/;

/*View structure for view v_upgradedone */

/*!50001 DROP TABLE IF EXISTS `v_upgradedone` */;
/*!50001 DROP VIEW IF EXISTS `v_upgradedone` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_upgradedone` AS select `listnaiklevel`.`kepunyaan_id` AS `kepunyaan_id`,`listnaiklevel`.`waktuselesai` AS `waktuselesai` from `listnaiklevel` where (`fn_isupgradedone`(`listnaiklevel`.`kepunyaan_id`) = 1) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
