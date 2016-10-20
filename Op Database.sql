-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.1-m2-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema crud
--

CREATE DATABASE IF NOT EXISTS crud;
USE crud;

--
-- Definition of table `tbl_countrymaster`
--

DROP TABLE IF EXISTS `tbl_countrymaster`;
CREATE TABLE `tbl_countrymaster` (
  `NM_COUNTRY_ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UNIQUE NO TO IDENTIFY COUNTRY',
  `VC_COUNTRY_NAME` varchar(45) NOT NULL COMMENT 'NAME OF THE COUNTRY',
  PRIMARY KEY (`NM_COUNTRY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_countrymaster`
--

/*!40000 ALTER TABLE `tbl_countrymaster` DISABLE KEYS */;
INSERT INTO `tbl_countrymaster` (`NM_COUNTRY_ID`,`VC_COUNTRY_NAME`) VALUES 
 (3,'pakistan'),
 (4,'india'),
 (5,'china');
/*!40000 ALTER TABLE `tbl_countrymaster` ENABLE KEYS */;


--
-- Definition of table `tbl_error_log`
--

DROP TABLE IF EXISTS `tbl_error_log`;
CREATE TABLE `tbl_error_log` (
  `dt_error` datetime NOT NULL,
  `vc_error` longtext,
  `vc_error_stack` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_error_log`
--

/*!40000 ALTER TABLE `tbl_error_log` DISABLE KEYS */;
INSERT INTO `tbl_error_log` (`dt_error`,`vc_error`,`vc_error_stack`) VALUES 
 ('2012-08-10 17:42:01','Value does not fall within the expected range.','   at CRUD._Default.btnCreate_Click(Object sender, EventArgs e) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\CRUD\\Default.aspx.cs:line 21'),
 ('2012-08-10 17:42:01','Value does not fall within the expected range.','   at CRUD._Default.btnCreate_Click(Object sender, EventArgs e) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\CRUD\\Default.aspx.cs:line 21'),
 ('2012-08-10 17:43:18','Value does not fall within the expected range.','   at CRUD._Default.btnCreate_Click(Object sender, EventArgs e) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\CRUD\\Default.aspx.cs:line 21'),
 ('2012-08-10 19:45:44','Incorrect integer value: \'india\' for column \'_ReturnValue\' at row 1','   at DAL.SQLHelper.executeSP[T](List`1 parameters, String SPName) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\DAL\\SQLHelper.cs:line 74\r\n   at DAL.DALCountry.GetCountryById(Int32 countryID) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\DAL\\DALCountry.cs:line 69\r\n   at BAL.BALCountry.getCountryByID(String stringCountryID) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\BAL\\BALCountry.cs:line 63\r\n   at CRUD._Default.txtEditSearch_Click(Object sender, EventArgs e) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\CRUD\\Default.aspx.cs:line 81'),
 ('2012-08-10 19:45:57','Input string was not in a correct format.','   at DAL.SQLHelper.executeSP[T](List`1 parameters, String SPName) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\DAL\\SQLHelper.cs:line 74\r\n   at DAL.DALCountry.GetCountryById(Int32 countryID) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\DAL\\DALCountry.cs:line 69\r\n   at BAL.BALCountry.getCountryByID(String stringCountryID) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\BAL\\BALCountry.cs:line 63\r\n   at CRUD._Default.txtEditSearch_Click(Object sender, EventArgs e) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\CRUD\\Default.aspx.cs:line 81');
INSERT INTO `tbl_error_log` (`dt_error`,`vc_error`,`vc_error_stack`) VALUES 
 ('2012-08-10 19:47:13','Input string was not in a correct format.','   at DAL.SQLHelper.executeSP[T](List`1 parameters, String SPName) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\DAL\\SQLHelper.cs:line 74\r\n   at DAL.DALCountry.GetCountryById(Int32 countryID) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\DAL\\DALCountry.cs:line 69\r\n   at BAL.BALCountry.getCountryByID(String stringCountryID) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\BAL\\BALCountry.cs:line 63\r\n   at CRUD._Default.txtEditSearch_Click(Object sender, EventArgs e) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\CRUD\\Default.aspx.cs:line 81'),
 ('2012-08-10 23:02:38','The DataSourceID of \'ddlCountry\' must be the ID of a control of type IDataSource.  A control with ID \'CountryID\' could not be found.','   at System.Web.UI.WebControls.DataBoundControl.GetDataSource()\r\n   at System.Web.UI.WebControls.DataBoundControl.ConnectToDataSourceView()\r\n   at System.Web.UI.WebControls.DataBoundControl.GetData()\r\n   at System.Web.UI.WebControls.ListControl.OnDataBinding(EventArgs e)\r\n   at System.Web.UI.WebControls.ListControl.PerformSelect()\r\n   at System.Web.UI.WebControls.BaseDataBoundControl.DataBind()\r\n   at CRUD._Default.binding(String searchCountry) in D:\\IMPORTANT DATA\\project\\CRUD\\CRUD\\CRUD\\Default.aspx.cs:line 109');
/*!40000 ALTER TABLE `tbl_error_log` ENABLE KEYS */;


--
-- Definition of procedure `DeleteCountry`
--

DROP PROCEDURE IF EXISTS `DeleteCountry`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCountry`(
IN     _CountryID                         int,
OUT    _ReturnValue                       int
)
BEGIN

Declare referenceCount int;

SELECT COUNT(NM_COUNTRY_ID) INTO referenceCount
       FROM
       TBL_COUNTRYMASTER
       WHERE NM_COUNTRY_ID = _CountryID;

IF referenceCount=1 THEN
   DELETE FROM TBL_COUNTRYMASTER
       WHERE NM_COUNTRY_ID = _CountryID;

   set _ReturnValue=1;
ELSE
   set _ReturnValue=-2;
END IF;

END $$

DELIMITER ;

--
-- Definition of procedure `getAllCountry`
--

DROP PROCEDURE IF EXISTS `getAllCountry`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCountry`()
BEGIN
  SELECT NM_COUNTRY_ID,
         VC_COUNTRY_NAME
         FROM
         TBL_COUNTRYMASTER
         ORDER BY
         VC_COUNTRY_NAME;
END $$

DELIMITER ;

--
-- Definition of procedure `InsertCountry`
--

DROP PROCEDURE IF EXISTS `InsertCountry`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCountry`(
IN     _CountryName                       varchar(200),
OUT    _ReturnValue                       int
)
BEGIN

DECLARE IsCountryExist int(5);

SELECT COUNT(NM_COUNTRY_ID) INTO IsCountryExist FROM
       TBL_COUNTRYMASTER WHERE VC_COUNTRY_NAME = _CountryName;

START TRANSACTION;

IF IsCountryExist = 0 THEN
   INSERT INTO TBL_COUNTRYMASTER(VC_COUNTRY_NAME)
          VALUES (_CountryName);

END IF;

SELECT LAST_INSERT_ID() INTO _ReturnValue;

COMMIT;
END $$

DELIMITER ;

--
-- Definition of procedure `InsertLog`
--

DROP PROCEDURE IF EXISTS `InsertLog`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLog`(
IN     _Datetime                       datetime,
IN     _ErrorMessage                   varchar(1000),
IN     _ErrorStack                     varchar(5000),
OUT    _ReturnValue                       int
)
BEGIN
INSERT INTO TBL_ERROR_LOG(dt_error, vc_error, vc_error_stack)
VALUES (_Datetime,_ErrorMessage,_ErrorStack);
SET _ReturnValue = 0;
END $$

DELIMITER ;

--
-- Definition of procedure `SelectCountryByID`
--

DROP PROCEDURE IF EXISTS `SelectCountryByID`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SelectCountryByID`(
IN     _CountryID                             int
)
BEGIN

SELECT VC_COUNTRY_NAME
       FROM
       TBL_COUNTRYMASTER
       WHERE
       NM_COUNTRY_ID = _CountryID;

END $$

DELIMITER ;

--
-- Definition of procedure `SelectCountryByName`
--

DROP PROCEDURE IF EXISTS `SelectCountryByName`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SelectCountryByName`(
IN     _CountryName                             varchar(200)
)
BEGIN

SELECT NM_COUNTRY_ID,
       VC_COUNTRY_NAME
       FROM
       TBL_COUNTRYMASTER
       WHERE
       VC_COUNTRY_NAME like CONCAT('%',_CountryName,'%')
       ORDER BY
       VC_COUNTRY_NAME;

END $$

DELIMITER ;

--
-- Definition of procedure `UpdateCountryName`
--

DROP PROCEDURE IF EXISTS `UpdateCountryName`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCountryName`(
IN     _CountryName                             varchar(200),
IN     _CountryID                               int
)
BEGIN

UPDATE TBL_COUNTRYMASTER SET VC_COUNTRY_NAME = _CountryName WHERE NM_COUNTRY_ID = _CountryID;

END $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
