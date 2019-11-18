USE blis_1010;

2019-09-09 13:46:52	CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `page` varchar(45) NOT NULL default '',
  `comment` varchar(150) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:52	


CREATE TABLE IF NOT EXISTS `custom_field_type` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_type` varchar(45) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:53	


CREATE TABLE IF NOT EXISTS `delay_measures` (
  `User_Id` varchar(50) NOT NULL default '',
  `IP_Address` varchar(16) NOT NULL default '',
  `Latency` int(11) NOT NULL default '0',
  `Recorded_At` datetime NOT NULL default '0000-00-00 00:00:00',
  `Page_Name` varchar(45) default NULL,
  `Request_URI` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:53	


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
2019-09-09 13:46:53	


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
2019-09-09 13:46:53	


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
2019-09-09 13:46:53	


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
2019-09-09 13:46:53	


CREATE TABLE IF NOT EXISTS `lab_config_access` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`lab_config_id`),
  KEY `lab_config_id` (`lab_config_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:54	


CREATE TABLE IF NOT EXISTS `lab_config_specimen_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `specimen_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:54	


CREATE TABLE IF NOT EXISTS `lab_config_test_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `test_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `test_type_id` (`test_type_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:54	


CREATE TABLE IF NOT EXISTS `labtitle_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL,
  `field_options` varchar(200) NOT NULL,
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:54	


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
2019-09-09 13:46:54	


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
2019-09-09 13:46:55	


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
2019-09-09 13:46:55	


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
2019-09-09 13:46:55	


CREATE TABLE IF NOT EXISTS `patient_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` varchar(65474) NOT NULL default '',
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:55	


CREATE TABLE IF NOT EXISTS `patient_daily` (
  `datestring` varchar(45) NOT NULL,
  `count` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:55	


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
2019-09-09 13:46:56	


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
2019-09-09 13:46:56	


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
2019-09-09 13:46:56	


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
2019-09-09 13:46:56	


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
2019-09-09 13:46:57	


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
2019-09-09 13:46:57	


CREATE TABLE IF NOT EXISTS `specimen_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` varchar(65474) NOT NULL default '',
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:57	


CREATE TABLE IF NOT EXISTS `specimen_session` (
  `session_num` varchar(45) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:57	


CREATE TABLE IF NOT EXISTS `specimen_test` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `specimen_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relates tests to the specimens that are compatible with thos';
2019-09-09 13:46:57	


CREATE TABLE IF NOT EXISTS `specimen_type` (
  `specimen_type_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `disabled` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:58	


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
2019-09-09 13:46:58	


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
2019-09-09 13:46:58	


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
2019-09-09 13:46:58	


CREATE TABLE IF NOT EXISTS `test_category` (
  `test_category_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`test_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:59	


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
2019-09-09 13:46:59	


CREATE TABLE IF NOT EXISTS `test_type_measure` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `measure_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:46:59	


CREATE TABLE IF NOT EXISTS `unit` (
  `unit_id` int(11) unsigned NOT NULL auto_increment,
  `unit` varchar(45) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:00	


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
2019-09-09 13:47:00	


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
2019-09-09 13:47:00	


CREATE TABLE IF NOT EXISTS `user_rating` (
  `user_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`,`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:00	


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
2019-09-09 13:47:00	


CREATE TABLE IF NOT EXISTS `worksheet_custom_test` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `width` varchar(45) NOT NULL,
  KEY `worksheet_id` (`worksheet_id`),
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:01	


CREATE TABLE IF NOT EXISTS `worksheet_custom_userfield` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `name` varchar(70) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '10',
  `field_id` int(10) unsigned NOT NULL auto_increment,
  KEY `Primary Key` (`field_id`),
  KEY `worksheet_id` (`worksheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:47:01	


CREATE TABLE IF NOT EXISTS `test_type_costs` (
  `earliest_date_valid` timestamp NOT NULL,
  `test_type_id` int(11) NOT NULL,
  `amount` decimal(10, 2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:01	

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
2019-09-09 13:47:01	

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
2019-09-09 13:47:01	

CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `patient_id` int(11) unsigned NOT NULL,
  `paid_in_full` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:01	

CREATE TABLE IF NOT EXISTS `bills_test_association` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `bill_id` int(11) unsigned NOT NULL,
  `test_id` int(11) unsigned NOT NULL,
  `discount_type` int(4) unsigned NOT NULL default '1000',
  `discount_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:02	

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL auto_increment,
  `amount` decimal(10,2) NOT NULL default '0.00',
  `bill_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:47:02	


CREATE  TABLE IF NOT EXISTS `user_feedback` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NULL ,
  `rating` INT(3) NULL ,
  `comments` VARCHAR(500) NULL ,
  `ts` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) );
2019-09-09 13:47:02	


INSERT INTO `report_config` (`report_id`, `header`, `footer`, `margins`, `p_fields`, `s_fields`, `t_fields`, `p_custom_fields`, `s_custom_fields`,`test_type_id`,`title`,`landscape`,`row_items`,`show_border`,`show_result_border`,`result_border_horizontal`,`result_border_vertical`) VALUES 
('1', 'Patient Report', '', '2,0,10,0', '1,1,0,1,1,0,1,0,0,0,0,0,0', '1,0,0,0,0,1,1', '1,1,1,0,0,0,0,1,0,1,1,1', '', '', '0', 'Patient Report', 0, 1, 1, 1, 1, 1);
2019-09-09 13:47:02	

INSERT INTO `report_config` (`report_id`, `header`, `footer`, `margins`, `p_fields`, `s_fields`, `t_fields`, `p_custom_fields`, `s_custom_fields`) VALUES 
('2', 'Specimen Report', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('3', 'Test Records', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('4', 'Daily Log - Specimens', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('5', 'Worksheet', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('6', 'Daily Log - Patients', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', '');
2019-09-09 13:47:02	

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
2019-09-09 13:47:02	

INSERT INTO `test_category` (`test_category_id`, `name`) VALUES(1, 'HIV');
2019-09-09 13:47:02	


CREATE TABLE `field_order` (
  `id` int(11) NOT NULL auto_increment,
  `lab_config_id` int(11) unsigned default NULL,
  `form_id` int(11) default NULL,
  `field_order` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
2019-09-09 13:47:02	

alter table removal_record add category varchar(20) default "test";
2019-09-09 13:47:03	

ALTER TABLE specimen ADD COLUMN referred_from_name varchar(20);
2019-09-09 13:47:03	

CREATE TABLE IF NOT EXISTS sites (
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255),
  lab_id INT,
  District VARCHAR(40),
 Region VARCHAR(40),
  PRIMARY KEY (id)
);
2019-09-09 13:47:03	

ALTER TABLE specimen ADD COLUMN site_id INT;
2019-09-09 13:47:03	

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
2019-09-09 13:47:04	

ALTER TABLE test_type ADD COLUMN is_reporting_enabled BOOLEAN DEFAULT 0;
2019-09-09 13:47:04	
;
2019-09-09 15:51:30	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 1)
2019-09-09 15:51:30	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 2)
2019-09-09 15:53:25	INSERT INTO user_feedback (user_id, rating, comments) VALUES (508, 6, '')
2019-09-09 15:56:02	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 3)
2019-09-09 15:58:32	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 4)
2019-09-09 16:03:29	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 5)
2019-09-09 16:20:56	INSERT INTO user_feedback (user_id, rating, comments) VALUES (508, 6, '')
2019-09-09 16:33:32	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 6)
2019-09-09 16:35:22	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 7)
2019-09-09 16:36:40	INSERT INTO user_feedback (user_id, rating, comments) VALUES (508, 6, '')
2019-09-09 16:37:16	INSERT INTO user_feedback (user_id, rating, comments) VALUES (508, 6, '')
2019-09-09 16:49:54	UPDATE specimen_type SET name='Stool', description='' WHERE specimen_type_id=7
2019-09-09 16:50:14	UPDATE specimen_type SET name='Stool', description='' WHERE specimen_type_id=7
2019-09-09 16:52:40	UPDATE specimen_type SET name='Nasal Swabs', description='' WHERE specimen_type_id=6
2019-09-09 16:52:41	UPDATE specimen_type SET name='Nasal Swabs', description='' WHERE specimen_type_id=6
2019-09-09 16:52:41	UPDATE specimen_type SET name='Nasal Swabs', description='' WHERE specimen_type_id=6
2019-09-09 16:52:41	UPDATE specimen_type SET name='Nasal Swabs', description='' WHERE specimen_type_id=6
2019-09-09 16:52:41	UPDATE specimen_type SET name='Nasal Swabs', description='' WHERE specimen_type_id=6
2019-09-09 16:52:41	UPDATE specimen_type SET name='Nasal Swabs', description='' WHERE specimen_type_id=6
2019-09-09 16:52:41	UPDATE specimen_type SET name='Nasal Swabs', description='' WHERE specimen_type_id=6
2019-09-09 16:52:42	UPDATE specimen_type SET name='Nasal Swabs', description='' WHERE specimen_type_id=6
2019-09-09 16:57:21	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 8)
2019-09-09 17:02:22	INSERT INTO user_feedback (user_id, rating, comments) VALUES (508, 6, '')
2019-09-10 15:20:09	DELETE FROM field_order WHERE lab_config_id=1010 AND form_id=1
2019-09-10 15:20:09	DELETE FROM field_order WHERE lab_config_id=1010 AND form_id=2
2019-09-10 15:42:27	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1010, 10)
2019-09-10 15:42:27	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1010, 7)
2019-09-10 15:42:27	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=0 AND measure_id=0
2019-09-10 15:42:27	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=1 AND measure_id=1
2019-09-10 15:42:27	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=2 AND measure_id=2
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=3 AND measure_id=3
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=4 AND measure_id=4
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=5 AND measure_id=5
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=6
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=7
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=8
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=9
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=10
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=11
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=12
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=13
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=7 AND measure_id=14
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=7 AND measure_id=15
2019-09-10 15:42:28	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=16
2019-09-10 15:42:29	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=17
2019-09-10 15:42:29	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=18
2019-09-10 15:42:29	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=19
2019-09-10 15:42:29	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=20
2019-09-10 15:42:29	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=21
2019-09-10 15:42:29	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=22
2019-09-10 15:42:29	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=23
2019-09-10 16:07:55	UPDATE specimen_session SET count=2 WHERE session_num='20190910'
2019-09-10 16:07:55	UPDATE specimen_session SET count=3 WHERE session_num='20190910'
2019-09-10 16:07:55	UPDATE specimen_session SET count=4 WHERE session_num='20190910'
2019-09-10 16:07:55	UPDATE specimen_session SET count=5 WHERE session_num='20190910'
2019-09-10 16:25:58	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=0 AND measure_id=0
2019-09-10 16:25:58	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=1 AND measure_id=1
2019-09-10 16:25:58	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=2 AND measure_id=2
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=5 AND measure_id=5
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=6
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=7
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=8
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=9
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=10
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=11
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=12
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=6 AND measure_id=13
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=7 AND measure_id=14
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=7 AND measure_id=15
2019-09-10 16:25:59	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=16
2019-09-10 16:26:00	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=20
2019-09-10 16:26:00	DELETE FROM report_disease WHERE lab_config_id=1010 AND test_type_id=8 AND measure_id=21
2019-09-10 16:27:49	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1010, 2)
2019-09-10 16:27:49	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1010, 9)
2019-09-10 16:27:49	INSERT INTO lab_config_specimen_type(lab_config_id, specimen_type_id) VALUES (1010, 1)
2019-09-10 16:27:49	DELETE FROM lab_config_specimen_type WHERE lab_config_id=1010 AND specimen_type_id=10
2019-09-10 16:27:49	DELETE FROM lab_config_specimen_type WHERE lab_config_id=1010 AND specimen_type_id=7
2019-09-10 16:30:06	UPDATE specimen_session SET count=6 WHERE session_num='20190910'
2019-09-10 16:31:23	update patient_daily set count=2 where datestring='20190910' 
2019-09-10 16:34:00	BEGIN
2019-09-10 16:34:00	COMMIT
2019-09-10 16:37:49	UPDATE `test` SET result='7.5,,1090c118f94e61297c1dda3ae1ecf55b5e5ab9e3', comments='', user_id=508, ts='2019-09-10 16:37:49' WHERE test_id=1 
2019-09-10 16:37:49	UPDATE `test` SET result='9.2,,1090c118f94e61297c1dda3ae1ecf55b5e5ab9e3', comments='', user_id=508, ts='2019-09-10 16:37:49' WHERE test_id=2 
2019-09-10 16:37:50	UPDATE `test` SET result='9.2,,1090c118f94e61297c1dda3ae1ecf55b5e5ab9e3', comments='', user_id=508, ts='2019-09-10 16:37:50' WHERE test_id=3 
2019-09-10 16:37:50	UPDATE `test` SET result='positive,,1090c118f94e61297c1dda3ae1ecf55b5e5ab9e3', comments='', user_id=508, ts='2019-09-10 16:37:50' WHERE test_id=4 
2019-09-10 16:37:50	UPDATE `test` SET result='Positive,,1090c118f94e61297c1dda3ae1ecf55b5e5ab9e3', comments='', user_id=508, ts='2019-09-10 16:37:50' WHERE test_id=5 
2019-09-10 16:37:50	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=1
2019-09-11 13:14:51	UPDATE lab_config_settings SET flag1 = 20 WHERE id = 2
2019-09-11 13:15:05	UPDATE lab_config_settings SET flag1 = 20 WHERE id = 2
2019-09-11 13:17:40	UPDATE specimen_session SET count=2 WHERE session_num='20190911'
2019-09-11 13:20:48	update patient_daily set count=2 where datestring='20190911' 
2019-09-11 13:21:26	BEGIN
2019-09-11 13:21:26	COMMIT
2019-09-11 13:21:26	BEGIN
2019-09-11 13:21:26	COMMIT
2019-09-11 13:21:27	BEGIN
2019-09-11 13:21:27	COMMIT
2019-09-11 13:26:03	UPDATE specimen_session SET count=3 WHERE session_num='20190911'
2019-09-11 13:27:10	BEGIN
2019-09-11 13:27:11	COMMIT
2019-09-11 13:27:11	update patient_daily set count=3 where datestring='20190911' 
2019-09-11 13:27:21	BEGIN
2019-09-11 13:27:21	COMMIT
2019-09-11 13:27:31	BEGIN
2019-09-11 13:27:31	COMMIT
2019-09-11 13:28:25	BEGIN
2019-09-11 13:28:25	COMMIT
2019-09-11 13:30:53	UPDATE specimen_session SET count=4 WHERE session_num='20190911'
2019-09-11 13:31:06	DELETE FROM field_order WHERE lab_config_id=1010 AND form_id=1
2019-09-11 13:31:06	DELETE FROM field_order WHERE lab_config_id=1010 AND form_id=2
2019-09-11 13:32:34	update patient_daily set count=4 where datestring='20190911' 
2019-09-11 13:33:20	UPDATE specimen_session SET count=5 WHERE session_num='20190911'
2019-09-11 13:34:34	BEGIN
2019-09-11 13:34:34	COMMIT
2019-09-11 13:34:34	BEGIN
2019-09-11 13:34:34	COMMIT
2019-09-11 13:34:41	BEGIN
2019-09-11 13:34:41	COMMIT
2019-09-11 13:34:52	BEGIN
2019-09-11 13:34:52	COMMIT
2019-09-11 13:35:02	BEGIN
2019-09-11 13:35:02	COMMIT
2019-09-11 13:36:13	UPDATE specimen_session SET count=6 WHERE session_num='20190911'
2019-09-11 13:36:47	UPDATE specimen_session SET count=7 WHERE session_num='20190911'
2019-09-11 13:38:11	update patient_daily set count=5 where datestring='20190911' 
2019-09-11 13:38:27	update patient_daily set count=6 where datestring='20190911' 
2019-09-11 13:38:47	BEGIN
2019-09-11 13:38:47	COMMIT
2019-09-11 13:40:03	BEGIN
2019-09-11 13:40:03	COMMIT
2019-09-11 13:40:14	BEGIN
2019-09-11 13:40:14	COMMIT
2019-09-11 13:40:24	BEGIN
2019-09-11 13:40:24	COMMIT
2019-09-11 13:40:35	BEGIN
2019-09-11 13:40:35	COMMIT
2019-09-11 13:40:45	BEGIN
2019-09-11 13:40:45	COMMIT
2019-09-11 13:40:56	BEGIN
2019-09-11 13:40:56	COMMIT
2019-09-11 13:41:07	BEGIN
2019-09-11 13:41:07	COMMIT
2019-09-11 13:41:17	BEGIN
2019-09-11 13:41:17	COMMIT
2019-09-11 13:41:28	BEGIN
2019-09-11 13:41:28	COMMIT
2019-09-11 13:41:38	BEGIN
2019-09-11 13:41:38	COMMIT
2019-09-11 13:42:03	BEGIN
2019-09-11 13:42:03	COMMIT
2019-09-11 13:42:14	BEGIN
2019-09-11 13:42:14	COMMIT
2019-09-11 13:42:24	BEGIN
2019-09-11 13:42:24	COMMIT
2019-09-11 13:42:35	BEGIN
2019-09-11 13:42:35	COMMIT
2019-09-11 13:42:45	BEGIN
2019-09-11 13:42:45	COMMIT
2019-09-11 13:42:56	BEGIN
2019-09-11 13:42:56	COMMIT
2019-09-11 13:43:06	BEGIN
2019-09-11 13:43:06	COMMIT
2019-09-11 13:43:17	BEGIN
2019-09-11 13:43:17	COMMIT
2019-09-11 13:43:27	BEGIN
2019-09-11 13:43:27	COMMIT
2019-09-11 13:43:38	BEGIN
2019-09-11 13:43:38	COMMIT
2019-09-11 13:43:48	BEGIN
2019-09-11 13:43:48	COMMIT
2019-09-11 13:43:59	BEGIN
2019-09-11 13:43:59	COMMIT
2019-09-11 13:44:09	BEGIN
2019-09-11 13:44:09	COMMIT
2019-09-11 13:44:20	BEGIN
2019-09-11 13:44:20	COMMIT
2019-09-11 13:44:30	BEGIN
2019-09-11 13:44:30	COMMIT
2019-09-11 13:44:41	BEGIN
2019-09-11 13:44:41	COMMIT
2019-09-11 13:44:51	BEGIN
2019-09-11 13:44:51	COMMIT
2019-09-11 13:45:02	BEGIN
2019-09-11 13:45:02	COMMIT
2019-09-11 13:45:12	BEGIN
2019-09-11 13:45:12	COMMIT
2019-09-11 13:45:23	BEGIN
2019-09-11 13:45:23	COMMIT
2019-09-11 13:45:33	BEGIN
2019-09-11 13:45:33	COMMIT
2019-09-11 13:45:44	BEGIN
2019-09-11 13:45:44	COMMIT
2019-09-11 13:45:54	BEGIN
2019-09-11 13:45:54	COMMIT
2019-09-11 13:46:05	BEGIN
2019-09-11 13:46:05	COMMIT
2019-09-11 13:46:15	BEGIN
2019-09-11 13:46:15	COMMIT
2019-09-11 13:46:26	BEGIN
2019-09-11 13:46:26	COMMIT
2019-09-11 13:46:36	BEGIN
2019-09-11 13:46:36	COMMIT
2019-09-11 13:46:46	BEGIN
2019-09-11 13:46:47	COMMIT
2019-09-11 13:46:57	BEGIN
2019-09-11 13:46:57	COMMIT
2019-09-11 13:47:07	BEGIN
2019-09-11 13:47:07	COMMIT
2019-09-11 13:47:18	BEGIN
2019-09-11 13:47:18	COMMIT
2019-09-11 13:47:28	BEGIN
2019-09-11 13:47:28	COMMIT
2019-09-11 13:47:38	BEGIN
2019-09-11 13:47:38	COMMIT
2019-09-11 13:47:49	BEGIN
2019-09-11 13:47:49	COMMIT
2019-09-11 13:47:59	BEGIN
2019-09-11 13:47:59	COMMIT
2019-09-11 13:48:10	BEGIN
2019-09-11 13:48:10	COMMIT
2019-09-11 13:48:20	BEGIN
2019-09-11 13:48:20	COMMIT
2019-09-11 13:48:30	BEGIN
2019-09-11 13:48:31	COMMIT
2019-09-11 13:48:41	BEGIN
2019-09-11 13:48:41	COMMIT
2019-09-11 13:48:51	BEGIN
2019-09-11 13:48:51	COMMIT
2019-09-11 13:49:02	BEGIN
2019-09-11 13:49:02	COMMIT
2019-09-11 13:49:12	BEGIN
2019-09-11 13:49:12	COMMIT
2019-09-11 13:49:23	BEGIN
2019-09-11 13:49:23	COMMIT
2019-09-11 13:49:34	BEGIN
2019-09-11 13:49:34	COMMIT
2019-09-11 13:49:44	BEGIN
2019-09-11 13:49:44	COMMIT
2019-09-11 13:49:54	BEGIN
2019-09-11 13:49:54	COMMIT
2019-09-11 13:50:04	BEGIN
2019-09-11 13:50:05	COMMIT
2019-09-11 13:50:15	BEGIN
2019-09-11 13:50:15	COMMIT
2019-09-11 13:50:26	BEGIN
2019-09-11 13:50:26	COMMIT
2019-09-11 13:50:36	BEGIN
2019-09-11 13:50:36	COMMIT
2019-09-11 13:50:47	BEGIN
2019-09-11 13:50:47	COMMIT
2019-09-11 13:50:57	BEGIN
2019-09-11 13:50:57	COMMIT
2019-09-11 13:54:18	BEGIN
2019-09-11 13:54:18	COMMIT
2019-09-11 13:54:28	BEGIN
2019-09-11 13:54:28	COMMIT
2019-09-11 13:54:45	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 9)
2019-09-11 13:55:35	UPDATE specimen_session SET count=8 WHERE session_num='20190911'
2019-09-11 13:57:22	update patient_daily set count=7 where datestring='20190911' 
2019-09-11 13:58:33	BEGIN
2019-09-11 13:58:34	COMMIT
2019-09-11 13:59:41	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 10)
2019-09-11 13:59:53	UPDATE specimen_session SET count=9 WHERE session_num='20190911'
2019-09-11 14:00:19	UPDATE measure SET name='Colour', range='$freetext$$', unit='' WHERE measure_id=28
2019-09-11 14:00:19	UPDATE measure SET name='Appearance', range='$freetext$$', unit='' WHERE measure_id=29
2019-09-11 14:00:19	UPDATE measure SET name='Protozoan', range='Seen/Not Seen', unit='' WHERE measure_id=30
2019-09-11 14:00:19	UPDATE test_type SET name='Stool Analysis', description='To investigate the presence of protozoan in patient stool', clinical_data='Worm Infestation', test_category_id='6', hide_patient_name='0', prevalence_threshold=70, target_tat=1 WHERE test_type_id=10
2019-09-11 14:01:13	UPDATE specimen_session SET count=10 WHERE session_num='20190911'
2019-09-11 14:01:27	update patient_daily set count=8 where datestring='20190911' 
2019-09-11 14:02:11	update patient_daily set count=9 where datestring='20190911' 
2019-09-11 14:02:52	BEGIN
2019-09-11 14:02:52	COMMIT
2019-09-11 14:02:55	BEGIN
2019-09-11 14:02:56	COMMIT
2019-09-11 14:03:58	UPDATE specimen_session SET count=11 WHERE session_num='20190911'
2019-09-11 14:04:43	UPDATE patient SET name='Paul Moses', surr_id='00010', addl_id='undefined', sex='M', age=0, partial_dob='2005' WHERE patient_id=11
2019-09-11 14:06:21	INSERT INTO user_feedback (user_id, rating, comments) VALUES (508, 1, '')
2019-09-11 14:10:29	UPDATE specimen_session SET count=12 WHERE session_num='20190911'
2019-09-11 14:11:56	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 11)
2019-09-11 14:11:57	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1010, 12)
2019-09-11 14:17:20	UPDATE `test` SET result='Not Detected,Not Detected,,,,7d6c2dfe9068b1958dcadbdc0e343f39ef359437', comments='MTB :Not Detected, Rif:Not Detected', user_id=508, ts='2019-09-11 14:17:20' WHERE test_id=150 
2019-09-11 14:17:20	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=82
2019-09-11 14:17:49	UPDATE `test` SET result='64.9,3.21,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=7 
2019-09-11 14:17:50	UPDATE `test` SET result='54.1,0.99,87.7,23.4,15.2,32.1,69.7,34.7,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=8 
2019-09-11 14:17:50	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=4
2019-09-11 14:18:50	UPDATE `test` SET result='12.9,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=9 
2019-09-11 14:18:50	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=7
2019-09-11 14:21:11	UPDATE `test` SET result='6.0,Negative,Negative,Negative,[$]Normal[\/$],[$]+++250WBC/ul[\/$],Negative,Negative,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=6 
2019-09-11 14:21:11	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=2
2019-09-11 14:21:11	UPDATE `test` SET result='6.0,Negative,Negative,Negative,[$]Normal[\/$],[$]+++250WBC/ul[\/$],Negative,Negative,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=6 
2019-09-11 14:21:11	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=2
2019-09-11 14:21:11	UPDATE `test` SET result='6.0,Negative,Negative,Negative,[$]Normal[\/$],[$]+++250WBC/ul[\/$],Negative,Negative,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=6 
2019-09-11 14:21:11	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=2
2019-09-11 14:21:12	UPDATE `test` SET result='6.0,Negative,Negative,Negative,[$]Normal[\/$],[$]+++250WBC/ul[\/$],Negative,Negative,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=6 
2019-09-11 14:21:12	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=2
2019-09-11 14:22:14	UPDATE `test` SET result='10,fbd3c9d60408805664331f7bef9d36bddf6a461e', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=52 
2019-09-11 14:22:49	UPDATE `test` SET result='[$]Brown[\/$],[$]Soft[\/$],Seen,9426ae7ed42fd274d824631a7ac97c6b7e36658b', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=152 
2019-09-11 14:22:50	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=84
2019-09-11 14:23:59	UPDATE `test` SET result='6.8,d40d0efd30968374a1089db5db5934ccd1ade9d8', comments='Normal', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=15 
2019-09-11 14:23:59	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=12
2019-09-11 14:24:01	UPDATE `test` SET result='6.8,d40d0efd30968374a1089db5db5934ccd1ade9d8', comments='Normal', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=15 
2019-09-11 14:24:01	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=12
2019-09-11 14:24:29	UPDATE `test` SET result='Positive,d40d0efd30968374a1089db5db5934ccd1ade9d8', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=10 
2019-09-11 14:24:29	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=8
2019-09-11 14:25:08	UPDATE `test` SET result='10.1,5bfacefc86e99abdd677fcde133d2e1c7159caaa', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=14 
2019-09-11 14:25:08	UPDATE `test` SET result='5.5,5bfacefc86e99abdd677fcde133d2e1c7159caaa', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=13 
2019-09-11 14:25:08	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=11
2019-09-11 14:25:57	UPDATE `test` SET result='3,fbd3c9d60408805664331f7bef9d36bddf6a461e', comments='Very anemic', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=63 
2019-09-11 14:25:58	UPDATE `test` SET result='10,fbd3c9d60408805664331f7bef9d36bddf6a461e', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=62 
2019-09-11 14:25:58	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=37
2019-09-11 14:30:03	UPDATE `test` SET result='Positive,d40d0efd30968374a1089db5db5934ccd1ade9d8', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=11 
2019-09-11 14:30:03	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=9
2019-09-11 14:35:39	UPDATE test SET result=',1090c118f94e61297c1dda3ae1ecf55b5e5ab9e3', comments='9.55', verified_by=508, date_verified='2019-09-11 14:35:39' WHERE test_id=3
2019-09-11 14:35:40	UPDATE test SET result=',f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='4.43', verified_by=508, date_verified='2019-09-11 14:35:39' WHERE test_id=9
2019-09-11 14:37:09	UPDATE `test` SET result='47,7.5,bc9f95ea5df8a9524522daaa71952915065799d9', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=17 
2019-09-11 14:37:09	UPDATE `test` SET result='51.0,3.0,84.5,24.3,20.5,31.2,44.5,15.3,bc9f95ea5df8a9524522daaa71952915065799d9', comments='', user_id=508, ts='2019-09-11 00:00:00' WHERE test_id=18 
2019-09-11 14:37:09	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=14
2019-09-11 14:37:39	UPDATE test SET result=',1090c118f94e61297c1dda3ae1ecf55b5e5ab9e3', comments='6.7', verified_by=508, date_verified='2019-09-11 14:37:39' WHERE test_id=1
2019-09-11 14:37:39	UPDATE test SET result=',5bfacefc86e99abdd677fcde133d2e1c7159caaa', comments='8.8', verified_by=508, date_verified='2019-09-11 14:37:39' WHERE test_id=13
2019-09-11 14:37:39	UPDATE test SET result=',d40d0efd30968374a1089db5db5934ccd1ade9d8', comments='5.9', verified_by=508, date_verified='2019-09-11 14:37:39' WHERE test_id=15
2019-09-11 14:37:39	UPDATE test SET result=',fbd3c9d60408805664331f7bef9d36bddf6a461e', comments='8.8', verified_by=508, date_verified='2019-09-11 14:37:39' WHERE test_id=52
2019-09-11 14:37:39	UPDATE test SET result=',fbd3c9d60408805664331f7bef9d36bddf6a461e', comments='9.4', verified_by=508, date_verified='2019-09-11 14:37:39' WHERE test_id=62
2019-09-11 14:42:49	UPDATE test SET result=',,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='87.7', verified_by=508, date_verified='2019-09-11 14:42:49' WHERE test_id=7
2019-09-11 14:42:49	UPDATE test SET result=',,bc9f95ea5df8a9524522daaa71952915065799d9', comments='66.5', verified_by=508, date_verified='2019-09-11 14:42:49' WHERE test_id=17
2019-09-11 14:46:21	UPDATE test SET result=',,,,,,,,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='', verified_by=508, date_verified='2019-09-11 14:46:21' WHERE test_id=8
2019-09-11 14:46:21	UPDATE test SET result=',,,,,,,,bc9f95ea5df8a9524522daaa71952915065799d9', comments='', verified_by=508, date_verified='2019-09-11 14:46:21' WHERE test_id=18
2019-09-11 14:46:54	UPDATE test SET result='positive,1090c118f94e61297c1dda3ae1ecf55b5e5ab9e3', comments='', verified_by=508, date_verified='2019-09-11 14:46:54' WHERE test_id=4
2019-09-11 14:47:32	UPDATE test SET result='Not Detected,Not Detected,,,7d6c2dfe9068b1958dcadbdc0e343f39ef359437', comments='MTB :Not Detected, Rif:Not Detected', verified_by=508, date_verified='2019-09-11 14:47:32' WHERE test_id=150
2019-09-11 14:48:07	UPDATE test SET result='Positive,1090c118f94e61297c1dda3ae1ecf55b5e5ab9e3', comments='', verified_by=508, date_verified='2019-09-11 14:48:07' WHERE test_id=5
2019-09-11 14:48:07	UPDATE test SET verified_by=508, date_verified='2019-09-11 14:48:07' WHERE test_id=10
2019-09-11 14:48:07	UPDATE test SET verified_by=508, date_verified='2019-09-11 14:48:07' WHERE test_id=11
2019-09-11 14:48:59	UPDATE test SET result=',,Seen,9426ae7ed42fd274d824631a7ac97c6b7e36658b', comments='soft', verified_by=508, date_verified='2019-09-11 14:48:59' WHERE test_id=152
2019-09-13 12:04:40	BEGIN
2019-09-13 12:04:40	COMMIT
2019-09-13 12:06:34	UPDATE test SET result='6.0,Negative,Negative,Negative,[$]Normal[/$],[$]+++250WBCul[/$],Negative,Negative,,f3abffe41b12442695fbe98fb0171e2e92f70ac8', comments='', verified_by=508, date_verified='2019-09-13 12:06:34' WHERE test_id=6
2019-09-15 17:39:37	INSERT INTO user_feedback (user_id, rating, comments) VALUES (508, 6, '')
2019-09-15 18:03:34	INSERT INTO user_feedback (user_id, rating, comments) VALUES (125, 6, '')
2019-09-15 18:10:07	INSERT INTO user_feedback (user_id, rating, comments) VALUES (508, 6, '')
2019-09-15 18:14:18	INSERT INTO user_feedback (user_id, rating, comments) VALUES (125, 6, '')
2019-09-15 18:36:09	INSERT INTO user_feedback (user_id, rating, comments) VALUES (508, 6, '')
