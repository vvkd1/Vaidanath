-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2023 at 12:24 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_vucop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_print_req_collection`
--

CREATE TABLE IF NOT EXISTS `tb_print_req_collection` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) unsigned zerofill NOT NULL,
  `cps_micr_code` int(3) unsigned zerofill NOT NULL,
  `cps_branchmicr_code` int(3) unsigned zerofill NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(2) unsigned zerofill NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) unsigned zerofill NOT NULL,
  `cps_tr_code` int(2) unsigned zerofill NOT NULL,
  `cps_atpar` varchar(1) DEFAULT NULL,
  `cps_act_jointname1` varchar(512) NOT NULL,
  `cps_act_jointname2` varchar(512) NOT NULL,
  `cps_auth_sign1` varchar(512) NOT NULL,
  `cps_auth_sign2` varchar(512) NOT NULL,
  `cps_auth_sign3` varchar(512) NOT NULL,
  `cps_act_address1` varchar(50) NOT NULL,
  `cps_act_address2` varchar(50) NOT NULL,
  `cps_act_address3` varchar(35) NOT NULL,
  `cps_act_address4` varchar(35) NOT NULL,
  `cps_act_address5` varchar(35) NOT NULL,
  `cps_act_city` varchar(30) NOT NULL,
  `cps_state` varchar(30) DEFAULT NULL,
  `cps_country` varchar(30) DEFAULT NULL,
  `cps_emailid` varchar(50) DEFAULT NULL,
  `cps_act_pin` int(30) NOT NULL,
  `cps_act_telephone_res` varchar(15) NOT NULL,
  `cps_act_telephone_off` varchar(15) NOT NULL,
  `cps_act_mobile` varchar(15) NOT NULL,
  `cps_ifsc_code` varchar(12) DEFAULT NULL,
  `cps_chq_no_from` bigint(6) unsigned zerofill NOT NULL,
  `cps_chq_no_to` bigint(6) unsigned zerofill NOT NULL,
  `cps_micr_account_no` int(6) unsigned zerofill NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_is_reprint` int(1) NOT NULL DEFAULT '0',
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `tb_print_req_collection`
--

INSERT INTO `tb_print_req_collection` (`id`, `cps_unique_req`, `cps_micr_code`, `cps_branchmicr_code`, `cps_account_no`, `cps_act_name`, `cps_no_of_books`, `cps_dly_bearer_order`, `cps_book_size`, `cps_tr_code`, `cps_atpar`, `cps_act_jointname1`, `cps_act_jointname2`, `cps_auth_sign1`, `cps_auth_sign2`, `cps_auth_sign3`, `cps_act_address1`, `cps_act_address2`, `cps_act_address3`, `cps_act_address4`, `cps_act_address5`, `cps_act_city`, `cps_state`, `cps_country`, `cps_emailid`, `cps_act_pin`, `cps_act_telephone_res`, `cps_act_telephone_off`, `cps_act_mobile`, `cps_ifsc_code`, `cps_chq_no_from`, `cps_chq_no_to`, `cps_micr_account_no`, `cps_date`, `cps_process_user_id`, `cps_is_reprint`, `cps_pr_code`, `cps_bsr_code`, `cps_short_name`, `cps_product_code`) VALUES
(1, 00000001, 431853352, 352, '00102210014939', 'KIRAN BHAGWATRAO BHANDARE', 01, '0', 003, 10, '', '', '', '', '', '', 'SUBHASH CHOWK', 'PARLI VAIJNATH', '', '', '', '431', '', '', 'bbsoundparli@gmail.com', 431515, '', '', '8999490940', 'HDFC0CVUCBL', 000000, 000002, 431853, '2023-03-02', 20, 0, '', '', '', ''),
(2, 00000002, 431853352, 352, '00102210014939', 'KIRAN BHAGWATRAO BHANDARE', 01, '0', 003, 10, '', '', '', '', '', '', 'SUBHASH CHOWK', 'PARLI VAIJNATH', '', '', '', 'PARLI VAIJNATH', '', '', 'bbsoundparli@gmail.com', 431515, '', '', '8999490940', 'HDFC0CVUCBL', 000000, 000002, 431853, '2023-03-02', 20, 0, '', '', '', ''),
(3, 00000003, 431853352, 352, '00102210014939', 'KIRAN BHAGWATRAO BHANDARE', 01, '0', 003, 10, '', '', '', '', '', '', 'SUBHASH CHOWK', 'PARLI VAIJNATH', '', '', '', 'PARLI VAIJNATH', '', '', 'bbsoundparli@gmail.com', 431515, '', '', '8999490940', 'HDFC0CVUCBL', 170351, 170353, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(4, 00000004, 431853352, 352, '00102210015991', 'DATTATRAY BALIRAM UDAWANT', 01, '0', 025, 10, '', '', '', '', '', '', 'AT PADMAVATI GALLI TA PARLI ', 'DIST BEED 431 515', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '', 'HDFC0CVUCBL', 170351, 170375, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(5, 00000005, 431853352, 352, '00102210056764', 'KONDIBA TUKARAM DHUMAL', 01, '0', 025, 10, '', '', '', '', '', '', 'KIRT NAGAR PARLI PARLI', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '9823212262', 'HDFC0CVUCBL', 170376, 170400, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(6, 00000006, 431853352, 352, '00102210034030', 'SWATI MURLIDHAR GITTE', 01, '0', 025, 10, '', '', '', '', '', '', 'AT NANDAGOUL TA PARLI DIST BEED', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '8805795727', 'HDFC0CVUCBL', 170401, 170425, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(7, 00000007, 431853352, 352, '00102210001521', 'BALASAHEB SUBHANRAO SOLANKE', 01, '0', 025, 10, '', '', '', '', '', '', 'GRUKRUPNAGA PALRI V', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '9423714251', 'HDFC0CVUCBL', 170426, 170450, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(8, 00000008, 431853352, 352, '00102310004920', 'POOJA KIDS WEAR', 01, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'NEAHRU CHOUK TAL DESHMUKH PARLI V', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '9011109409', 'HDFC0CVUCBL', 210526, 210575, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(9, 00000009, 431853352, 352, '00102310003984', 'JAGADISH RAMNARAYANJI LADDA', 02, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'KIRANA LINE MONDHA MARKET PARLI', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '9405104100', 'HDFC0CVUCBL', 210576, 210675, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(10, 00000010, 431853352, 352, '00102310001121', 'VIJAY MANIKAPPA HALGE', 02, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'MONDHA MARKET AT PO TQ PARLI', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431, '', '', '9420016778', 'HDFC0CVUCBL', 210676, 210775, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(11, 00000011, 431853352, 352, '00102310004490', 'HIRA OIL MILL', 02, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'PLOT NO 16 S NO 421  21 AT PARLI V', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431, '', '', '9822017088', 'HDFC0CVUCBL', 210776, 210875, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(12, 00000012, 431853352, 352, '00102310004654', 'BHIKCHAND SHANTILAL BHANDARI', 02, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'MONDHA HANUMAN MANDIR PARLI V', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431, '', '', '9822017088', 'HDFC0CVUCBL', 210876, 210975, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(13, 00000013, 431853352, 352, '00102310004926', 'VISHAL RAMBHAU BUDRE', 01, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'NEAR VAIDYANATH MANDIR PARLI V', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431, '', '', '9850940845', 'HDFC0CVUCBL', 210976, 211025, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(14, 00000014, 431853352, 352, '00100080000176', 'ABHAYAKUMAR GIRDHARILAL THAKKAR', 01, '0', 025, 13, '', '', '', '', '', '', 'AT SHIVAJI NAGAR TQ PARLI V', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '9822506546', 'HDFC0CVUCBL', 116451, 116475, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(15, 00000015, 431853352, 352, '00100020000056', 'GANGA ELECTRIC &  HARDWARE STOR', 02, '0', 050, 13, '', '', '', 'PROPRIETOR  ', '', '', 'STATION ROADAT POST  PARLI', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '9423472618', 'HDFC0CVUCBL', 116476, 116575, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(16, 00000016, 431853352, 352, '00100020000498', 'CHAITALI AGENCIES', 02, '0', 050, 13, '', '', '', 'PROPRIETOR ', '', '', 'NEAR VAIDYANATH BANK  PARLI V', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '9423714263', 'HDFC0CVUCBL', 116576, 116675, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(17, 00000017, 431853352, 352, '00100020000826', 'AJAY FAMILY SHOP', 02, '0', 050, 13, '', '', '', 'PROPRIETOR ', '', '', 'PADMAWATI GALLI PARLI V', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '9860038051', 'HDFC0CVUCBL', 116676, 116775, 431853, '2023-03-03', 20, 0, '', '', '', ''),
(18, 00000018, 431853152, 152, '00200070000053', 'RANDAD AUTOMOBILES', 03, '0', 050, 13, '', '', '', 'PROPRIETOR ', '', '', 'NEW MONDHA AMBAJOGAI', '', '', '', '', 'AMBAJOGAI', '', '', '', 431517, '', '', '9422657651', 'HDFC0CVUCBL', 062401, 062550, 431853, '2023-03-04', 20, 0, '', '', '', ''),
(19, 00000020, 431853152, 152, '00202210003373', 'BALAPRASAD VITHALDAS BIYANI', 01, '0', 025, 10, '', '', '', '', '', '', 'SO VITHALDAS BIYANI 9 271 A AMBAJOG', '', '', '', '', 'AMBAJOGAI', '', '', '', 431517, '', '', '9422242896', 'HDFC0CVUCBL', 036946, 036970, 431853, '2023-03-04', 20, 0, '', '', '', ''),
(20, 00000021, 431853152, 152, '00202210011497', 'KARTAVYA MATIMAND MULINCHE NIWASI VIDYALAY', 01, '0', 025, 10, '', '', '', 'HEADMISTRESS                       ', '', '', 'SAKUD ROAD AMBAJOGAI', '', '', '', '', 'AM', '', '', '', 431517, '', '', '9975208231', 'HDFC0CVUCBL', 036971, 036995, 431853, '2023-03-04', 20, 0, '', '', '', ''),
(21, 00000022, 431853152, 152, '00202210013841', 'MUKUND RAMKRISHNA JAGTAP', 01, '0', 025, 10, '', '', '', '', '', '', 'SO JAGTAP RAMKRISHNA MUDEGAON AMBAJ', '', '', '', '', 'AMBAJOGAI', '', '', '', 431517, '', '', '9834437743', 'HDFC0CVUCBL', 036996, 037020, 431853, '2023-03-04', 20, 0, '', '', '', ''),
(22, 00000023, 431853152, 152, '00102008000010', 'SHRIKRISHNA SUDAMRAO SHEP', 01, '0', 050, 13, '', '', '', '', '', '', 'SO SUDAMRAO SHEP HAMUANM AMBAJOGAI', '', '', '', '', 'A', '', '', '', 431517, '', '', '8380058215', 'HDFC0CVUCBL', 062551, 062600, 431853, '2023-03-04', 20, 0, '', '', '', ''),
(23, 00000024, 431853152, 152, '00202210011497', 'KARTAVYA MATIMAND MULINCHE NIWASI VIDYALAY', 01, '0', 025, 10, '', '', '', 'HEADMISTRESS  ', '', '', 'SAKUD ROAD AMBAJOGAI', '', '', '', '', 'AMBAJOGAI', '', '', '', 431517, '', '', '9975208231', 'HDFC0CVUCBL', 037021, 037045, 431853, '2023-03-04', 20, 0, '', '', '', ''),
(24, 00000027, 431853502, 502, '00502210016822', 'OMKAR ABASAHEB CHHADEDAR', 01, '0', 025, 10, '', '', '', '', '', '', 'NAGAR PARISHAD COLONY KOLHER ROAD G', '', '', '', '', 'GEORAI', '', '', '', 431515, '', '', '0', 'HDFC0CVUCBL', 054551, 054575, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(25, 00000025, 431853352, 352, '00102210056811', 'NANDKISHOR RAMKISHAN JAJU', 01, '0', 025, 10, '', '', '', '', '', '', 'AT PADMAVATI GALLI TA PARLI', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '0', 'HDFC0CVUCBL', 170451, 170475, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(26, 00000026, 431853352, 352, '00102210040148', 'BHASKAR RAMBHAU INGALE', 01, '0', 025, 10, '', '', '', '', '', '', 'AT MIRVAT PO TQ PARLI V', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '9765701783', 'HDFC0CVUCBL', 170476, 170500, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(27, 00000028, 431853352, 352, '00102210038388', 'SUNANDA VISHANU MUNDE', 01, '0', 025, 10, '', '', '', '', '', '', 'AT PO KANERWADI TQ PARLI V', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '9765218774', 'HDFC0CVUCBL', 170501, 170525, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(28, 00000029, 431853352, 352, '00102220030966', 'SURESH GURULINGAPPA GUJAR', 01, '0', 025, 10, '', '', '', '', '', '', 'BHAGWANBABA CHOUK JALALPUR ROAD PAR', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '9860806366', 'HDFC0CVUCBL', 170526, 170550, 000004, '2023-03-06', 20, 0, '', '', '', ''),
(29, 00000030, 431853352, 352, '00102210056657', 'DHANANJAY MANIKRAO KARAD', 01, '0', 025, 10, '', '', '', '', '', '', 'AT PIMPALGAON TQ PARLI V', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '9604954701', 'HDFC0CVUCBL', 170551, 170575, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(30, 00000031, 431853352, 352, '00102210056529', 'SWAMI AJAY APPA', 01, '0', 025, 10, '', '', '', '', '', '', 'DIGHOL ISLAMPUR PARBHANI', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '7798008057', 'HDFC0CVUCBL', 170576, 170600, 000004, '2023-03-06', 20, 0, '', '', '', ''),
(31, 00000032, 431853504, 504, '00802310000485', 'AVINASH TRADING COMPANY', 03, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'MAIN ROAD WADWANI BEED', '', '', '', '', 'WADWANI', '', '', '', 431144, '', '', '9422241582', 'HDFC0CVUCBL', 061801, 061950, 000004, '2023-03-06', 20, 0, '', '', '', ''),
(32, 00000033, 431853504, 504, '00800020000154', 'VIJAYRAJ OIL INDUSTRIES PRIVATE LIMITED', 03, '0', 050, 13, '', '', '', 'DIRECTOR                                       DIRECTOR', '', '', 'AT MAINDA PO GHATSAWALI ', '                                   ', '', '', '', 'WADWANI', '', '', '', 431144, '', '', '9422241582', 'HDFC0CVUCBL', 035301, 035450, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(33, 00000034, 413853052, 052, '01602210005185', 'SANGITA RAM SHINDE', 01, '0', 025, 10, '', '', '', '', '', '', 'GAWALI NAGAR NEAR OF VANDANA TOKIJ', 'LATUR', '', '', '', 'LATUR', '', '', '', 413512, '', '', '9923715407', 'HDFC0CVUCBL', 013216, 013240, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(34, 00000035, 431853502, 502, '00502210015553', 'ASHOK YADAVRAO YAVALE', 01, '0', 025, 10, '', '', '', '', '', '', 'KOLHER  BEED', '', '', '', '', 'GEORAI', '', '', '', 431127, '', '', '9404727773', 'HDFC0CVUCBL', 054576, 054600, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(35, 00000036, 431853502, 502, '00502210018850', 'VAISHALI BALASAHEB BARGAJE', 01, '0', 025, 10, '', '', '', '', '', '', 'VADGAON DHOK BEED', '', '', '', '', 'GEORAI', '', '', '', 431127, '', '', '8668586643', 'HDFC0CVUCBL', 054601, 054625, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(36, 00000037, 431853502, 502, '00502210017554', 'SANTOSH KASHINATH AMBADE', 01, '0', 025, 10, '', '', '', '', '', '', 'BAGPIMPALGAON BEED', '', '', '', '', 'GEORAI', '', '', '', 431127, '', '', '9809535555', 'HDFC0CVUCBL', 054626, 054650, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(37, 00000038, 431853502, 502, '00502210009508', 'SOPAN GITARAM NALBHE', 01, '0', 025, 10, '', '', '', '', '', '', 'AT POST  LUKHAMASALATQ  GEORAI', '', '', '', '', 'GEORAI', '', '', '', 431127, '', '', '9604256336', 'HDFC0CVUCBL', 054651, 054675, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(38, 00000039, 431853502, 502, '00502310001410', 'DHANISHA TRADING COMPANY', 01, '0', 050, 11, '', '', '', 'PROPRIETOR', '', '', 'MARKET YARD GEORAI', '', '', '', '', 'GEORAI', '', '', '', 431127, '', '', '0', 'HDFC0CVUCBL', 060301, 060350, 000004, '2023-03-06', 20, 0, '', '', '', ''),
(39, 00000040, 431853502, 502, '00502310001411', 'S R CLOTH MARCHANT', 01, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'SHASHTRI CHOUK BEED', '', '', '', '', 'GEORAI', '', '', '', 431127, '', '', '9923148655', 'HDFC0CVUCBL', 060351, 060400, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(40, 00000041, 431853352, 352, '00102310004875', 'GANGASAGAR TRADING COMPANY', 01, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'MONDHA MARKET PARLI V', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '9689995111', 'HDFC0CVUCBL', 211026, 211075, 000004, '2023-03-06', 20, 0, '', '', '', ''),
(41, 00000042, 431853352, 352, '00102310003951', 'RUKMINI TRADERS', 02, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'MONDHA ADAT LINE PARLI V', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '9970269797', 'HDFC0CVUCBL', 211076, 211175, 431853, '2023-03-06', 20, 0, '', '', '', ''),
(42, 00000043, 431853152, 152, '00202210015921', 'UMESH DILIP WANVE', 01, '0', 025, 10, '', '', '', '', '', '', 'SO DILIP WANVE CHANNAI ROAD AMBAJOG', '', '', '', '', 'AMBAJOGAI', '', '', '', 431517, '', '', '9665605500', 'HDFC0CVUCBL', 037046, 037070, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(43, 00000044, 431853152, 152, '00202310001383', 'C D AND SONS', 03, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'NEW MONDHA AMBAJOGAI', '', '', '', '', 'AMBAJOGAI', '', '', '', 431517, '', '', '8830478237', 'HDFC0CVUCBL', 095276, 095425, 000004, '2023-03-08', 20, 0, '', '', '', ''),
(44, 00000045, 431853352, 352, '00102310004572', 'GAUTAMCHAND SUNILKUMAR KOTECHA GENERAL MERCHA', 06, '0', 050, 11, '', '', '', 'PROPRIETOR', '', '', 'MONDHA MARKET PARLI VAIJANTH', '', '', '', '', 'PARLI VAIJNATH', '', '', '', 431515, '', '', '9422241827', 'HDFC0CVUCBL', 211176, 211475, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(45, 00000046, 431853352, 352, '00102310003457', 'DHANSHREE MEDICAL AND GENERAL STORES', 03, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'KALE HOSPITAL SHASTRI NAGAR PARLI V', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '9922698798', 'HDFC0CVUCBL', 211476, 211625, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(46, 00000047, 431853509, 509, '01402310000281', 'SANJIVANI DUDH SANKALAN KENDRA', 03, '0', 050, 11, '', '', '', 'PROPRIETOR ', '', '', 'AT PO KADA TQ ASHTI DIST BEED', '', '', '', '', 'KADA', '', '', '', 414202, '', '', '8485815350', 'HDFC0CVUCBL', 050851, 051000, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(47, 00000048, 431853509, 509, '01402210002760', 'SUNIL MURLIDHAR RAUT', 01, '0', 025, 10, '', '', '', '', '', '', 'BORUDEGALLI DONGARGAN BID KADA', '', '', '', '', 'KADA', '', '', '', 414202, '', '', '9421273789', 'HDFC0CVUCBL', 036126, 036150, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(48, 00000049, 431853509, 509, '01402210004752', 'ASHOK KALAYAN GIRGUNE', 01, '0', 025, 10, '', '', '', '', '', '', 'AT POST NIMGAON CHOBHA  TQ ASHTI  K', '', '', '', '', 'KADA', '', '', '', 414202, '', '', '9822601671', 'HDFC0CVUCBL', 036151, 036175, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(49, 00000050, 431853501, 501, '00302310000894', 'SHIRIN AGENCIES', 02, '0', 050, 11, '', '', '', 'PROPRIETOR', '', '', 'BIKKAD COMPLEX KALAMB ROAD KAIJ', '', '', '', '', 'KAIJ', '', '', '', 431123, '', '', '8805326326', 'HDFC0CVUCBL', 077151, 077250, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(50, 00000051, 431853501, 501, '00202310001172', 'RAJASHTHANI MULTI STATE CO-OP CREDIT SOCIETY LTD.,', 01, '0', 050, 11, '', '', '', 'AUTHORISED SIGN.                 AUTHORISED SIGN.     ', '', '', 'LAXMI MARKET NEAR DR WANGIKAR HOSPI', '', '', '', '', 'kaij', '', '', '', 431123, '', '', '9130072188', 'HDFC0CVUCBL', 077251, 077300, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(51, 00000052, 431853501, 501, '00302210018463', 'SNEHA RAMESH BHARADIYA', 01, '0', 025, 10, '', '', '', '', '', '', 'WAKIL WADI KANADI ROAD KAIJ DIST  B', '', '', '', '', 'kaij', '', '', '', 431123, '', '', '', 'HDFC0CVUCBL', 043401, 043425, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(52, 00000053, 431853501, 501, '00302210018967', 'BALAJI VILASRAO MORALWAR', 01, '0', 025, 10, '', '', '', '', '', '', 'AT POLICE COLONY BEED ROAD KAIJ ', '', '', '', '', 'KAIJ', '', '', '', 431123, '', '', '8856977700', 'HDFC0CVUCBL', 043426, 043450, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(53, 00000054, 431853501, 501, '00302210015742', 'YUVRAJ WAMANRAO KHADE', 01, '0', 025, 10, '', '', '', '', '', '', 'KANADIMALI TQ KAIJ DIST BEED', '', '', '', '', 'KAIJ', '', '', '', 431123, '', '', '9420019086', 'HDFC0CVUCBL', 043451, 043475, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(54, 00000055, 431853501, 501, '00302210004646', 'RAMDHAN SAMBHAJI DAPKAR', 01, '0', 025, 10, '', '', '', '', '', '', 'AT FULE NAGAR KAIJ', '', '', '', '', 'KAIJ', '', '', '', 431123, '', '', '9975655122', 'HDFC0CVUCBL', 043476, 043500, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(55, 00000056, 431853501, 501, '00302210019589', 'AVES ISMAIL SHAIKH', 01, '0', 025, 10, '', '', '', '', '', '', 'SO SHAIKH ISMALL BEHIND FAROKHI KAI', '', '', '', '', 'KAIJ', '', '', '', 431123, '', '', '9970313315', 'HDFC0CVUCBL', 043501, 043525, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(56, 00000058, 431853507, 507, '01202210006387', 'SURYKANT UTTAMRAO BAGAL', 01, '0', 025, 10, '', '', '', '', '', '', 'MUSLIM GALLI SHIRUR KASAR', '', '', '', '', 'SHIRUR KASAR', '', '', '', 413249, '', '', '8600477474', 'HDFC0CVUCBL', 042001, 042025, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(57, 00000059, 431853507, 507, '01202210003051', 'DEVIDAS BUWASAHEB BANGAR', 01, '0', 025, 10, '', '', '', '', '', '', 'AT ANAND GAON  PO PADALI  TQ SHIRUR', '', '', '', '', 'SHIRUR KASAR', '', '', '', 413249, '', '', '9527539162', 'HDFC0CVUCBL', 042026, 042050, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(58, 00000060, 431853507, 507, '01202310000588', 'HOTEL JAGDAMBA', 01, '0', 050, 11, '', '', '', 'PROPRIETOR', '', '', 'AT PO BHALGAON TQ PATHADI DIST AHMA', '', '', '', '', 'SHIRUR KASAR', '', '', '', 413249, '', '', '9763602289', 'HDFC0CVUCBL', 059226, 059275, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(59, 00000057, 431853507, 507, '01200020000145', 'DAYANAND KRUSHI SEVA KENDRA', 01, '0', 050, 13, '', '', '', 'PROPRIETOR ', '', '', 'AT PO TAGADGAON TAQ SHIRUR', '', '', '', '', 'SHIRUR KASAR', '', '', '', 413249, '', '', '9421331237', 'HDFC0CVUCBL', 034201, 034250, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(60, 00000061, 431853352, 352, '00102210055104', 'INDUBAI UDHAV GITTE', 01, '0', 025, 10, '', '', '', '', '', '', 'AT BELAMBA TA PARLI DIST BEED ', '', '', '', '', 'belamba', '', '', '', 431515, '', '', '', 'HDFC0CVUCBL', 170601, 170625, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(61, 00000062, 431853352, 352, '00102210011480', 'SOMNATH JANARDHAN MUNDE', 01, '0', 025, 10, '', '', '', '', '', '', 'AT  ASWALAMBA   PARLI VAIJNATH   DI', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '9011547395', 'HDFC0CVUCBL', 170626, 170650, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(62, 00000063, 431853352, 352, '00102210028456', 'GOUS GAFUR SAYYAD', 01, '0', 025, 10, '', '', '', '', '', '', 'AT REHAMAT NAGAR TA PARLI V', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '9403039976', 'HDFC0CVUCBL', 170651, 170675, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(63, 00000064, 431853352, 352, '00102210056928', 'DAIVSHALA UTTAM VAGHAMARE', 01, '0', 025, 10, '', '', '', '', '', '', 'RAMNAGAR PARLI', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '0', 'HDFC0CVUCBL', 170676, 170700, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(64, 00000065, 431853352, 352, '00102210056927', 'KANCHAN VISHNU SIRSAT', 01, '0', 025, 10, '', '', '', '', '', '', 'VIKASNAGAR LATUR', '', '', '', '', 'PARLI V', '', '', '', 431515, '', '', '0', 'HDFC0CVUCBL', 170701, 170725, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(65, 00000066, 431853002, 002, '01702210002452', 'MAHESH BHIKAJI DAKHORKAR', 01, '0', 025, 10, '', '', '', '', '', '', 'FLAT NO 9 PLOT NO 17 RED ROSEAPPT A', '', '', '', '', 'aurangabad', '', '', '', 431005, '', '', '9657715064', 'HDFC0CVUCBL', 000000, 000024, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(66, 00000067, 431853002, 002, '01702210002452', 'MAHESH BHIKAJI DAKHORKAR', 01, '0', 025, 10, '', '', '', '', '', '', 'FLAT NO 9 PLOT NO 17 RED ROSEAPPT A', '', '', '', '', 'aurangabad', '', '', '', 431005, '', '', '9657715064', 'HDFC0CVUCBL', 029911, 029935, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(67, 00000068, 431853002, 002, '01702310001042', 'NIRMAN CONSTRUCTION', 02, '0', 050, 11, '', '', '', 'PARTNER               PARTNER', '', '', 'PLOT NO 158 NR JAI BHAVANI HIGH SCH', '', '', '', '', 'AURANGABAD', '', '', '', 431005, '', '', '9423778670', 'HDFC0CVUCBL', 081601, 081700, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(68, 00000069, 431853002, 002, '01702310000829', 'AVDHOOT CONSTRUCTION', 02, '0', 050, 11, '', '', '', 'PARTNER               PARTNER', '', '', 'PLOT NO 14 GUT NO 144 SATKARMA NAGA', '', '', '', '', 'AURANGABAD', '', '', '', 431005, '', '', '9423778670', 'HDFC0CVUCBL', 081701, 081800, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(69, 00000070, 431853002, 002, '01702310000769', 'TRIPURA CONSTRUCTION', 02, '0', 050, 11, '', '', '', 'PARTNER               PARTNER', '', '', 'PLOT NO 14 GUT NO 144 SATKARMA AURA', '', '', '', '', 'AURANGABAD', '', '', '', 431005, '', '', '9423778670', 'HDFC0CVUCBL', 081801, 081900, 431853, '2023-03-08', 20, 0, '', '', '', ''),
(70, 00000071, 431853501, 501, '00302310001172', 'RAJASHTHANI MULTI STATE CO-OP CREDIT SOCIETY LTD.,', 01, '0', 050, 11, '', '', '', 'AUTHORISED SIGN.                 AUTHORISED SIGN.     ', '', '', 'LAXMI MARKET NEAR DR WANGIKAR HOSPI', '', '', '', '', 'kaij', '', '', '', 431123, '', '', '9130072188', 'HDFC0CVUCBL', 077251, 077300, 431853, '2023-03-08', 20, 0, '', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
