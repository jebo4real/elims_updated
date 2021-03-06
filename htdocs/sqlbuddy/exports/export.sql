--
-- MySQL 5.0.41
-- Sun, 15 Sep 2019 16:46:35 +0000
--

CREATE DATABASE `blis_1006` DEFAULT CHARSET latin1;

USE `blis_1006`;

CREATE TABLE `bills` (
   `id` int(11) unsigned not null auto_increment,
   `patient_id` int(11) unsigned not null,
   `paid_in_full` bit(1) not null default ' ',
   PRIMARY KEY (`id`),
   UNIQUE KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `bills` is empty]

CREATE TABLE `bills_test_association` (
   `id` int(11) unsigned not null auto_increment,
   `bill_id` int(11) unsigned not null,
   `test_id` int(11) unsigned not null,
   `discount_type` int(4) unsigned not null default '1000',
   `discount_amount` decimal(10,2) unsigned not null default '0.00',
   PRIMARY KEY (`id`),
   UNIQUE KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `bills_test_association` is empty]

CREATE TABLE `comment` (
   `id` int(10) unsigned not null auto_increment,
   `username` varchar(45) not null,
   `page` varchar(45) not null,
   `comment` varchar(150) not null,
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `comment` is empty]

CREATE TABLE `currency_conversion` (
   `currencya` varchar(200) not null,
   `currencyb` varchar(200) not null,
   `exchangerate` float(5,2),
   `updatedts` timestamp not null default CURRENT_TIMESTAMP,
   `flag1` int(11),
   `flag2` int(11),
   `setting1` varchar(200),
   `setting2` varchar(200),
   PRIMARY KEY (`currencya`,`currencyb`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- [Table `currency_conversion` is empty]

CREATE TABLE `custom_field_type` (
   `id` int(11) unsigned not null auto_increment,
   `field_type` varchar(45),
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `custom_field_type` is empty]

CREATE TABLE `delay_measures` (
   `User_Id` varchar(50) not null,
   `IP_Address` varchar(16) not null,
   `Latency` int(11) not null default '0',
   `Recorded_At` datetime not null default '0000-00-00 00:00:00',
   `Page_Name` varchar(45),
   `Request_URI` varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- [Table `delay_measures` is empty]

CREATE TABLE `field_order` (
   `id` int(11) not null auto_increment,
   `lab_config_id` int(11) unsigned,
   `form_id` int(11),
   `field_order` varchar(2000),
   PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=23;

INSERT INTO `field_order` (`id`, `lab_config_id`, `form_id`, `field_order`) VALUES 
('22', '1006', '2', 'Specimen ID,Specimen Additional ID,Comments,Lab Reciept Date,Referred Out,Physician'),
('21', '1006', '1', 'Patient ID,Daily Number,Patient Name,Sex,Age,Date of Birth');

CREATE TABLE `inv_reagent` (
   `id` int(11) not null auto_increment,
   `name` varchar(100) not null,
   `unit` varchar(45) not null default 'units',
   `remarks` varchar(245),
   `created_by` varchar(10) not null default '0',
   `assocation` varchar(10) default '0',
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `inv_reagent` is empty]

CREATE TABLE `inv_supply` (
   `id` int(11) not null auto_increment,
   `reagent_id` int(11) not null,
   `lot` varchar(100) not null,
   `expiry_date` date,
   `manufacturer` varchar(100),
   `supplier` varchar(100),
   `quantity_ordered` int(11) not null default '0',
   `quantity_supplied` int(11) not null default '0',
   `cost_per_unit` decimal(10,0),
   `user_id` int(11) not null default '0',
   `date_of_order` date,
   `date_of_supply` date,
   `date_of_reception` date,
   `remarks` varchar(250),
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `reagent_id` (`reagent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `inv_supply` is empty]

CREATE TABLE `inv_usage` (
   `id` int(11) not null auto_increment,
   `reagent_id` int(11) not null,
   `lot` varchar(100) not null,
   `quantity_used` int(11) not null default '0',
   `date_of_use` date not null,
   `user_id` int(11) not null,
   `remarks` varchar(250),
   `ts` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `reagent_id` (`reagent_id`),
   KEY `reagent_id2` (`reagent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `inv_usage` is empty]

CREATE TABLE `lab_config` (
   `lab_config_id` int(10) unsigned not null auto_increment,
   `name` char(45) not null,
   `location` char(45) not null,
   `admin_user_id` int(10) unsigned not null default '0',
   `db_name` char(45) not null,
   `id_mode` int(10) unsigned not null default '2',
   `p_addl` int(10) unsigned not null default '0',
   `s_addl` int(10) unsigned not null default '0',
   `daily_num` int(10) unsigned not null default '1',
   `pid` int(10) unsigned not null default '2',
   `pname` int(10) unsigned not null default '1',
   `sex` int(10) unsigned not null default '2',
   `age` int(10) unsigned not null default '1',
   `dob` int(10) unsigned not null default '1',
   `sid` int(10) unsigned not null default '2',
   `refout` int(10) unsigned not null default '1',
   `rdate` int(10) unsigned not null default '2',
   `comm` int(10) unsigned not null default '1',
   `dformat` varchar(45) not null default 'd-m-Y',
   `dnum_reset` int(10) unsigned not null default '1',
   `doctor` int(10) unsigned not null default '1',
   PRIMARY KEY (`lab_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `lab_config` is empty]

CREATE TABLE `lab_config_access` (
   `user_id` int(10) unsigned not null default '0',
   `lab_config_id` int(10) unsigned not null default '0',
   PRIMARY KEY (`user_id`,`lab_config_id`),
   KEY `lab_config_id` (`lab_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- [Table `lab_config_access` is empty]

CREATE TABLE `lab_config_settings` (
   `id` int(11) not null,
   `flag1` int(11),
   `flag2` int(11),
   `flag3` int(11),
   `flag4` int(11),
   `setting1` varchar(200),
   `setting2` varchar(200),
   `setting3` varchar(200),
   `setting4` varchar(200),
   `misc` varchar(500),
   `remarks` varchar(500),
   `ts` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `lab_config_settings` (`id`, `flag1`, `flag2`, `flag3`, `flag4`, `setting1`, `setting2`, `setting3`, `setting4`, `misc`, `remarks`, `ts`) VALUES 
('1', '1', '2', '30', '11', 'code39', '', '', '', '', 'Barcode Settings', '2019-09-08 14:59:41'),
('2', '20', '', '', '', '', '', '', '', '', 'Search Settings', '2019-09-08 14:59:41'),
('3', '1', '', '', '', 'USD', '.', '', '', '', 'Billing Settings', '2019-09-08 14:59:41');

CREATE TABLE `lab_config_specimen_type` (
   `lab_config_id` int(10) unsigned not null default '0',
   `specimen_type_id` int(10) unsigned not null default '0',
   KEY `lab_config_id` (`lab_config_id`),
   KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `lab_config_specimen_type` (`lab_config_id`, `specimen_type_id`) VALUES 
('1006', '7'),
('1006', '9'),
('1006', '2'),
('1006', '8'),
('1006', '5'),
('1006', '6'),
('1006', '10'),
('1006', '3'),
('1006', '4'),
('1006', '1');

CREATE TABLE `lab_config_test_type` (
   `lab_config_id` int(10) unsigned not null default '0',
   `test_type_id` int(10) unsigned not null default '0',
   KEY `lab_config_id` (`lab_config_id`),
   KEY `test_type_id` (`test_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `lab_config_test_type` (`lab_config_id`, `test_type_id`) VALUES 
('1006', '1'),
('1006', '2'),
('1006', '3'),
('1006', '4'),
('1006', '5'),
('1006', '6'),
('1006', '7'),
('1006', '8'),
('1006', '9'),
('1006', '10'),
('1006', '11'),
('1006', '12'),
('1006', '13'),
('1006', '14');

CREATE TABLE `labtitle_custom_field` (
   `id` int(11) unsigned not null auto_increment,
   `field_name` varchar(45) not null,
   `field_options` varchar(200) not null,
   `field_type_id` int(11) unsigned not null default '0',
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `labtitle_custom_field` is empty]

CREATE TABLE `measure` (
   `measure_id` int(11) unsigned not null auto_increment,
   `name` varchar(45) not null,
   `unit_id` int(10) unsigned,
   `range` varchar(500),
   `description` varchar(500),
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   `unit` varchar(30),
   PRIMARY KEY (`measure_id`),
   KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=15;

INSERT INTO `measure` (`measure_id`, `name`, `unit_id`, `range`, `description`, `ts`, `unit`) VALUES 
('1', 'Hb', '', ':', '', '2019-09-09 15:58:31', ''),
('2', 'RBC', '', ':', '', '2019-09-09 16:00:10', ''),
('3', 'WBC', '', ':', '', '2019-09-09 16:01:34', ''),
('4', 'Stool microscopy', '', '$freetext$$', '', '2019-09-09 16:06:35', ''),
('5', 'Bacterial vaginosis', '', '$freetext$$', '', '2019-09-09 16:08:16', ''),
('6', 'Skin snip', '', '$freetext$$', '', '2019-09-09 16:09:18', ''),
('7', 'Skin test', '', '$freetext$$', '', '2019-09-09 16:10:53', ''),
('8', 'Glucose test', '', ':', '', '2019-09-09 16:12:31', ''),
('9', 'Urine test', '', '1/10', '', '2019-09-09 16:14:04', ''),
('10', 'LFT', '', ':', '', '2019-09-09 16:20:28', ''),
('11', 'Prostrate monitoring', '', ':', '', '2019-09-09 16:27:13', ''),
('12', 'RFT', '', ':', '', '2019-09-09 16:32:25', ''),
('13', 'LFT', '', ':', '', '2019-09-11 13:36:27', 'mm/dl'),
('14', 'RFT', '', ':', '', '2019-09-11 15:04:26', 'mg/dl');

CREATE TABLE `misc` (
   `id` int(11) not null auto_increment,
   `r_id` int(11) not null default '0',
   `vr_id` varchar(45) not null default '0',
   `i1` int(11) not null default '0',
   `i2` int(11) not null default '0',
   `i3` int(11) not null default '0',
   `i4` int(11) not null default '0',
   `i5` int(11) not null default '0',
   `v1` varchar(500) not null default '0',
   `v2` varchar(500) not null default '0',
   `v3` varchar(500) not null default '0',
   `v4` varchar(500) not null default '0',
   `v5` varchar(500) not null default '0',
   `dt1` datetime,
   `dt2` datetime,
   `dt3` datetime,
   `d1` date,
   `d2` date,
   `d3` date,
   `ts` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `misc` is empty]

CREATE TABLE `numeric_interpretation` (
   `range_u` int(10),
   `range_l` int(10),
   `age_u` int(10),
   `age_l` int(10),
   `gender` varchar(40),
   `description` varchar(40),
   `measure_id` int(10) unsigned not null,
   `id` int(10) not null auto_increment,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `numeric_interpretation` is empty]

CREATE TABLE `patient` (
   `patient_id` int(11) unsigned not null default '0',
   `addl_id` varchar(40),
   `name` varchar(45),
   `sex` char(1) not null,
   `age` decimal(10,0),
   `dob` date,
   `created_by` int(11) unsigned,
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   `partial_dob` varchar(45),
   `surr_id` varchar(45),
   `hash_value` varchar(100),
   PRIMARY KEY (`patient_id`),
   KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `patient` (`patient_id`, `addl_id`, `name`, `sex`, `age`, `dob`, `created_by`, `ts`, `partial_dob`, `surr_id`, `hash_value`) VALUES 
('1', 'undefined', 'James John', 'M', '0', '', '504', '2019-09-10 00:00:00', '1974-09-10', '19001', 'aa7579bcc2a3f7d5f825c66b7b9d705a6d0bea1e'),
('2', 'undefined', 'Amie Kamara', 'F', '0', '', '504', '2019-09-10 00:00:00', '1999-09-10', '19002', '39b598b0aa826cab8aaa72d99cae4b6cca5b4531'),
('3', 'undefined', 'John Sesay', 'M', '0', '', '504', '2019-09-10 00:00:00', '2009-09-10', '19003', '72d17a355e2d7405f607d87e4da8a3f23e9a950b'),
('4', 'undefined', 'George King', 'M', '0', '', '504', '2019-09-10 00:00:00', '1954-09-10', '19004', 'c2d776be2ddef2b9449be689154b144c78886fdc'),
('5', 'undefined', 'Alex Conteh', 'M', '0', '', '504', '2019-09-10 00:00:00', '1987-09-10', '19005', 'b1f021ae85cc71636d88912b66f02ecac4f1b195'),
('6', 'undefined', 'Dora Bangura', 'F', '0', '', '504', '2019-09-10 00:00:00', '2001-09-10', '19006', '3c436862a46846cda6420fa9cd086a36b4127769'),
('7', 'undefined', 'Johannes Ansumana', 'M', '0', '', '504', '2019-09-10 00:00:00', '1979-09-10', '19007', 'e15394e200007e0ec34e329981dd5fec9d5b285c'),
('8', 'undefined', 'Solomon John', 'M', '0', '', '504', '2019-09-10 00:00:00', '2019-03-10', '19008', '9dc6837fbc75b56be16fc9515f3ea8dbee4803d5'),
('9', 'undefined', 'Sal Jay', 'F', '0', '', '504', '2019-09-10 00:00:00', '1999-09-10', '19009', 'd2c75060f7d7a16ed4266a89b208560b8d5371a6'),
('10', 'undefined', 'Kadija Bangura', 'F', '0', '', '504', '2019-09-10 00:00:00', '2004-09-10', '19010', '25e541bdd52c5a235e5c92ee9f5e020d1c24a713'),
('11', 'undefined', 'Fatmata Sesay', 'F', '0', '', '504', '2019-09-10 00:00:00', '1998-09-10', '19004', '984a4ae9fb9e8851e3dde92ca1bc0d24b50fd37c'),
('12', 'undefined', 'Mariama Jay', 'F', '0', '', '504', '2019-09-11 00:00:00', '1999-09-11', '2001', '3302c272fa909c11394844d1bd5c6f39f4640923'),
('13', 'undefined', 'Rama Bah', 'F', '0', '', '504', '2019-09-11 00:00:00', '2004-09-11', '2002', '8aad902442559dec73a1ea63b062891c98674b31'),
('14', 'undefined', 'Chernor Kamara', 'M', '0', '', '504', '2019-09-11 00:00:00', '1983-09-11', '2003', 'eeb417818f46dd4a6156e0b6d6e79aaeef4d0e93'),
('15', 'undefined', 'Maju Sesay', 'M', '0', '', '504', '2019-09-11 00:00:00', '2009-09-11', '2004', '6b370ed08752922eae1dc14e3267f6f6ef43bd67'),
('16', 'undefined', 'Alusine Kargbo', 'M', '0', '', '504', '2019-09-11 00:00:00', '1959-09-11', '2005', 'ebb6deb438dba5301f6bb851264fc9cc072f6169'),
('17', 'undefined', 'Alhaji Osman', 'M', '0', '', '504', '2019-09-11 00:00:00', '1978', '2006', 'dcc99300d4797a14c0f20c030aa5cbc7148ef895'),
('18', 'undefined', 'Ajuba Sall', 'M', '0', '', '504', '2019-09-11 00:00:00', '1989-09-11', '2007', '9418d2ef5b149be910677d574b034a76d7aa8fdc'),
('19', 'undefined', 'Sama Banya', 'M', '0', '', '504', '2019-09-11 00:00:00', '1988-09-11', '2008', 'f730bea53b7220d226f0c9405ed00dfcc3a51f7f'),
('20', 'undefined', 'Dora Scott', 'F', '0', '', '504', '2019-09-11 00:00:00', '1987-09-11', '2009', 'a62d94681c745c0e34701ff3aa072ce2ce7f57d2'),
('21', 'undefined', 'Fatmata Lamarana Jalloh', 'F', '0', '', '504', '2019-09-11 00:00:00', '2000-09-11', '2010', 'fe79f4f2b1a78b0730162de5085c5d3476e9172f'),
('22', 'undefined', 'Cyril Cole', 'M', '0', '', '504', '2019-09-11 00:00:00', '1985-09-11', '2011', '0731e9ce70afcbe2c2f1c8a95654ae655df77134'),
('23', 'undefined', 'James King', 'M', '0', '', '504', '2019-09-11 00:00:00', '2009-09-11', '2012', '0709518c434756b20fc892e73496ef1edee31aa4');

CREATE TABLE `patient_custom_data` (
   `id` int(11) unsigned not null auto_increment,
   `field_id` int(11) unsigned not null default '0',
   `patient_id` int(11) unsigned not null default '0',
   `field_value` varchar(45) not null,
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `field_id` (`field_id`),
   KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `patient_custom_data` is empty]

CREATE TABLE `patient_custom_field` (
   `id` int(11) unsigned not null auto_increment,
   `field_name` varchar(45) not null,
   `field_options` varchar(65474) not null,
   `field_type_id` int(11) unsigned not null default '0',
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `patient_custom_field` is empty]

CREATE TABLE `patient_daily` (
   `datestring` varchar(45) not null,
   `count` int(10) unsigned not null
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `patient_daily` (`datestring`, `count`) VALUES 
('20190910', '11'),
('20190911', '12');

CREATE TABLE `payments` (
   `id` int(11) not null auto_increment,
   `amount` decimal(10,2) not null default '0.00',
   `bill_id` int(11) unsigned not null,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `payments` is empty]

CREATE TABLE `reference_range` (
   `id` int(10) unsigned not null auto_increment,
   `measure_id` int(10) unsigned not null,
   `age_min` varchar(45),
   `age_max` varchar(45),
   `sex` varchar(10),
   `range_lower` varchar(45) not null,
   `range_upper` varchar(45) not null,
   PRIMARY KEY (`id`),
   KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=10;

INSERT INTO `reference_range` (`id`, `measure_id`, `age_min`, `age_max`, `sex`, `range_lower`, `range_upper`) VALUES 
('1', '1', '0', '100', 'B', '0', '1000'),
('2', '2', '0', '100', 'B', '1', '1000'),
('3', '3', '0', '100', 'B', '1', '1000'),
('4', '8', '0', '100', 'B', '1', '100'),
('5', '10', '0', '100', 'B', '1', '20'),
('6', '11', '0', '100', 'B', '1', '100'),
('7', '12', '0', '100', 'B', '1', '100'),
('8', '13', '0', '100', 'B', '1', '100'),
('9', '14', '0', '100', 'B', '1', '30');

CREATE TABLE `removal_record` (
   `id` int(11) not null auto_increment,
   `r_id` int(11) not null default '0',
   `vr_id` varchar(45) not null default '0',
   `type` int(11),
   `user_id` int(11) default '0',
   `remarks` varchar(500),
   `status` int(11) not null default '1',
   `ts` timestamp default CURRENT_TIMESTAMP,
   `category` varchar(20) default 'test',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=2;

INSERT INTO `removal_record` (`id`, `r_id`, `vr_id`, `type`, `user_id`, `remarks`, `status`, `ts`, `category`) VALUES 
('1', '17', '0', '1', '504', 'Typo', '1', '2019-09-11 13:45:58', 'patient');

CREATE TABLE `report_config` (
   `report_id` int(10) unsigned not null auto_increment,
   `header` varchar(500) not null,
   `footer` varchar(500) not null default '-End-',
   `margins` varchar(45) not null default '2,0,10,0',
   `p_fields` varchar(45) not null default '1,1,1,1,1,1,1',
   `s_fields` varchar(45) not null default '1,1,1,1,1,1',
   `t_fields` varchar(45) not null default '1,0,1,1,1,0,1,1',
   `p_custom_fields` varchar(45) not null,
   `s_custom_fields` varchar(45) not null,
   `test_type_id` varchar(45) not null default '0',
   `title` varchar(500) not null,
   `landscape` int(10) unsigned not null default '0',
   `row_items` int(1) unsigned not null default '3',
   `show_border` int(1) unsigned not null default '1',
   `show_result_border` int(1) unsigned not null default '1',
   `result_border_horizontal` int(1) unsigned not null default '0',
   `result_border_vertical` int(1) unsigned not null default '0',
   PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=21;

INSERT INTO `report_config` (`report_id`, `header`, `footer`, `margins`, `p_fields`, `s_fields`, `t_fields`, `p_custom_fields`, `s_custom_fields`, `test_type_id`, `title`, `landscape`, `row_items`, `show_border`, `show_result_border`, `result_border_horizontal`, `result_border_vertical`) VALUES 
('1', 'Patient Report', '', '2,0,10,0', '1,1,0,1,1,0,1,0,0,0,0,0,0', '1,0,0,0,0,1,1', '1,1,1,0,0,0,0,1,0,1,1,1', '', '', '0', 'Patient Report', '0', '1', '1', '1', '1', '1'),
('2', 'Specimen Report', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', '', '0', '', '0', '3', '1', '1', '0', '0'),
('3', 'Test Records', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', '', '0', '', '0', '3', '1', '1', '0', '0'),
('4', 'Daily Log - Specimens', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', '', '0', '', '0', '3', '1', '1', '0', '0'),
('5', 'Worksheet', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', '', '0', '', '0', '3', '1', '1', '0', '0'),
('6', 'Daily Log - Patients', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', '', '0', '', '0', '3', '1', '1', '0', '0'),
('7', 'Grouped Test Count Report Configuration', '0:4,4:9,9:14,14:19,19:24,24:29,29:34,34:39,39:44,44:49,49:54,54:59,59:64,64:+', '0', '1', '1', '1', '1', '0', '9999009', '0', '9999009', '3', '1', '1', '0', '0'),
('8', 'Grouped Specimen Count Report Configuration', '0:4,4:9,9:14,14:19,19:24,24:29,29:34,34:39,39:44,44:49,49:54,54:59,59:64,64:+', '0', '1', '1', '1', '1', '0', '9999019', '0', '9999019', '3', '1', '1', '0', '0'),
('9', 'Worksheet - Hb', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '1', '', '0', '3', '1', '1', '0', '0'),
('10', 'Worksheet -  RBC', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '2', '', '0', '3', '1', '1', '0', '0'),
('11', 'Worksheet - WBC Total', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '3', '', '0', '3', '1', '1', '0', '0'),
('12', 'Worksheet -  Stool Microscopy ', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '4', '', '0', '3', '1', '1', '0', '0'),
('13', 'Worksheet -  KOH for Bacterial Vaginosis', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '5', '', '0', '3', '1', '1', '0', '0'),
('14', 'Worksheet - Skin Snip for Filarial worm', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '6', '', '0', '3', '1', '1', '0', '0'),
('15', 'Worksheet - Skin Scrapings for Fungal Elements', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '7', '', '0', '3', '1', '1', '0', '0'),
('16', 'Worksheet -  Glucose Tolerance Test ', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '8', '', '0', '3', '1', '1', '0', '0'),
('17', 'Worksheet -  Urine Glucose ', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '9', '', '0', '3', '1', '1', '0', '0'),
('18', 'Worksheet - Albumin ', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '10', '', '0', '3', '1', '1', '0', '0'),
('19', 'Worksheet - Quantitative PSA', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '11', '', '0', '3', '1', '1', '0', '0'),
('20', 'Worksheet - Creatinine', '', '5,0,5,0', '0,1,0,1,1,0,0', '0,0,1,1,0,0', '1,0,1,0,0,0,0,1', '', '', '12', '', '0', '3', '1', '1', '0', '0');

CREATE TABLE `report_disease` (
   `id` int(10) unsigned not null auto_increment,
   `group_by_age` int(10) unsigned not null,
   `group_by_gender` int(10) unsigned not null,
   `age_groups` varchar(500),
   `measure_groups` varchar(500),
   `measure_id` int(10) unsigned not null,
   `lab_config_id` int(10) unsigned not null,
   `test_type_id` int(10) unsigned not null,
   PRIMARY KEY (`id`),
   KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=23;

INSERT INTO `report_disease` (`id`, `group_by_age`, `group_by_gender`, `age_groups`, `measure_groups`, `measure_id`, `lab_config_id`, `test_type_id`) VALUES 
('5', '1', '1', '0:4,5:9,10:14,15:100', '$freetext$$:,', '4', '1006', '4'),
('6', '1', '1', '0:4,5:9,10:14,15:100', '$freetext$$:,', '5', '1006', '5'),
('7', '1', '1', '0:4,5:9,10:14,15:100', '$freetext$$:,', '6', '1006', '6'),
('8', '1', '1', '0:4,5:9,10:14,15:100', '$freetext$$:,', '7', '1006', '7'),
('13', '0', '1', '', '1/10', '9', '1006', '9'),
('14', '1', '1', '0:4,5:9,10:14,15:100', '', '0', '1006', '0'),
('15', '1', '1', '0:4,5:9,10:14,15:100', '12.0g/dl:14g/dl,14g/dl:16g/dl,', '1', '1006', '1'),
('16', '1', '1', '0:4,5:9,10:14,15:100', '14g/dl:16g/dl,16g/dl:20g/dl,', '2', '1006', '2'),
('17', '1', '1', '0:4,5:9,10:14,15:100', '20g/dl:22g/dl,22g/dl:26g/dl,:,', '3', '1006', '3'),
('18', '1', '1', '0:4,5:9,10:14,15:100', ':,', '8', '1006', '8'),
('19', '1', '1', '0:4,5:9,10:14,15:100', ':,', '10', '1006', '10'),
('20', '1', '1', '0:4,5:9,10:14,15:100', ':,', '11', '1006', '11'),
('21', '1', '1', '0:4,5:9,10:14,15:100', ':,', '12', '1006', '12'),
('22', '1', '1', '0:4,5:9,10:14,15:100', ':,', '13', '1006', '13');

CREATE TABLE `sites` (
   `id` int(11) not null auto_increment,
   `name` varchar(255),
   `lab_id` int(11),
   `District` varchar(40),
   `Region` varchar(40),
   PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=6;

INSERT INTO `sites` (`id`, `name`, `lab_id`, `District`, `Region`) VALUES 
('1', 'Central Public Health Laboratory', '1006', 'Bo', 'South'),
('2', '', '0', '', ''),
('3', '', '0', '', ''),
('4', 'Moyamba', '1006', '', ''),
('5', 'Port Loko', '1006', '', '');

CREATE TABLE `specimen` (
   `specimen_id` int(10) unsigned not null default '0',
   `patient_id` int(11) unsigned not null default '0',
   `specimen_type_id` int(11) unsigned not null default '0',
   `user_id` int(11) unsigned,
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   `status_code_id` int(11) unsigned,
   `referred_to` int(11) unsigned,
   `comments` text,
   `aux_id` varchar(45),
   `date_collected` date not null default '0000-00-00',
   `date_recvd` date,
   `session_num` varchar(45),
   `time_collected` varchar(45),
   `report_to` int(10) unsigned,
   `doctor` varchar(45),
   `date_reported` datetime,
   `referred_to_name` varchar(70),
   `daily_num` varchar(45) not null,
   `referred_from_name` varchar(20),
   `site_id` int(11),
   PRIMARY KEY (`specimen_id`),
   KEY `patient_id` (`patient_id`),
   KEY `specimen_type_id` (`specimen_type_id`),
   KEY `user_id` (`user_id`),
   KEY `IDX_DATE` (`date_collected`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `specimen` (`specimen_id`, `patient_id`, `specimen_type_id`, `user_id`, `ts`, `status_code_id`, `referred_to`, `comments`, `aux_id`, `date_collected`, `date_recvd`, `session_num`, `time_collected`, `report_to`, `doctor`, `date_reported`, `referred_to_name`, `daily_num`, `referred_from_name`, `site_id`) VALUES 
('1', '1', '8', '504', '2019-09-10 15:40:36', '1', '0', 'generalized body itching', 'ss001', '2019-09-10', '2019-09-10', '20190910-1', '15:38', '1', 'Dr I Conteh', '', '', '20190910-001', '', '1'),
('2', '2', '3', '504', '2019-09-10 15:43:07', '1', '0', '', 'ug010', '2019-09-10', '2019-09-10', '20190910-2', '15:42', '1', 'Dr I Conteh', '', '', '20190910-2', '', '1'),
('3', '3', '3', '504', '2019-09-10 15:46:37', '1', '0', 'Painful urination', 'ug011', '2019-09-10', '2019-09-10', '20190910-3', '15:43', '1', 'Dr I Conteh', '', '', '20190910-3', '', '1'),
('4', '4', '9', '504', '2019-09-10 15:48:19', '1', '0', '', 'sem005', '2019-09-10', '2019-09-10', '20190910-4', '15:47', '1', 'Dr Jalloh', '', '', '20190910-4', '', '1'),
('5', '5', '8', '504', '2019-09-10 15:50:25', '1', '0', 'Multiple skin patches', 'ss022', '2019-09-10', '2019-09-10', '20190910-5', '15:49', '1', 'Dr Jalloh', '', '', '20190910-5', '', '1'),
('6', '6', '4', '504', '2019-09-10 15:52:29', '1', '0', '', 'vs007', '2019-09-10', '2019-09-10', '20190910-6', '15:51', '1', 'Dr King', '', '', '20190910-6', '', '1'),
('7', '7', '6', '504', '2019-09-10 15:54:25', '1', '0', '', 'ss010', '2019-09-10', '2019-09-10', '20190910-7', '15:53', '1', 'Dr I Conteh', '', '', '20190910-7', '', '1'),
('8', '8', '1', '504', '2019-09-10 15:56:40', '0', '0', '', 'WB008', '2019-09-10', '2019-09-10', '20190910-8', '15:55', '1', 'Dr King', '', '', '20190910-8', '', '1'),
('9', '9', '1', '504', '2019-09-10 15:57:51', '1', '0', '', 'WB003', '2019-09-10', '2019-09-10', '20190910-9', '15:57', '1', 'Dr Jalloh', '', '', '20190910-9', '', '1'),
('10', '10', '6', '504', '2019-09-10 15:59:15', '1', '0', '', 'ss090', '2019-09-10', '2019-09-10', '20190910-10', '15:58', '1', 'Dr Jalloh', '', '', '20190910-10', '', '1'),
('11', '11', '3', '504', '2019-09-10 16:18:40', '1', '0', '', 'u001', '2019-09-10', '2019-09-10', '20190910-11', '16:18', '1', 'Dr I Conteh', '', '', '20190910-11', '', '1'),
('12', '12', '7', '504', '2019-09-11 13:18:34', '1', '0', 'Severe back pain', '123', '2019-09-11', '2019-09-11', '20190911-1', '13:17', '1', 'Dr Bah', '', '', '20190911-1', '', '1'),
('13', '13', '8', '504', '2019-09-11 13:21:07', '1', '0', '', '141', '2019-09-11', '2019-09-11', '20190911-2', '13:19', '1', 'Dr King', '', '', '20190911-2', '', '1'),
('14', '14', '9', '504', '2019-09-11 13:26:47', '1', '0', '', '135', '2019-09-11', '2019-09-11', '20190911-3', '13:26', '1', 'Dr Jalloh', '', '', '20190911-3', '', '1'),
('15', '15', '6', '504', '2019-09-11 13:29:30', '1', '0', '', '124', '2019-09-11', '2019-09-11', '20190911-4', '13:28', '1', 'Dr King', '', '', '20190911-4', '', '1'),
('16', '16', '3', '504', '2019-09-11 13:33:20', '1', '0', '', 'ug110', '2019-09-11', '2019-09-11', '20190911-5', '13:31', '1', 'Dr Jalloh', '', '', '20190911-5', '', '1'),
('17', '18', '8', '504', '2019-09-11 13:42:54', '1', '0', '', '120', '2019-09-11', '2019-09-11', '20190911-8', '13:40', '1', 'Dr I Conteh', '', '', '20190911-7', '', '1'),
('18', '19', '3', '504', '2019-09-11 13:47:39', '1', '0', '', '101', '2019-09-11', '2019-09-11', '20190911-10', '13:47', '1', 'Dr I Conteh', '', '', '20190911-8', '', '1'),
('19', '20', '3', '504', '2019-09-11 13:49:07', '1', '0', '', 'ug005', '2019-09-11', '2019-09-11', '20190911-11', '13:48', '1', 'Dr Bah', '', '', '20190911-9', '', '1'),
('20', '21', '1', '504', '2019-09-11 13:50:35', '1', '0', '', 'B006', '2019-09-11', '2019-09-11', '20190911-12', '13:49', '1', 'Dr Jalloh', '', '', '20190911-10', '', '1'),
('21', '22', '1', '504', '2019-09-11 13:52:08', '0', '0', '', 'B090', '2019-09-11', '2019-09-11', '20190911-13', '13:51', '1', 'Dr King', '', '', '20190911-11', '', '1'),
('22', '23', '1', '504', '2019-09-11 14:00:54', '1', '0', '', 'B007', '2019-09-11', '2019-09-11', '20190911-14', '14:00', '1', 'Dr King', '', '', '20190911-12', '', '1');

CREATE TABLE `specimen_custom_data` (
   `id` int(11) unsigned not null auto_increment,
   `field_id` int(11) unsigned not null default '0',
   `specimen_id` int(10) unsigned not null default '0',
   `field_value` varchar(45) not null,
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `field_id` (`field_id`),
   KEY `specimen_id` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `specimen_custom_data` is empty]

CREATE TABLE `specimen_custom_field` (
   `id` int(11) unsigned not null auto_increment,
   `field_name` varchar(45) not null,
   `field_options` varchar(65474) not null,
   `field_type_id` int(11) unsigned not null default '0',
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `specimen_custom_field` is empty]

CREATE TABLE `specimen_session` (
   `session_num` varchar(45) not null,
   `count` int(10) unsigned not null default '0',
   PRIMARY KEY (`session_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `specimen_session` (`session_num`, `count`) VALUES 
('20190910', '11'),
('20190911', '14');

CREATE TABLE `specimen_test` (
   `test_type_id` int(11) unsigned not null default '0',
   `specimen_type_id` int(11) unsigned not null default '0',
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   KEY `test_type_id` (`test_type_id`),
   KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `specimen_test` (`test_type_id`, `specimen_type_id`, `ts`) VALUES 
('1', '1', '2019-09-09 15:58:31'),
('2', '2', '2019-09-09 16:00:11'),
('3', '2', '2019-09-09 16:01:34'),
('4', '6', '2019-09-09 16:06:35'),
('5', '3', '2019-09-09 16:08:16'),
('5', '4', '2019-09-09 16:08:16'),
('6', '8', '2019-09-09 16:09:18'),
('7', '8', '2019-09-09 16:10:53'),
('8', '2', '2019-09-09 16:12:32'),
('9', '3', '2019-09-09 16:14:04'),
('10', '2', '2019-09-09 16:20:28'),
('3', '7', '2019-09-09 16:23:08'),
('3', '1', '2019-09-09 16:24:22'),
('11', '9', '2019-09-09 16:27:13'),
('11', '1', '2019-09-09 16:27:13'),
('12', '2', '2019-09-09 16:32:25'),
('13', '7', '2019-09-11 13:36:27'),
('13', '9', '2019-09-11 13:36:27'),
('13', '2', '2019-09-11 13:36:27'),
('13', '8', '2019-09-11 13:36:27'),
('13', '5', '2019-09-11 13:36:27'),
('13', '6', '2019-09-11 13:36:27'),
('13', '10', '2019-09-11 13:36:27'),
('13', '3', '2019-09-11 13:36:27'),
('13', '4', '2019-09-11 13:36:27'),
('13', '1', '2019-09-11 13:36:27'),
('14', '7', '2019-09-11 15:04:26'),
('14', '9', '2019-09-11 15:04:27'),
('14', '2', '2019-09-11 15:04:27'),
('14', '8', '2019-09-11 15:04:27'),
('14', '5', '2019-09-11 15:04:27'),
('14', '6', '2019-09-11 15:04:27'),
('14', '10', '2019-09-11 15:04:27'),
('14', '3', '2019-09-11 15:04:27'),
('14', '4', '2019-09-11 15:04:27'),
('14', '1', '2019-09-11 15:04:27');

CREATE TABLE `specimen_type` (
   `specimen_type_id` int(11) unsigned not null auto_increment,
   `name` varchar(45) not null,
   `description` varchar(100),
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   `disabled` int(10) unsigned not null default '0',
   PRIMARY KEY (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `specimen_type` (`specimen_type_id`, `name`, `description`, `ts`, `disabled`) VALUES 
('1', 'whole blood', '', '2019-09-09 15:50:05', '0'),
('2', 'Serum', '', '2019-09-09 15:50:44', '0'),
('3', 'Urine', '', '2019-09-09 15:51:15', '0'),
('4', 'Vaginal swab', '', '2019-09-09 15:51:44', '0'),
('5', 'Sputum', '', '2019-09-09 15:52:09', '0'),
('6', 'Stool', '', '2019-09-09 15:52:33', '0'),
('7', 'CSF', '', '2019-09-09 15:52:58', '0'),
('8', 'Skin', '', '2019-09-09 15:53:25', '0'),
('9', 'Semen', '', '2019-09-09 15:53:50', '0'),
('10', 'Tissue', '', '2019-09-09 15:54:13', '0');

CREATE TABLE `stock_content` (
   `name` varchar(40),
   `current_quantity` int(11),
   `date_of_use` date not null,
   `receiver` varchar(40),
   `remarks` text,
   `lot_number` varchar(40),
   `new_balance` int(11),
   `user_name` varchar(40)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- [Table `stock_content` is empty]

CREATE TABLE `stock_details` (
   `name` varchar(40),
   `lot_number` varchar(40),
   `expiry_date` varchar(40),
   `manufacturer` varchar(40),
   `quantity_ordered` int(11),
   `supplier` varchar(40),
   `date_of_reception` timestamp not null default CURRENT_TIMESTAMP,
   `current_quantity` int(11),
   `date_of_supply` timestamp not null default '0000-00-00 00:00:00',
   `quantity_supplied` int(11),
   `unit` varchar(10),
   `entry_id` int(11),
   `cost_per_unit` decimal(10,0) default '0',
   `quantity_used` int(10) default '0',
   UNIQUE KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- [Table `stock_details` is empty]

CREATE TABLE `test` (
   `test_id` int(10) unsigned not null auto_increment,
   `test_type_id` int(11) unsigned not null default '0',
   `result` varchar(5000),
   `comments` varchar(200),
   `user_id` int(11) unsigned,
   `verified_by` int(11) unsigned,
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   `specimen_id` int(11) unsigned,
   `date_verified` datetime,
   PRIMARY KEY (`test_id`),
   KEY `test_type_id` (`test_type_id`),
   KEY `user_id` (`user_id`),
   KEY `specimen_id` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=23;

INSERT INTO `test` (`test_id`, `test_type_id`, `result`, `comments`, `user_id`, `verified_by`, `ts`, `specimen_id`, `date_verified`) VALUES 
('1', '6', '[$]Positive[/$],,aa7579bcc2a3f7d5f825c66b7b9d705a6d0bea1e', '', '504', '0', '2019-09-10 16:13:00', '1', ''),
('2', '9', '1,,39b598b0aa826cab8aaa72d99cae4b6cca5b4531', '', '504', '0', '2019-09-10 16:14:44', '2', ''),
('3', '9', '10,,72d17a355e2d7405f607d87e4da8a3f23e9a950b', 'Urine test:10', '504', '0', '2019-09-10 16:17:01', '3', ''),
('4', '11', '7,c2d776be2ddef2b9449be689154b144c78886fdc', '', '504', '0', '2019-09-10 00:00:00', '4', ''),
('5', '7', '[$]Negative[/$],,b1f021ae85cc71636d88912b66f02ecac4f1b195', '', '504', '0', '2019-09-10 16:13:48', '5', ''),
('6', '5', '[$]Negative[/$],,3c436862a46846cda6420fa9cd086a36b4127769', '', '504', '0', '2019-09-10 16:15:18', '6', ''),
('7', '4', '[$] Ascaris++[/$],,e15394e200007e0ec34e329981dd5fec9d5b285c', '', '504', '0', '2019-09-10 16:16:12', '7', ''),
('8', '1', '', '', '504', '0', '2019-09-10 15:56:40', '8', ''),
('9', '3', '500,,d2c75060f7d7a16ed4266a89b208560b8d5371a6', '', '504', '0', '2019-09-10 16:01:04', '9', ''),
('10', '4', '[$]Ova Ascaris +++[/$],,25e541bdd52c5a235e5c92ee9f5e020d1c24a713', '', '504', '0', '2019-09-10 16:11:20', '10', ''),
('11', '5', '[$]Positive[/$],,984a4ae9fb9e8851e3dde92ca1bc0d24b50fd37c', '', '504', '0', '2019-09-10 16:19:37', '11', ''),
('12', '3', '1100,3302c272fa909c11394844d1bd5c6f39f4640923', '', '504', '0', '2019-09-11 00:00:00', '12', ''),
('13', '6', '[$]Positive[/$],,8aad902442559dec73a1ea63b062891c98674b31', '', '504', '0', '2019-09-11 13:21:41', '13', ''),
('14', '11', '110,,eeb417818f46dd4a6156e0b6d6e79aaeef4d0e93', '', '504', '0', '2019-09-11 13:27:21', '14', ''),
('15', '4', '[$]No ova seen[/$],,6b370ed08752922eae1dc14e3267f6f6ef43bd67', '', '504', '0', '2019-09-11 13:30:01', '15', ''),
('16', '9', '1,ebb6deb438dba5301f6bb851264fc9cc072f6169', 'Positive', '504', '0', '2019-09-11 00:00:00', '16', ''),
('17', '6', '[$]Miroc filiria+++[/$],9418d2ef5b149be910677d574b034a76d7aa8fdc', '', '504', '0', '2019-09-11 00:00:00', '17', ''),
('18', '9', '10,f730bea53b7220d226f0c9405ed00dfcc3a51f7f', '', '504', '0', '2019-09-11 00:00:00', '18', ''),
('19', '9', '10,a62d94681c745c0e34701ff3aa072ce2ce7f57d2', '', '504', '0', '2019-09-11 00:00:00', '19', ''),
('20', '1', '900,fe79f4f2b1a78b0730162de5085c5d3476e9172f', '', '504', '0', '2019-09-11 00:00:00', '20', ''),
('21', '1', '', '', '504', '0', '2019-09-11 13:52:08', '21', ''),
('22', '1', '200,0709518c434756b20fc892e73496ef1edee31aa4', '', '504', '0', '2019-09-11 00:00:00', '22', '');

CREATE TABLE `test_agg_report_config` (
   `id` int(11) not null auto_increment,
   `test_type_id` int(11),
   `title` varchar(255),
   `landscape` tinyint(1) default '1',
   `group_by_age` tinyint(1) default '1',
   `age_unit` int(11) default '1',
   `age_groups` varchar(255),
   `report_type` int(11),
   PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3;

INSERT INTO `test_agg_report_config` (`id`, `test_type_id`, `title`, `landscape`, `group_by_age`, `age_unit`, `age_groups`, `report_type`) VALUES 
('1', '0', '', '1', '1', '1', '', '2'),
('2', '0', '', '1', '1', '1', '', '1');

CREATE TABLE `test_category` (
   `test_category_id` int(11) unsigned not null auto_increment,
   `name` varchar(45) not null,
   `description` varchar(100),
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`test_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5;

INSERT INTO `test_category` (`test_category_id`, `name`, `description`, `ts`) VALUES 
('1', 'HIV', '', '2019-09-08 14:59:11'),
('2', 'Heamatology', '', '2019-09-09 15:58:31'),
('3', 'Microbiology', '', '2019-09-09 16:06:35'),
('4', 'Biochemistry', '', '2019-09-09 16:12:31');

CREATE TABLE `test_type` (
   `test_type_id` int(11) unsigned not null auto_increment,
   `name` varchar(45) not null,
   `description` varchar(100),
   `test_category_id` int(11) unsigned not null default '0',
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   `is_panel` int(10) unsigned,
   `disabled` int(10) unsigned not null default '0',
   `clinical_data` longtext,
   `hide_patient_name` int(1),
   `prevalence_threshold` int(3) default '70',
   `target_tat` int(3) default '24',
   `is_reporting_enabled` tinyint(1) default '0',
   PRIMARY KEY (`test_type_id`),
   KEY `test_category_id` (`test_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=15;

INSERT INTO `test_type` (`test_type_id`, `name`, `description`, `test_category_id`, `ts`, `is_panel`, `disabled`, `clinical_data`, `hide_patient_name`, `prevalence_threshold`, `target_tat`, `is_reporting_enabled`) VALUES 
('1', 'Hb', '', '2', '2019-09-10 15:34:27', '0', '0', '', '0', '70', '0', '0'),
('2', ' RBC', '', '2', '2019-09-11 15:07:00', '0', '0', '', '0', '70', '51', '0'),
('3', 'WBC Total', '', '2', '2019-09-11 15:07:01', '0', '0', '', '0', '70', '24', '0'),
('4', ' Stool Microscopy ', '', '3', '2019-09-11 15:07:00', '0', '0', '', '0', '70', '3', '0'),
('5', ' KOH for Bacterial Vaginosis', '', '3', '2019-09-10 15:34:27', '0', '0', '', '0', '70', '24', '0'),
('6', 'Skin Snip for Filarial worm', '', '3', '2019-09-11 15:07:01', '0', '0', '', '0', '70', '51', '0'),
('7', 'Skin Scrapings for Fungal Elements', '', '3', '2019-09-10 15:34:27', '0', '0', '', '0', '70', '0', '0'),
('8', ' Glucose Tolerance Test ', '', '4', '2019-09-10 15:34:27', '0', '0', '', '0', '70', '24', '0'),
('9', ' Urine Glucose ', '', '4', '2019-09-10 15:34:27', '0', '0', '', '0', '70', '0', '0'),
('10', 'Albumin ', '', '4', '2019-09-10 15:34:27', '0', '0', '', '0', '70', '0', '0'),
('11', 'Quantitative PSA', '', '4', '2019-09-09 16:27:13', '0', '0', '', '0', '70', '24', '0'),
('12', 'Creatinine', '', '4', '2019-09-09 16:32:25', '0', '0', '', '0', '70', '24', '0'),
('13', 'LFT', '', '4', '2019-09-11 13:36:27', '0', '0', '', '0', '70', '24', '0'),
('14', 'RFT', '', '4', '2019-09-11 15:04:26', '0', '0', '', '0', '70', '24', '0');

CREATE TABLE `test_type_costs` (
   `earliest_date_valid` timestamp not null default CURRENT_TIMESTAMP,
   `test_type_id` int(11) not null,
   `amount` decimal(10,2) not null default '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `test_type_costs` (`earliest_date_valid`, `test_type_id`, `amount`) VALUES 
('2019-09-09 15:58:32', '1', '0.00'),
('2019-09-09 16:00:11', '2', '0.00'),
('2019-09-09 16:01:35', '3', '0.00'),
('2019-09-09 16:06:35', '4', '0.00'),
('2019-09-09 16:08:16', '5', '0.00'),
('2019-09-09 16:09:18', '6', '0.00'),
('2019-09-09 16:10:53', '7', '0.00'),
('2019-09-09 16:12:32', '8', '0.00'),
('2019-09-09 16:14:04', '9', '0.00'),
('2019-09-09 16:20:29', '10', '0.00'),
('2019-09-09 16:27:14', '11', '0.00'),
('2019-09-09 16:32:26', '12', '0.00'),
('2019-09-11 13:36:28', '13', '0.00'),
('2019-09-11 15:04:28', '14', '0.00');

CREATE TABLE `test_type_measure` (
   `test_type_id` int(11) unsigned not null default '0',
   `measure_id` int(11) unsigned not null default '0',
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   KEY `test_type_id` (`test_type_id`),
   KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `test_type_measure` (`test_type_id`, `measure_id`, `ts`) VALUES 
('1', '1', '2019-09-09 15:58:31'),
('2', '2', '2019-09-09 16:00:11'),
('3', '3', '2019-09-09 16:01:34'),
('4', '4', '2019-09-09 16:06:35'),
('5', '5', '2019-09-09 16:08:16'),
('6', '6', '2019-09-09 16:09:18'),
('7', '7', '2019-09-09 16:10:53'),
('8', '8', '2019-09-09 16:12:32'),
('9', '9', '2019-09-09 16:14:04'),
('10', '10', '2019-09-09 16:20:28'),
('11', '11', '2019-09-09 16:27:13'),
('12', '12', '2019-09-09 16:32:26'),
('13', '13', '2019-09-11 13:36:28'),
('14', '14', '2019-09-11 15:04:27');

CREATE TABLE `unit` (
   `unit_id` int(11) unsigned not null auto_increment,
   `unit` varchar(45) not null,
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `unit` is empty]

CREATE TABLE `user` (
   `user_id` int(11) unsigned not null auto_increment,
   `username` varchar(45) not null,
   `password` varchar(45) not null,
   `actualname` varchar(45),
   `email` varchar(45),
   `created_by` int(11) unsigned,
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   `lab_config_id` int(10) unsigned not null,
   `level` int(10) unsigned,
   `phone` varchar(45),
   `lang_id` varchar(45) not null default 'default',
   PRIMARY KEY (`user_id`),
   KEY `user_id_index` (`lab_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `user` is empty]

CREATE TABLE `user_feedback` (
   `id` int(11) not null auto_increment,
   `user_id` int(11),
   `rating` int(3),
   `comments` varchar(500),
   `ts` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=4;

INSERT INTO `user_feedback` (`id`, `user_id`, `rating`, `comments`, `ts`) VALUES 
('1', '504', '6', '', '2019-09-08 15:04:42'),
('2', '504', '2', 'Good tool for use', '2019-09-09 16:35:24'),
('3', '504', '3', '', '2019-09-10 14:25:20');

CREATE TABLE `user_props` (
   `User_Id` varchar(50) not null,
   `AppCodeName` varchar(25) not null,
   `AppName` varchar(25) not null,
   `AppVersion` varchar(25) not null,
   `CookieEnabled` tinyint(1) not null default '0',
   `Platform` varchar(20) not null,
   `UserAgent` varchar(200) not null,
   `SystemLanguage` varchar(15) not null,
   `UserLanguage` varchar(15) not null,
   `Language` varchar(15) not null,
   `ScreenAvailHeight` int(11) not null default '0',
   `ScreenAvailWidth` int(11) not null default '0',
   `ScreenColorDepth` int(11) not null default '0',
   `ScreenHeight` int(11) not null default '0',
   `ScreenWidth` int(11) not null default '0',
   `Recorded_At` datetime not null default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- [Table `user_props` is empty]

CREATE TABLE `user_rating` (
   `user_id` int(10) unsigned not null,
   `rating` int(10) unsigned not null,
   `ts` timestamp not null default CURRENT_TIMESTAMP,
   PRIMARY KEY (`user_id`,`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- [Table `user_rating` is empty]

CREATE TABLE `worksheet_custom` (
   `id` int(10) unsigned not null auto_increment,
   `name` varchar(100) not null,
   `header` varchar(500) not null,
   `footer` varchar(500) not null,
   `title` varchar(500) not null,
   `p_fields` varchar(100) not null,
   `s_fields` varchar(100) not null,
   `t_fields` varchar(100) not null,
   `p_custom` varchar(100) not null,
   `s_custom` varchar(100) not null,
   `margins` varchar(50) not null,
   `id_fields` varchar(45) not null default '0,0,0',
   `landscape` int(10) unsigned not null default '0',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `worksheet_custom` is empty]

CREATE TABLE `worksheet_custom_test` (
   `worksheet_id` int(10) unsigned not null,
   `test_type_id` int(10) unsigned not null,
   `measure_id` int(10) unsigned not null,
   `width` varchar(45) not null,
   KEY `worksheet_id` (`worksheet_id`),
   KEY `test_type_id` (`test_type_id`),
   KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- [Table `worksheet_custom_test` is empty]

CREATE TABLE `worksheet_custom_userfield` (
   `worksheet_id` int(10) unsigned not null,
   `name` varchar(70) not null,
   `width` int(10) unsigned not null default '10',
   `field_id` int(10) unsigned not null auto_increment,
   KEY `Primary Key` (`field_id`),
   KEY `worksheet_id` (`worksheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- [Table `worksheet_custom_userfield` is empty]