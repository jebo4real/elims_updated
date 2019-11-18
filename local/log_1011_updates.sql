USE blis_1011;

2019-09-09 13:47:38	CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `page` varchar(45) NOT NULL default '',
  `comment` varchar(150) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:39	


CREATE TABLE IF NOT EXISTS `custom_field_type` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_type` varchar(45) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:39	


CREATE TABLE IF NOT EXISTS `delay_measures` (
  `User_Id` varchar(50) NOT NULL default '',
  `IP_Address` varchar(16) NOT NULL default '',
  `Latency` int(11) NOT NULL default '0',
  `Recorded_At` datetime NOT NULL default '0000-00-00 00:00:00',
  `Page_Name` varchar(45) default NULL,
  `Request_URI` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:39	


CREATE TABLE IF NOT EXISTS `inv_reagent` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) collate latin1_general_ci NOT NULL,
  `unit` varchar(45) collate latin1_general_ci NOT NULL default 'units',
  `remarks` varchar(245) collate latin1_general_ci default NULL,
  `created_by` varchar(10) collate latin1_general_ci NOT NULL default '0',
  `assocation` varchar(10) collate latin1_general_ci default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:39	


CREATE TABLE IF NOT EXISTS `inv_supply` (
  `id` int(11) NOT NULL auto_increment,
  `reagent_id` int(11) NOT NULL,
  `lot` varchar(100) collate latin1_general_ci NOT NULL,
  `expiry_date` date default NULL,
  `manufacturer` varchar(100) collate latin1_general_ci default NULL,
  `supplier` varchar(100) collate latin1_general_ci default NULL,
  `quantity_ordered` int(11) NOT NULL default '0',
  `quantity_supplied` int(11) NOT NULL default '0',
  `cost_per_unit` decimal(10,0) default NULL,
  `user_id` int(11) NOT NULL default '0',
  `date_of_order` date default NULL,
  `date_of_supply` date default NULL,
  `date_of_reception` date default NULL,
  `remarks` varchar(250) collate latin1_general_ci default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `reagent_id` (`reagent_id`),
  CONSTRAINT `reagent_id` FOREIGN KEY (`reagent_id`) REFERENCES `inv_reagent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:39	


CREATE TABLE IF NOT EXISTS `inv_usage` (
  `id` int(11) NOT NULL auto_increment,
  `reagent_id` int(11) NOT NULL,
  `lot` varchar(100) collate latin1_general_ci NOT NULL,
  `quantity_used` int(11) NOT NULL default '0',
  `date_of_use` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` varchar(250) collate latin1_general_ci default NULL,
  `ts` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `reagent_id` (`reagent_id`),
  KEY `reagent_id2` (`reagent_id`),
  CONSTRAINT `reagent_id2` FOREIGN KEY (`reagent_id`) REFERENCES `inv_reagent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:39	


CREATE TABLE IF NOT EXISTS `lab_config` (
  `lab_config_id` int(10) unsigned NOT NULL auto_increment,
  `name` char(45) NOT NULL default '',
  `location` char(45) NOT NULL default '',
  `admin_user_id` int(10) unsigned NOT NULL default '0',
  `db_name` char(45) NOT NULL default '',
  `id_mode` int(10) unsigned NOT NULL default '2',
  `p_addl` int(10) unsigned NOT NULL default '0',
  `s_addl` int(10) unsigned NOT NULL default '0',
  `daily_num` int(10) unsigned NOT NULL default '1',
  `pid` int(10) unsigned NOT NULL default '2',
  `pname` int(10) unsigned NOT NULL default '1',
  `sex` int(10) unsigned NOT NULL default '2',
  `age` int(10) unsigned NOT NULL default '1',
  `dob` int(10) unsigned NOT NULL default '1',
  `sid` int(10) unsigned NOT NULL default '2',
  `refout` int(10) unsigned NOT NULL default '1',
  `rdate` int(10) unsigned NOT NULL default '2',
  `comm` int(10) unsigned NOT NULL default '1',
  `dformat` varchar(45) NOT NULL default 'd-m-Y',
  `dnum_reset` int(10) unsigned NOT NULL default '1',
  `doctor` int(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (`lab_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;
2019-09-09 13:47:40	


CREATE TABLE IF NOT EXISTS `lab_config_access` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`lab_config_id`),
  KEY `lab_config_id` (`lab_config_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:40	


CREATE TABLE IF NOT EXISTS `lab_config_specimen_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `specimen_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:40	


CREATE TABLE IF NOT EXISTS `lab_config_test_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `test_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `test_type_id` (`test_type_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:40	


CREATE TABLE IF NOT EXISTS `labtitle_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL,
  `field_options` varchar(200) NOT NULL,
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:41	


CREATE TABLE IF NOT EXISTS `measure` (
  `measure_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `unit_id` int(10) unsigned default NULL,
  `range` varchar(500) default NULL,
  `description` varchar(500) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `unit` varchar(30) default NULL,
  PRIMARY KEY  (`measure_id`),
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:41	


CREATE TABLE IF NOT EXISTS `misc` (
  `id` int(11) NOT NULL auto_increment,
  `r_id` int(11) NOT NULL default '0',
  `vr_id` varchar(45) collate latin1_general_ci NOT NULL default '0',
  `i1` int(11) NOT NULL default '0',
  `i2` int(11) NOT NULL default '0',
  `i3` int(11) NOT NULL default '0',
  `i4` int(11) NOT NULL default '0',
  `i5` int(11) NOT NULL default '0',
  `v1` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `v2` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `v3` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `v4` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `v5` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `dt1` datetime default NULL,
  `dt2` datetime default NULL,
  `dt3` datetime default NULL,
  `d1` date default NULL,
  `d2` date default NULL,
  `d3` date default NULL,
  `ts` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:41	


CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int(11) unsigned NOT NULL default '0',
  `addl_id` varchar(40) default NULL,
  `name` varchar(45) default NULL,
  `sex` char(1) NOT NULL default '',
  `age` decimal(10,0) default NULL,
  `dob` date default NULL,
  `created_by` int(11) unsigned default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `partial_dob` varchar(45) default NULL,
  `surr_id` varchar(45) default NULL,
  `hash_value` varchar(100) default NULL,
  PRIMARY KEY  (`patient_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:41	


CREATE TABLE IF NOT EXISTS `patient_custom_data` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `patient_id` int(11) unsigned NOT NULL default '0',
  `field_value` varchar(45) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:41	


CREATE TABLE IF NOT EXISTS `patient_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` varchar(65474) NOT NULL default '',
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:41	


CREATE TABLE IF NOT EXISTS `patient_daily` (
  `datestring` varchar(45) NOT NULL,
  `count` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:42	


CREATE TABLE IF NOT EXISTS `reference_range` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `measure_id` int(10) unsigned NOT NULL,
  `age_min` varchar(45) default NULL,
  `age_max` varchar(45) default NULL,
  `sex` varchar(10) default NULL,
  `range_lower` varchar(45) NOT NULL,
  `range_upper` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:42	


CREATE TABLE IF NOT EXISTS `removal_record` (
  `id` int(11) NOT NULL auto_increment,
  `r_id` int(11) NOT NULL default '0',
  `vr_id` varchar(45) collate latin1_general_ci NOT NULL default '0',
  `type` int(11) default NULL,
  `user_id` int(11) default '0',
  `remarks` varchar(500) collate latin1_general_ci default NULL,
  `status` int(11) NOT NULL default '1',
  `ts` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:42	


CREATE TABLE IF NOT EXISTS `report_config` (
  `report_id` int(10) unsigned NOT NULL auto_increment,
  `header` varchar(500) NOT NULL default '',
  `footer` varchar(500) NOT NULL default '-End-',
  `margins` varchar(45) NOT NULL default '2,0,10,0',
  `p_fields` varchar(45) NOT NULL default '1,1,1,1,1,1,1',
  `s_fields` varchar(45) NOT NULL default '1,1,1,1,1,1',
  `t_fields` varchar(45) NOT NULL default '1,0,1,1,1,0,1,1',
  `p_custom_fields` varchar(45) NOT NULL default '',
  `s_custom_fields` varchar(45) NOT NULL default '',
  `test_type_id` varchar(45) NOT NULL default '0',
  `title` varchar(500) NOT NULL default '',
  `landscape` int(10) unsigned NOT NULL default '0',
  `row_items` int(1) unsigned NOT NULL default '3',
  `show_border` int(1) unsigned NOT NULL default '1',
  `show_result_border` int(1) unsigned NOT NULL default '1',
  `result_border_horizontal` int(1) unsigned NOT NULL default '0',
  `result_border_vertical` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:42	


CREATE TABLE IF NOT EXISTS `report_disease` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `group_by_age` int(10) unsigned NOT NULL,
  `group_by_gender` int(10) unsigned NOT NULL,
  `age_groups` varchar(500) default NULL,
  `measure_groups` varchar(500) default NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `lab_config_id` int(10) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`id`),
  KEY `measure_id` (`measure_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:42	


CREATE TABLE IF NOT EXISTS `specimen` (
  `specimen_id` int(10) unsigned NOT NULL default '0',
  `patient_id` int(11) unsigned NOT NULL default '0',
  `specimen_type_id` int(11) unsigned NOT NULL default '0',
  `user_id` int(11) unsigned default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `status_code_id` int(11) unsigned default NULL,
  `referred_to` int(11) unsigned default NULL,
  `comments` text,
  `aux_id` varchar(45) default NULL,
  `date_collected` date NOT NULL default '0000-00-00',
  `date_recvd` date default NULL,
  `session_num` varchar(45) default NULL,
  `time_collected` varchar(45) default NULL,
  `report_to` int(10) unsigned default NULL,
  `doctor` varchar(45) default NULL,
  `date_reported` datetime default NULL,
  `referred_to_name` varchar(70) default NULL,
  `daily_num` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`specimen_id`),
  KEY `patient_id` (`patient_id`),
  KEY `specimen_type_id` (`specimen_type_id`),
  KEY `user_id` (`user_id`),
  KEY `IDX_DATE` (`date_collected`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:43	


CREATE TABLE IF NOT EXISTS `specimen_custom_data` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `specimen_id` int(10) unsigned NOT NULL default '0',
  `field_value` varchar(45) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`),
  KEY `specimen_id` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:43	


CREATE TABLE IF NOT EXISTS `specimen_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` varchar(65474) NOT NULL default '',
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:43	


CREATE TABLE IF NOT EXISTS `specimen_session` (
  `session_num` varchar(45) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:43	


CREATE TABLE IF NOT EXISTS `specimen_test` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `specimen_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relates tests to the specimens that are compatible with thos';
2019-09-09 13:47:43	


CREATE TABLE IF NOT EXISTS `specimen_type` (
  `specimen_type_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `disabled` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:44	


CREATE TABLE IF NOT EXISTS `stock_content` (
  `name` varchar(40) default NULL,
  `current_quantity` int(11) default NULL,
  `date_of_use` date NOT NULL,
  `receiver` varchar(40) default NULL,
  `remarks` text,
  `lot_number` varchar(40) default NULL,
  `new_balance` int(11) default NULL,
  `user_name` varchar(40) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:44	


CREATE TABLE IF NOT EXISTS `stock_details` (
  `name` varchar(40) default NULL,
  `lot_number` varchar(40) default NULL,
  `expiry_date` varchar(40) default NULL,
  `manufacturer` varchar(40) default NULL,
  `quantity_ordered` int(11) default NULL,
  `supplier` varchar(40) default NULL,
  `date_of_reception` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `current_quantity` int(11) default NULL,
  `date_of_supply` timestamp NOT NULL default '0000-00-00 00:00:00',
  `quantity_supplied` int(11) default NULL,
  `unit` varchar(10) default NULL,
  `entry_id` int(11) default NULL,
  `cost_per_unit` decimal(10,0) default '0',
  `quantity_used` int(10) default '0',
  UNIQUE KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:44	


CREATE TABLE IF NOT EXISTS `test` (
  `test_id` int(10) unsigned NOT NULL auto_increment,
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `result` varchar(5000) default NULL,
  `comments` varchar(200) default NULL,
  `user_id` int(11) unsigned default NULL,
  `verified_by` int(11) unsigned default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `specimen_id` int(11) unsigned default NULL,
  `date_verified` datetime default NULL,
  PRIMARY KEY  (`test_id`),
  KEY `test_type_id` (`test_type_id`),
  KEY `user_id` (`user_id`),
  KEY `specimen_id` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:44	


CREATE TABLE IF NOT EXISTS `test_category` (
  `test_category_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`test_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:45	


CREATE TABLE IF NOT EXISTS `test_type` (
  `test_type_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `test_category_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `is_panel` int(10) unsigned default NULL,
  `disabled` int(10) unsigned NOT NULL default '0',
  `clinical_data` longtext,
  `hide_patient_name` int(1) default NULL,
  `prevalence_threshold` int(3) default '70',
  `target_tat` int(3) default '24',
  PRIMARY KEY  (`test_type_id`),
  KEY `test_category_id` (`test_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:45	


CREATE TABLE IF NOT EXISTS `test_type_measure` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `measure_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:45	


CREATE TABLE IF NOT EXISTS `unit` (
  `unit_id` int(11) unsigned NOT NULL auto_increment,
  `unit` varchar(45) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:45	


CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  `actualname` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `created_by` int(11) unsigned default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `lab_config_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned default NULL,
  `phone` varchar(45) default NULL,
  `lang_id` varchar(45) NOT NULL default 'default',
  PRIMARY KEY  (`user_id`),
  KEY `user_id_index` USING BTREE (`lab_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Users are anybody that works in the lab.';
2019-09-09 13:47:45	


CREATE TABLE IF NOT EXISTS `user_props` (
  `User_Id` varchar(50) NOT NULL default '',
  `AppCodeName` varchar(25) NOT NULL default '',
  `AppName` varchar(25) NOT NULL default '',
  `AppVersion` varchar(25) NOT NULL default '',
  `CookieEnabled` tinyint(1) NOT NULL default '0',
  `Platform` varchar(20) NOT NULL default '',
  `UserAgent` varchar(200) NOT NULL default '',
  `SystemLanguage` varchar(15) NOT NULL default '',
  `UserLanguage` varchar(15) NOT NULL default '',
  `Language` varchar(15) NOT NULL default '',
  `ScreenAvailHeight` int(11) NOT NULL default '0',
  `ScreenAvailWidth` int(11) NOT NULL default '0',
  `ScreenColorDepth` int(11) NOT NULL default '0',
  `ScreenHeight` int(11) NOT NULL default '0',
  `ScreenWidth` int(11) NOT NULL default '0',
  `Recorded_At` datetime NOT NULL default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:45	


CREATE TABLE IF NOT EXISTS `user_rating` (
  `user_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`,`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:46	


CREATE TABLE IF NOT EXISTS `worksheet_custom` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `header` varchar(500) NOT NULL,
  `footer` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `p_fields` varchar(100) NOT NULL,
  `s_fields` varchar(100) NOT NULL,
  `t_fields` varchar(100) NOT NULL,
  `p_custom` varchar(100) NOT NULL,
  `s_custom` varchar(100) NOT NULL,
  `margins` varchar(50) NOT NULL,
  `id_fields` varchar(45) NOT NULL default '0,0,0',
  `landscape` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:46	


CREATE TABLE IF NOT EXISTS `worksheet_custom_test` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `width` varchar(45) NOT NULL,
  KEY `worksheet_id` (`worksheet_id`),
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:46	


CREATE TABLE IF NOT EXISTS `worksheet_custom_userfield` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `name` varchar(70) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '10',
  `field_id` int(10) unsigned NOT NULL auto_increment,
  KEY `Primary Key` (`field_id`),
  KEY `worksheet_id` (`worksheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:46	


CREATE TABLE IF NOT EXISTS `test_type_costs` (
  `earliest_date_valid` timestamp NOT NULL,
  `test_type_id` int(11) NOT NULL,
  `amount` decimal(10, 2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:46	

CREATE TABLE IF NOT EXISTS `lab_config_settings` (
  `id` int(11) NOT NULL,
  `flag1` int(11) default NULL,
  `flag2` int(11) default NULL,
  `flag3` int(11) default NULL,
  `flag4` int(11) default NULL,
  `setting1` varchar(200) collate latin1_general_ci default NULL,
  `setting2` varchar(200) collate latin1_general_ci default NULL,
  `setting3` varchar(200) collate latin1_general_ci default NULL,
  `setting4` varchar(200) collate latin1_general_ci default NULL,
  `misc` varchar(500) collate latin1_general_ci default NULL,
  `remarks` varchar(500) collate latin1_general_ci default NULL,
  `ts` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:47	

CREATE TABLE IF NOT EXISTS `numeric_interpretation` (
  `range_u` int(10) default NULL,
  `range_l` int(10) default NULL,
  `age_u` int(10) default NULL,
  `age_l` int(10) default NULL,
  `gender` varchar(40) default NULL,
  `description` varchar(40) default NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `id` int(10) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:47	

CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `patient_id` int(11) unsigned NOT NULL,
  `paid_in_full` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:47	

CREATE TABLE IF NOT EXISTS `bills_test_association` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `bill_id` int(11) unsigned NOT NULL,
  `test_id` int(11) unsigned NOT NULL,
  `discount_type` int(4) unsigned NOT NULL default '1000',
  `discount_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:47	

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL auto_increment,
  `amount` decimal(10,2) NOT NULL default '0.00',
  `bill_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:47	


CREATE  TABLE IF NOT EXISTS `user_feedback` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NULL ,
  `rating` INT(3) NULL ,
  `comments` VARCHAR(500) NULL ,
  `ts` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) );
2019-09-09 13:47:47	


INSERT INTO `report_config` (`report_id`, `header`, `footer`, `margins`, `p_fields`, `s_fields`, `t_fields`, `p_custom_fields`, `s_custom_fields`,`test_type_id`,`title`,`landscape`,`row_items`,`show_border`,`show_result_border`,`result_border_horizontal`,`result_border_vertical`) VALUES 
('1', 'Patient Report', '', '2,0,10,0', '1,1,0,1,1,0,1,0,0,0,0,0,0', '1,0,0,0,0,1,1', '1,1,1,0,0,0,0,1,0,1,1,1', '', '', '0', 'Patient Report', 0, 1, 1, 1, 1, 1);
2019-09-09 13:47:47	

INSERT INTO `report_config` (`report_id`, `header`, `footer`, `margins`, `p_fields`, `s_fields`, `t_fields`, `p_custom_fields`, `s_custom_fields`) VALUES 
('2', 'Specimen Report', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('3', 'Test Records', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('4', 'Daily Log - Specimens', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('5', 'Worksheet', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('6', 'Daily Log - Patients', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', '');
2019-09-09 13:47:47	

CREATE TABLE IF NOT EXISTS `currency_conversion` (
  `currencya` varchar(200) NOT NULL,
  `currencyb` varchar(200) NOT NULL,
  `exchangerate` FLOAT(5,2) default NULL,
  `updatedts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `flag1` int(11) default NULL,
  `flag2` int(11) default NULL,
  `setting1` varchar(200) default NULL,
  `setting2` varchar(200) default NULL,
  PRIMARY KEY  (`currencya`,`currencyb`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
2019-09-09 13:47:47	

INSERT INTO `test_category` (`test_category_id`, `name`) VALUES(1, 'HIV');
2019-09-09 13:47:47	


CREATE TABLE `field_order` (
  `id` int(11) NOT NULL auto_increment,
  `lab_config_id` int(11) unsigned default NULL,
  `form_id` int(11) default NULL,
  `field_order` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
2019-09-09 13:47:48	

alter table removal_record add category varchar(20) default "test";
2019-09-09 13:47:48	

ALTER TABLE specimen ADD COLUMN referred_from_name varchar(20);
2019-09-09 13:47:48	

CREATE TABLE IF NOT EXISTS sites (
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255),
  lab_id INT,
  District VARCHAR(40),
 Region VARCHAR(40),
  PRIMARY KEY (id)
);
2019-09-09 13:47:49	

ALTER TABLE specimen ADD COLUMN site_id INT;
2019-09-09 13:47:49	

CREATE TABLE IF NOT EXISTS test_agg_report_config (
  id INT NOT NULL AUTO_INCREMENT,
  test_type_id INT,
  title VARCHAR(255),
  landscape BOOLEAN DEFAULT 1,
  group_by_age BOOLEAN DEFAULT 1,
  age_unit INT DEFAULT 1,
  age_groups VARCHAR(255),
  report_type INT,
  PRIMARY KEY (id)
);
2019-09-09 13:47:49	

ALTER TABLE test_type ADD COLUMN is_reporting_enabled BOOLEAN DEFAULT 0;
2019-09-09 13:47:49	
;
2019-09-09 15:49:43	UPDATE specimen_type SET name='Sputum', description='Cough more than two weeks' WHERE specimen_type_id=12
2019-09-09 15:51:18	UPDATE specimen_type SET name='Stool', description='Stomach ache' WHERE specimen_type_id=14
2019-09-09 15:52:07	UPDATE specimen_type SET name='Whole blood', description='Joint pain' WHERE specimen_type_id=16
2019-09-09 15:53:09	UPDATE specimen_type SET name='Serum/Whole blood', description='Frequent urination, dehydration' WHERE specimen_type_id=9
2019-09-09 15:54:25	UPDATE specimen_type SET name='Serum', description='Swelling of stomach and feet' WHERE specimen_type_id=7
2019-09-09 16:02:52	INSERT INTO user_feedback (user_id, rating, comments) VALUES (509, 6, '')
2019-09-09 16:05:55	UPDATE specimen_type SET name='Urine Analysis', description='Chemical analysis' WHERE specimen_type_id=5
2019-09-09 16:08:15	UPDATE specimen_type SET name='Virginal swab', description='Infection in the virginal' WHERE specimen_type_id=2
2019-09-09 16:16:15	UPDATE specimen_type SET name='Skin', description='Body rash' WHERE specimen_type_id=13
2019-09-09 16:19:29	UPDATE specimen_type SET name='Serum/Whole blood', description='Frequent urination, dehydration' WHERE specimen_type_id=9
2019-09-09 16:24:44	UPDATE specimen_type SET name='Water', description='Frequent urination, dehydration' WHERE specimen_type_id=9
2019-09-09 16:33:06	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1011, 1)
2019-09-09 16:37:11	INSERT INTO user_feedback (user_id, rating, comments) VALUES (509, 6, '')
2019-09-09 17:02:07	INSERT INTO user_feedback (user_id, rating, comments) VALUES (509, 6, '')
2019-09-09 17:04:55	INSERT INTO user_feedback (user_id, rating, comments) VALUES (509, 6, '')
2019-09-10 14:28:28	UPDATE lab_config_settings SET flag1 = 20 WHERE id = 2
2019-09-10 15:35:46	DELETE FROM report_disease WHERE lab_config_id=1011 AND test_type_id=0 AND measure_id=0
2019-09-10 15:35:46	DELETE FROM report_disease WHERE lab_config_id=1011 AND test_type_id=1 AND measure_id=1
2019-09-10 15:44:33	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-10 15:44:33	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-10 15:47:00	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-10 15:47:00	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-10 15:57:40	DELETE FROM report_disease WHERE lab_config_id=1011 AND test_type_id=0 AND measure_id=0
2019-09-10 15:57:40	DELETE FROM report_disease WHERE lab_config_id=1011 AND test_type_id=1 AND measure_id=1
2019-09-10 16:02:33	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-10 16:02:33	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-10 16:03:25	DELETE FROM report_disease WHERE lab_config_id=1011 AND test_type_id=0 AND measure_id=0
2019-09-10 16:03:25	DELETE FROM report_disease WHERE lab_config_id=1011 AND test_type_id=1 AND measure_id=1
2019-09-10 16:15:47	UPDATE measure SET name='Hb', range=':', unit='' WHERE measure_id=1
2019-09-10 16:15:47	UPDATE test_type SET name='Haemoglobin', description='Blood level', clinical_data='Anaemia', test_category_id='2', hide_patient_name='1', prevalence_threshold=70, target_tat=24 WHERE test_type_id=1
2019-09-10 16:15:47	DELETE from specimen_test WHERE test_type_id=1 AND specimen_type_id=17
2019-09-10 16:15:47	INSERT INTO specimen_test (specimen_type_id, test_type_id) VALUES (16, 1)
2019-09-10 16:18:35	UPDATE measure SET name='Hb', range=':', unit='' WHERE measure_id=1
2019-09-10 16:18:35	UPDATE test_type SET name='Haemoglobin', description='Blood level', clinical_data='Anaemia', test_category_id='2', hide_patient_name='1', prevalence_threshold=70, target_tat=24 WHERE test_type_id=1
2019-09-10 16:18:35	INSERT INTO specimen_test (specimen_type_id, test_type_id) VALUES (7, 1)
2019-09-10 16:18:35	INSERT INTO specimen_test (specimen_type_id, test_type_id) VALUES (13, 1)
2019-09-10 16:18:36	INSERT INTO specimen_test (specimen_type_id, test_type_id) VALUES (12, 1)
2019-09-10 16:18:36	INSERT INTO specimen_test (specimen_type_id, test_type_id) VALUES (14, 1)
2019-09-10 16:18:36	INSERT INTO specimen_test (specimen_type_id, test_type_id) VALUES (15, 1)
2019-09-10 16:19:25	UPDATE specimen_type SET name=' Swab', description='' WHERE specimen_type_id=2
2019-09-10 16:20:39	UPDATE measure SET name='Hb', range=':', unit='' WHERE measure_id=1
2019-09-10 16:20:39	UPDATE test_type SET name='Haemoglobin', description='Blood level', clinical_data='Anaemia', test_category_id='2', hide_patient_name='1', prevalence_threshold=70, target_tat=24 WHERE test_type_id=1
2019-09-10 16:20:39	INSERT INTO specimen_test (specimen_type_id, test_type_id) VALUES (2, 1)
2019-09-10 16:26:13	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1011, 2)
2019-09-10 16:28:55	BEGIN
2019-09-10 16:28:55	INSERT INTO specimen_custom_data (field_id, specimen_id, field_value) VALUES (1, 1, 'Adequate')
2019-09-10 16:28:55	COMMIT
2019-09-11 13:16:00	UPDATE specimen_session SET count=2 WHERE session_num='20190911'
2019-09-11 13:16:34	UPDATE specimen_session SET count=3 WHERE session_num='20190911'
2019-09-11 13:17:39	UPDATE specimen_session SET count=4 WHERE session_num='20190911'
2019-09-11 13:19:29	BEGIN
2019-09-11 13:19:29	INSERT INTO specimen_custom_data (field_id, specimen_id, field_value) VALUES (1, 2, 'Adequate')
2019-09-11 13:19:29	COMMIT
2019-09-11 13:25:59	INSERT INTO user_feedback (user_id, rating, comments) VALUES (518, 6, '')
2019-09-11 13:26:37	INSERT INTO user_feedback (user_id, rating, comments) VALUES (517, 6, '')
2019-09-11 13:32:41	INSERT INTO user_feedback (user_id, rating, comments) VALUES (509, 6, '')
2019-09-11 13:33:10	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:33:10	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-11 13:34:28	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:34:28	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-11 13:35:58	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:35:58	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-11 13:36:07	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:36:07	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-11 13:37:19	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:37:19	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-11 13:37:38	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:37:38	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-11 13:39:19	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:39:19	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-11 13:39:22	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:39:23	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=2
2019-09-11 13:43:00	UPDATE specimen_session SET count=5 WHERE session_num='20190911'
2019-09-11 13:44:36	DELETE FROM patient_custom_field WHERE id=1 
2019-09-11 13:44:36	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:45:00	DELETE FROM patient_custom_field WHERE id=2 
2019-09-11 13:45:00	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:45:21	DELETE FROM patient_custom_field WHERE id=3 
2019-09-11 13:45:21	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:45:40	DELETE FROM patient_custom_field WHERE id=4 
2019-09-11 13:45:40	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:45:56	DELETE FROM patient_custom_field WHERE id=5 
2019-09-11 13:45:56	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:46:10	DELETE FROM patient_custom_field WHERE id=6 
2019-09-11 13:46:10	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:47:06	DELETE FROM patient_custom_field WHERE id=8 
2019-09-11 13:47:06	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:47:16	DELETE FROM specimen_custom_field WHERE id=1 
2019-09-11 13:47:16	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:47:32	DELETE FROM patient_custom_field WHERE id=7 
2019-09-11 13:47:32	DELETE FROM field_order WHERE lab_config_id=1011 AND form_id=1
2019-09-11 13:49:29	UPDATE specimen_session SET count=6 WHERE session_num='20190911'
2019-09-11 13:50:29	UPDATE specimen_session SET count=7 WHERE session_num='20190911'
2019-09-11 13:52:18	update patient_daily set count=2 where datestring='20190911' 
2019-09-11 13:54:09	BEGIN
2019-09-11 13:54:09	COMMIT
2019-09-11 13:54:31	BEGIN
2019-09-11 13:54:31	COMMIT
2019-09-11 13:56:45	UPDATE specimen_session SET count=8 WHERE session_num='20190911'
2019-09-11 13:57:49	UPDATE specimen_session SET count=9 WHERE session_num='20190911'
2019-09-11 14:00:35	UPDATE specimen_session SET count=10 WHERE session_num='20190911'
2019-09-11 14:00:35	update patient_daily set count=3 where datestring='20190911' 
2019-09-11 14:00:56	UPDATE specimen_session SET count=11 WHERE session_num='20190911'
2019-09-11 14:01:18	update patient_daily set count=4 where datestring='20190911' 
2019-09-11 14:02:44	update patient_daily set count=5 where datestring='20190911' 
2019-09-11 14:02:47	UPDATE specimen_session SET count=12 WHERE session_num='20190911'
2019-09-11 14:06:00	UPDATE specimen_session SET count=13 WHERE session_num='20190911'
2019-09-11 14:06:14	update patient_daily set count=6 where datestring='20190911' 
2019-09-11 14:08:59	update patient_daily set count=7 where datestring='20190911' 
2019-09-11 14:12:57	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1011, 3)
2019-09-11 14:13:49	UPDATE specimen_session SET count=14 WHERE session_num='20190911'
2019-09-11 14:13:54	UPDATE specimen_session SET count=15 WHERE session_num='20190911'
2019-09-11 14:15:06	update patient_daily set count=8 where datestring='20190911' 
2019-09-11 14:15:52	update patient_daily set count=9 where datestring='20190911' 
2019-09-11 14:18:33	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1011, 7)
2019-09-11 14:18:33	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1011, 13)
2019-09-11 14:18:33	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1011, 12)
2019-09-11 14:18:33	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1011, 14)
2019-09-11 14:18:33	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1011, 16)
2019-09-11 14:18:33	DELETE FROM lab_config_test_type WHERE lab_config_id=1011 AND test_type_id=3
2019-09-11 14:18:33	DELETE FROM report_disease WHERE lab_config_id=1011 AND test_type_id=2 AND measure_id=2
2019-09-11 14:19:37	UPDATE specimen_session SET count=16 WHERE session_num='20190911'
2019-09-11 14:22:24	UPDATE measure SET name='Virus', range='Pos/Neg', unit='' WHERE measure_id=3
2019-09-11 14:22:24	UPDATE test_type SET name='HBSAG', description='', clinical_data='', test_category_id='4', hide_patient_name='0', prevalence_threshold=70, target_tat=24 WHERE test_type_id=3
2019-09-11 14:23:56	UPDATE specimen_session SET count=17 WHERE session_num='20190911'
2019-09-11 14:24:14	UPDATE specimen_session SET count=18 WHERE session_num='20190911'
2019-09-11 14:24:18	UPDATE specimen_session SET count=19 WHERE session_num='20190911'
2019-09-11 14:26:58	BEGIN
2019-09-11 14:26:58	COMMIT
2019-09-11 14:27:30	update patient_daily set count=10 where datestring='20190911' 
2019-09-11 14:29:46	UPDATE specimen_type SET name='Throat Swab', description='To investigate the presence of certain microbes' WHERE specimen_type_id=10
2019-09-11 14:32:21	UPDATE specimen_type SET name='Aspirate', description='To investigate the presence of Mycobacterium tuberculosis' WHERE specimen_type_id=3
2019-09-11 14:35:11	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1011, 2)
2019-09-11 14:35:11	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1011, 3)
2019-09-11 14:38:55	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1011, 4)
2019-09-11 14:39:36	UPDATE specimen_session SET count=20 WHERE session_num='20190911'
2019-09-11 14:40:18	BEGIN
2019-09-11 14:40:18	COMMIT
2019-09-11 14:40:50	BEGIN
2019-09-11 14:40:50	COMMIT
2019-09-11 14:41:11	UPDATE `test` SET result='Pos,,b0f50007da7f21cfb349afc963ead3b9f0fde639', comments='', user_id=509, ts='2019-09-11 14:41:11' WHERE test_id=7 
2019-09-11 14:41:11	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=7
2019-09-11 14:41:18	UPDATE `test` SET result='Pos,,9495ce76b3c9e3b16e18b774a7be8f34ff1af7f2', comments='', user_id=509, ts='2019-09-11 14:41:18' WHERE test_id=6 
2019-09-11 14:41:18	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=6
2019-09-11 14:42:05	UPDATE specimen_session SET count=21 WHERE session_num='20190911'
2019-09-11 14:42:09	UPDATE specimen_session SET count=22 WHERE session_num='20190911'
2019-09-11 14:42:52	BEGIN
2019-09-11 14:42:52	COMMIT
2019-09-11 14:43:07	UPDATE `test` SET result=',,f7947051a9874f78f7539079220a55b7e54e3993', comments='', user_id=509, ts='2019-09-11 14:43:07' WHERE test_id=8 
2019-09-11 14:43:07	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=8
2019-09-11 14:43:58	UPDATE specimen_session SET count=23 WHERE session_num='20190911'
2019-09-11 14:44:28	BEGIN
2019-09-11 14:44:28	COMMIT
2019-09-11 14:48:11	UPDATE test SET result=',,f7947051a9874f78f7539079220a55b7e54e3993' WHERE test_id=8 
2019-09-11 14:48:11	UPDATE measure SET name='Hb', range=':', unit='' WHERE measure_id=1
2019-09-11 14:48:11	UPDATE test_type SET name='Haemoglobin', description='Blood level', clinical_data='Anaemia', test_category_id='2', hide_patient_name='1', prevalence_threshold=70, target_tat=24 WHERE test_type_id=1
2019-09-11 14:52:07	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1011, 5)
2019-09-11 14:55:44	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1011, 6)
2019-09-11 14:59:14	UPDATE specimen_session SET count=24 WHERE session_num='20190911'
2019-09-11 15:00:15	BEGIN
2019-09-11 15:00:15	COMMIT
2019-09-11 15:00:36	UPDATE `test` SET result='P,,f7947051a9874f78f7539079220a55b7e54e3993', comments='', user_id=509, ts='2019-09-11 15:00:35' WHERE test_id=10 
2019-09-11 15:00:36	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=10
2019-09-11 15:01:20	UPDATE specimen_session SET count=25 WHERE session_num='20190911'
2019-09-11 15:02:02	BEGIN
2019-09-11 15:02:02	COMMIT
2019-09-11 15:02:15	UPDATE `test` SET result='Pos,,bb226f7465538b05ea76e29b72a3d21d9a952991', comments='', user_id=509, ts='2019-09-11 15:02:15' WHERE test_id=11 
2019-09-11 15:02:15	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=11
2019-09-11 15:02:34	UPDATE specimen_session SET count=26 WHERE session_num='20190911'
2019-09-11 15:03:27	BEGIN
2019-09-11 15:03:27	COMMIT
2019-09-11 15:04:18	UPDATE `test` SET result='Pos,,e5d564b129ebb7cb94924d7476fa6937401535ec', comments='', user_id=509, ts='2019-09-11 15:04:18' WHERE test_id=12 
2019-09-11 15:04:19	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=12
2019-09-11 15:04:39	UPDATE specimen_session SET count=27 WHERE session_num='20190911'
2019-09-11 15:05:18	BEGIN
2019-09-11 15:05:18	COMMIT
2019-09-11 15:05:28	UPDATE `test` SET result='Pos,,9495ce76b3c9e3b16e18b774a7be8f34ff1af7f2', comments='', user_id=509, ts='2019-09-11 15:05:28' WHERE test_id=13 
2019-09-11 15:05:28	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=13
2019-09-15 19:08:15	INSERT INTO user_feedback (user_id, rating, comments) VALUES (125, 6, '')
