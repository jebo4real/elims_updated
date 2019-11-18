USE blis_1007;

2019-09-08 15:07:12	CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `page` varchar(45) NOT NULL default '',
  `comment` varchar(150) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:12	


CREATE TABLE IF NOT EXISTS `custom_field_type` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_type` varchar(45) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:12	


CREATE TABLE IF NOT EXISTS `delay_measures` (
  `User_Id` varchar(50) NOT NULL default '',
  `IP_Address` varchar(16) NOT NULL default '',
  `Latency` int(11) NOT NULL default '0',
  `Recorded_At` datetime NOT NULL default '0000-00-00 00:00:00',
  `Page_Name` varchar(45) default NULL,
  `Request_URI` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:12	


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
2019-09-08 15:07:13	


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
2019-09-08 15:07:13	


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
2019-09-08 15:07:13	


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
2019-09-08 15:07:13	


CREATE TABLE IF NOT EXISTS `lab_config_access` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`lab_config_id`),
  KEY `lab_config_id` (`lab_config_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:13	


CREATE TABLE IF NOT EXISTS `lab_config_specimen_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `specimen_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:13	


CREATE TABLE IF NOT EXISTS `lab_config_test_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `test_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `test_type_id` (`test_type_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:14	


CREATE TABLE IF NOT EXISTS `labtitle_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL,
  `field_options` varchar(200) NOT NULL,
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:14	


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
2019-09-08 15:07:14	


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
2019-09-08 15:07:14	


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
2019-09-08 15:07:14	


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
2019-09-08 15:07:14	


CREATE TABLE IF NOT EXISTS `patient_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` varchar(65474) NOT NULL default '',
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:15	


CREATE TABLE IF NOT EXISTS `patient_daily` (
  `datestring` varchar(45) NOT NULL,
  `count` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:15	


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
2019-09-08 15:07:15	


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
2019-09-08 15:07:15	


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
2019-09-08 15:07:15	


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
2019-09-08 15:07:15	


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
2019-09-08 15:07:16	


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
2019-09-08 15:07:16	


CREATE TABLE IF NOT EXISTS `specimen_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` varchar(65474) NOT NULL default '',
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:16	


CREATE TABLE IF NOT EXISTS `specimen_session` (
  `session_num` varchar(45) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:16	


CREATE TABLE IF NOT EXISTS `specimen_test` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `specimen_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relates tests to the specimens that are compatible with thos';
2019-09-08 15:07:16	


CREATE TABLE IF NOT EXISTS `specimen_type` (
  `specimen_type_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `disabled` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:16	


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
2019-09-08 15:07:17	


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
2019-09-08 15:07:17	


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
2019-09-08 15:07:17	


CREATE TABLE IF NOT EXISTS `test_category` (
  `test_category_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`test_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:17	


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
2019-09-08 15:07:17	


CREATE TABLE IF NOT EXISTS `test_type_measure` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `measure_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:18	


CREATE TABLE IF NOT EXISTS `unit` (
  `unit_id` int(11) unsigned NOT NULL auto_increment,
  `unit` varchar(45) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:18	


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
2019-09-08 15:07:18	


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
2019-09-08 15:07:18	


CREATE TABLE IF NOT EXISTS `user_rating` (
  `user_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`,`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:18	


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
2019-09-08 15:07:19	


CREATE TABLE IF NOT EXISTS `worksheet_custom_test` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `width` varchar(45) NOT NULL,
  KEY `worksheet_id` (`worksheet_id`),
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:19	


CREATE TABLE IF NOT EXISTS `worksheet_custom_userfield` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `name` varchar(70) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '10',
  `field_id` int(10) unsigned NOT NULL auto_increment,
  KEY `Primary Key` (`field_id`),
  KEY `worksheet_id` (`worksheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-08 15:07:19	


CREATE TABLE IF NOT EXISTS `test_type_costs` (
  `earliest_date_valid` timestamp NOT NULL,
  `test_type_id` int(11) NOT NULL,
  `amount` decimal(10, 2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-08 15:07:20	

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
2019-09-08 15:07:20	

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
2019-09-08 15:07:20	

CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `patient_id` int(11) unsigned NOT NULL,
  `paid_in_full` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-08 15:07:20	

CREATE TABLE IF NOT EXISTS `bills_test_association` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `bill_id` int(11) unsigned NOT NULL,
  `test_id` int(11) unsigned NOT NULL,
  `discount_type` int(4) unsigned NOT NULL default '1000',
  `discount_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-08 15:07:20	

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL auto_increment,
  `amount` decimal(10,2) NOT NULL default '0.00',
  `bill_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-08 15:07:20	


CREATE  TABLE IF NOT EXISTS `user_feedback` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NULL ,
  `rating` INT(3) NULL ,
  `comments` VARCHAR(500) NULL ,
  `ts` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) );
2019-09-08 15:07:20	


INSERT INTO `report_config` (`report_id`, `header`, `footer`, `margins`, `p_fields`, `s_fields`, `t_fields`, `p_custom_fields`, `s_custom_fields`,`test_type_id`,`title`,`landscape`,`row_items`,`show_border`,`show_result_border`,`result_border_horizontal`,`result_border_vertical`) VALUES 
('1', 'Patient Report', '', '2,0,10,0', '1,1,0,1,1,0,1,0,0,0,0,0,0', '1,0,0,0,0,1,1', '1,1,1,0,0,0,0,1,0,1,1,1', '', '', '0', 'Patient Report', 0, 1, 1, 1, 1, 1);
2019-09-08 15:07:20	

INSERT INTO `report_config` (`report_id`, `header`, `footer`, `margins`, `p_fields`, `s_fields`, `t_fields`, `p_custom_fields`, `s_custom_fields`) VALUES 
('2', 'Specimen Report', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('3', 'Test Records', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('4', 'Daily Log - Specimens', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('5', 'Worksheet', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('6', 'Daily Log - Patients', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', '');
2019-09-08 15:07:21	

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
2019-09-08 15:07:21	

INSERT INTO `test_category` (`test_category_id`, `name`) VALUES(1, 'HIV');
2019-09-08 15:07:21	


CREATE TABLE `field_order` (
  `id` int(11) NOT NULL auto_increment,
  `lab_config_id` int(11) unsigned default NULL,
  `form_id` int(11) default NULL,
  `field_order` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
2019-09-08 15:07:21	

alter table removal_record add category varchar(20) default "test";
2019-09-08 15:07:21	

ALTER TABLE specimen ADD COLUMN referred_from_name varchar(20);
2019-09-08 15:07:21	

CREATE TABLE IF NOT EXISTS sites (
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255),
  lab_id INT,
  District VARCHAR(40),
 Region VARCHAR(40),
  PRIMARY KEY (id)
);
2019-09-08 15:07:22	

ALTER TABLE specimen ADD COLUMN site_id INT;
2019-09-08 15:07:22	

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
2019-09-08 15:07:22	

ALTER TABLE test_type ADD COLUMN is_reporting_enabled BOOLEAN DEFAULT 0;
2019-09-08 15:07:22	
;
2019-09-08 15:12:03	DELETE FROM field_order WHERE lab_config_id=1007 AND form_id=1
2019-09-08 15:12:03	DELETE FROM field_order WHERE lab_config_id=1007 AND form_id=2
2019-09-08 15:12:53	INSERT INTO user_feedback (user_id, rating, comments) VALUES (505, 6, '')
2019-09-08 15:25:52	INSERT INTO user_feedback (user_id, rating, comments) VALUES (505, 6, '')
2019-09-08 20:14:13	INSERT INTO user_feedback (user_id, rating, comments) VALUES (505, 6, '')
2019-09-09 15:50:53	UPDATE specimen_type SET name='whole blood', description='To know the blood level of the patient ' WHERE specimen_type_id=1
2019-09-09 15:53:15	UPDATE specimen_type SET name='whole blood', description='To know the blood level of the patient ' WHERE specimen_type_id=1
2019-09-09 15:55:18	UPDATE specimen_type SET name='whole blood', description='To know the blood group of the patient' WHERE specimen_type_id=1
2019-09-09 15:59:56	UPDATE specimen_type SET name='Whole Blood', description='To know the blood group of the patient' WHERE specimen_type_id=1
2019-09-09 16:06:11	UPDATE specimen_type SET name='Stool', description='To check for cyst,oval or protozoa' WHERE specimen_type_id=5
2019-09-09 16:16:19	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1007, 1)
2019-09-09 16:22:18	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1007, 2)
2019-09-09 16:30:48	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1007, 3)
2019-09-09 16:35:38	INSERT INTO user_feedback (user_id, rating, comments) VALUES (505, 6, '')
2019-09-09 16:59:40	INSERT INTO user_feedback (user_id, rating, comments) VALUES (505, 6, '')
2019-09-10 06:42:45	INSERT INTO user_feedback (user_id, rating, comments) VALUES (505, 6, '')
2019-09-10 14:24:40	INSERT INTO user_feedback (user_id, rating, comments) VALUES (125, 6, '')
2019-09-10 15:23:52	DELETE FROM field_order WHERE lab_config_id=1007 AND form_id=1
2019-09-10 15:23:52	DELETE FROM field_order WHERE lab_config_id=1007 AND form_id=2
2019-09-10 15:40:48	BEGIN
2019-09-10 15:40:48	COMMIT
2019-09-10 15:40:48	BEGIN
2019-09-10 15:40:48	COMMIT
2019-09-10 15:41:56	UPDATE specimen_session SET count=2 WHERE session_num='20190910'
2019-09-10 15:44:22	update patient_daily set count=2 where datestring='20190910' 
2019-09-10 15:45:31	BEGIN
2019-09-10 15:45:31	COMMIT
2019-09-10 15:46:11	UPDATE specimen_session SET count=3 WHERE session_num='20190910'
2019-09-10 15:49:14	update patient_daily set count=3 where datestring='20190910' 
2019-09-10 15:50:45	BEGIN
2019-09-10 15:50:45	COMMIT
2019-09-10 15:55:23	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1007, 4)
2019-09-10 16:03:58	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1007, 5)
2019-09-10 16:03:58	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1007, 6)
2019-09-10 16:04:35	UPDATE specimen_session SET count=4 WHERE session_num='20190910'
2019-09-10 16:05:25	update patient_daily set count=4 where datestring='20190910' 
2019-09-10 16:06:04	BEGIN
2019-09-10 16:06:05	COMMIT
2019-09-10 16:06:26	UPDATE specimen_session SET count=5 WHERE session_num='20190910'
2019-09-10 16:07:16	update patient_daily set count=5 where datestring='20190910' 
2019-09-10 16:07:51	BEGIN
2019-09-10 16:07:51	COMMIT
2019-09-10 16:08:25	UPDATE specimen_session SET count=6 WHERE session_num='20190910'
2019-09-10 16:09:29	update patient_daily set count=6 where datestring='20190910' 
2019-09-10 16:10:25	BEGIN
2019-09-10 16:10:25	COMMIT
2019-09-10 16:10:45	UPDATE specimen_session SET count=7 WHERE session_num='20190910'
2019-09-10 16:11:28	update patient_daily set count=7 where datestring='20190910' 
2019-09-10 16:13:27	BEGIN
2019-09-10 16:13:27	COMMIT
2019-09-10 16:13:54	UPDATE specimen_session SET count=8 WHERE session_num='20190910'
2019-09-10 16:14:49	update patient_daily set count=8 where datestring='20190910' 
2019-09-10 16:15:25	BEGIN
2019-09-10 16:15:25	COMMIT
2019-09-10 16:15:58	UPDATE specimen_session SET count=9 WHERE session_num='20190910'
2019-09-10 16:17:06	update patient_daily set count=9 where datestring='20190910' 
2019-09-10 16:17:45	BEGIN
2019-09-10 16:17:46	COMMIT
2019-09-10 16:18:13	UPDATE specimen_session SET count=10 WHERE session_num='20190910'
2019-09-10 16:18:55	update patient_daily set count=10 where datestring='20190910' 
2019-09-10 16:19:33	BEGIN
2019-09-10 16:19:33	COMMIT
2019-09-10 16:24:45	UPDATE `test` SET result='12.5,,26672447c91964d47c41e06cffa256ad994270b9', comments='', user_id=505, ts='2019-09-10 16:24:45' WHERE test_id=10 
2019-09-10 16:24:45	UPDATE `test` SET result='Negetive,,26672447c91964d47c41e06cffa256ad994270b9', comments='Malaria Parasite:Negetive', user_id=505, ts='2019-09-10 16:24:45' WHERE test_id=11 
2019-09-10 16:24:45	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=11
2019-09-10 16:25:31	UPDATE `test` SET result='Negetive,,4be77b7f0431817d69ee45c525ce8d8300e5327e', comments='Malaria Parasite:Negetive', user_id=505, ts='2019-09-10 16:25:31' WHERE test_id=12 
2019-09-10 16:25:31	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=12
2019-09-10 16:26:06	UPDATE `test` SET result='Positive,,d0d64bd16ea8e2bf41261b4b3dff1311eff9866a', comments='', user_id=505, ts='2019-09-10 16:26:06' WHERE test_id=6 
2019-09-10 16:26:06	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=7
2019-09-10 16:27:06	UPDATE `test` SET result='11.9,,773c9a58cbbcef90d21799d9d5bda71bc819561b', comments='', user_id=505, ts='2019-09-10 16:27:06' WHERE test_id=7 
2019-09-10 16:27:06	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=8
2019-09-10 16:27:54	UPDATE `test` SET result='Negetive,,192a399f9b7e9447b0fc21610da047871368525d', comments='Malaria Parasite:Negetive', user_id=505, ts='2019-09-10 16:27:54' WHERE test_id=9 
2019-09-10 16:27:54	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=10
2019-09-10 16:29:29	UPDATE `test` SET result='3.4,70.4,,d2fe2b3674325f95fdd7d9ff2beb16dc940c2c39', comments='', user_id=505, ts='2019-09-10 16:29:29' WHERE test_id=5 
2019-09-10 16:29:29	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=6
2019-09-10 16:30:12	UPDATE `test` SET result='12.4,,067ca6bce759c3ebd83bf6e7f8e4ee61f753b8a5', comments='', user_id=505, ts='2019-09-10 16:30:12' WHERE test_id=8 
2019-09-10 16:30:12	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=9
2019-09-10 16:31:12	UPDATE `test` SET result='10.1,,6826daa636740fb0ae1bf687a15a792daa561ca7', comments='', user_id=505, ts='2019-09-10 16:31:12' WHERE test_id=1 
2019-09-10 16:31:12	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=1
2019-09-10 16:32:27	UPDATE `test` SET result='11.0,,6826daa636740fb0ae1bf687a15a792daa561ca7', comments='', user_id=505, ts='2019-09-10 16:32:27' WHERE test_id=2 
2019-09-10 16:32:27	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=3
2019-09-10 20:49:35	INSERT INTO user_feedback (user_id, rating, comments) VALUES (505, 6, '')
2019-09-11 09:56:08	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 09:56:09	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=2
2019-09-11 09:56:09	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=1
2019-09-11 10:00:31	DELETE FROM field_order WHERE lab_config_id=1007 AND form_id=1
2019-09-11 10:00:31	DELETE FROM field_order WHERE lab_config_id=1007 AND form_id=2
2019-09-11 10:34:40	BEGIN
2019-09-11 10:34:40	COMMIT
2019-09-11 10:35:57	UPDATE `test` SET result='Pos,26672447c91964d47c41e06cffa256ad994270b9', comments='', user_id=505, ts='2019-09-11 00:00:00' WHERE test_id=13 
2019-09-11 10:35:57	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=13
2019-09-11 10:37:21	UPDATE test SET result='Pos,,26672447c91964d47c41e06cffa256ad994270b9', comments='', verified_by=505, date_verified='2019-09-11 10:37:21' WHERE test_id=13
2019-09-11 10:41:56	UPDATE `test` SET result='Pos,89b557886da9be63d4312da70fbb4898876c7c36', comments='', user_id=505, ts='2019-09-11 10:41:56' WHERE test_id=4 
2019-09-11 10:41:56	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=5
2019-09-11 10:42:48	UPDATE test SET result='Pos,,89b557886da9be63d4312da70fbb4898876c7c36', comments='', verified_by=505, date_verified='2019-09-11 10:42:48' WHERE test_id=4
2019-09-11 10:49:31	UPDATE `test` SET result='Neg,0ec4bd6cb98ebe07fdc98d179919959fce4069c2', comments='', user_id=505, ts='2019-09-11 00:00:00' WHERE test_id=3 
2019-09-11 10:49:31	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=4
2019-09-11 10:49:43	UPDATE test SET result='Neg,,0ec4bd6cb98ebe07fdc98d179919959fce4069c2', comments='', verified_by=505, date_verified='2019-09-11 10:49:43' WHERE test_id=3
2019-09-11 10:51:15	UPDATE test SET verified_by=505, date_verified='2019-09-11 10:51:15' WHERE test_id=5
2019-09-11 13:15:55	UPDATE specimen_session SET count=2 WHERE session_num='20190911'
2019-09-11 13:19:32	UPDATE specimen_session SET count=3 WHERE session_num='20190911'
2019-09-11 13:25:39	UPDATE specimen_session SET count=4 WHERE session_num='20190911'
2019-09-11 13:26:33	UPDATE specimen_session SET count=5 WHERE session_num='20190911'
2019-09-11 13:29:35	update patient_daily set count=2 where datestring='20190911' 
2019-09-11 13:30:13	BEGIN
2019-09-11 13:30:13	COMMIT
2019-09-11 13:30:27	UPDATE specimen_session SET count=6 WHERE session_num='20190911'
2019-09-11 13:31:23	update patient_daily set count=3 where datestring='20190911' 
2019-09-11 13:31:55	BEGIN
2019-09-11 13:31:56	COMMIT
2019-09-11 13:32:05	UPDATE specimen_session SET count=7 WHERE session_num='20190911'
2019-09-11 13:33:22	update patient_daily set count=4 where datestring='20190911' 
2019-09-11 13:34:13	BEGIN
2019-09-11 13:34:13	COMMIT
2019-09-11 13:34:31	UPDATE specimen_session SET count=8 WHERE session_num='20190911'
2019-09-11 13:36:01	update patient_daily set count=5 where datestring='20190911' 
2019-09-11 13:36:38	BEGIN
2019-09-11 13:36:38	COMMIT
2019-09-11 13:38:12	UPDATE specimen_session SET count=9 WHERE session_num='20190911'
2019-09-11 13:38:55	update patient_daily set count=6 where datestring='20190911' 
2019-09-11 13:39:30	BEGIN
2019-09-11 13:39:30	COMMIT
2019-09-11 13:39:50	UPDATE specimen_session SET count=10 WHERE session_num='20190911'
2019-09-11 13:41:30	update patient_daily set count=7 where datestring='20190911' 
2019-09-11 13:42:42	BEGIN
2019-09-11 13:42:42	COMMIT
2019-09-11 13:43:59	UPDATE specimen_session SET count=11 WHERE session_num='20190911'
2019-09-11 13:46:23	update patient_daily set count=8 where datestring='20190911' 
2019-09-11 13:47:23	BEGIN
2019-09-11 13:47:23	COMMIT
2019-09-11 13:47:35	UPDATE specimen_session SET count=12 WHERE session_num='20190911'
2019-09-11 13:48:57	update patient_daily set count=9 where datestring='20190911' 
2019-09-11 13:49:39	UPDATE report_config SET header='Patient Report??left', footer='#', title='Patient Report', margins='2,0,10,0', landscape=0, p_fields='1,1,0,1,1,0,1,0,0,0,0,0,0', s_fields='1,0,0,0,0,1,1', t_fields='1,1,1,0,0,0,0,1,0,1,1,1', p_custom_fields='', s_custom_fields='', row_items='', show_border='', show_result_border='1', result_border_horizontal='1', result_border_vertical='1' WHERE report_id=1
2019-09-11 13:49:54	BEGIN
2019-09-11 13:49:54	COMMIT
2019-09-11 13:50:12	UPDATE specimen_session SET count=13 WHERE session_num='20190911'
2019-09-11 13:51:23	update patient_daily set count=10 where datestring='20190911' 
2019-09-11 13:52:31	BEGIN
2019-09-11 13:52:31	COMMIT
2019-09-11 13:54:10	UPDATE `test` SET result='Positive,,1ec69ae7d1df42d811519867d51c349d9f1abab3', comments='', user_id=505, ts='2019-09-11 13:54:10' WHERE test_id=14 
2019-09-11 13:54:10	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=14
2019-09-11 13:54:34	UPDATE test SET verified_by=505, date_verified='2019-09-11 13:54:34' WHERE test_id=14
2019-09-11 13:55:23	UPDATE `test` SET result='Neg,,332d6076b369dba25afad4577a469fba1b4ef1d4', comments='', user_id=505, ts='2019-09-11 13:55:23' WHERE test_id=15 
2019-09-11 13:55:23	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=15
2019-09-11 13:55:30	UPDATE test SET verified_by=505, date_verified='2019-09-11 13:55:30' WHERE test_id=15
2019-09-11 13:56:51	UPDATE specimen_session SET count=14 WHERE session_num='20190911'
2019-09-11 13:57:52	BEGIN
2019-09-11 13:57:52	COMMIT
2019-09-11 13:58:03	UPDATE `test` SET result='Positive,,be32396330132d910b56b6cb23fe4e233a0e0a78', comments='', user_id=505, ts='2019-09-11 13:58:03' WHERE test_id=24 
2019-09-11 13:58:03	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=23
2019-09-11 13:58:10	UPDATE test SET verified_by=505, date_verified='2019-09-11 13:58:10' WHERE test_id=24
2019-09-11 13:58:47	UPDATE specimen_session SET count=15 WHERE session_num='20190911'
2019-09-11 13:59:15	BEGIN
2019-09-11 13:59:15	COMMIT
2019-09-11 13:59:26	UPDATE `test` SET result='Positive,,7eff688681d634b5cd8ec5b55830fb7938dc1166', comments='', user_id=505, ts='2019-09-11 13:59:26' WHERE test_id=25 
2019-09-11 13:59:26	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=24
2019-09-11 13:59:35	UPDATE test SET verified_by=505, date_verified='2019-09-11 13:59:35' WHERE test_id=25
2019-09-11 14:00:18	UPDATE specimen_session SET count=16 WHERE session_num='20190911'
2019-09-11 14:00:48	BEGIN
2019-09-11 14:00:48	COMMIT
2019-09-11 14:00:59	UPDATE `test` SET result='Neg,,74f50fd2b36f64970bac30c16bb1d43a8f8ab19d', comments='', user_id=505, ts='2019-09-11 14:00:59' WHERE test_id=26 
2019-09-11 14:00:59	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=25
2019-09-11 14:01:06	UPDATE test SET verified_by=505, date_verified='2019-09-11 14:01:06' WHERE test_id=26
2019-09-11 14:01:27	UPDATE specimen_session SET count=17 WHERE session_num='20190911'
2019-09-11 14:01:59	BEGIN
2019-09-11 14:01:59	COMMIT
2019-09-11 14:02:10	UPDATE `test` SET result='Neg,,8d0c92d94cd1ff09a194349302e790c700c427b1', comments='', user_id=505, ts='2019-09-11 14:02:10' WHERE test_id=27 
2019-09-11 14:02:10	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=26
2019-09-11 14:02:16	UPDATE test SET verified_by=505, date_verified='2019-09-11 14:02:16' WHERE test_id=27
2019-09-11 14:02:31	UPDATE specimen_session SET count=18 WHERE session_num='20190911'
2019-09-11 14:02:58	BEGIN
2019-09-11 14:02:59	COMMIT
2019-09-11 14:03:08	UPDATE `test` SET result='Positive,,eab3e39dbb14245ccc7ea31f57fb64c5394338a6', comments='', user_id=505, ts='2019-09-11 14:03:07' WHERE test_id=28 
2019-09-11 14:03:08	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=27
2019-09-11 14:03:15	UPDATE test SET verified_by=505, date_verified='2019-09-11 14:03:15' WHERE test_id=28
2019-09-11 14:03:28	UPDATE specimen_session SET count=19 WHERE session_num='20190911'
2019-09-11 14:04:10	BEGIN
2019-09-11 14:04:10	COMMIT
2019-09-11 14:04:20	UPDATE `test` SET result='Positive,,09fb005d262e4e6becb03fa3bd54bd6d14058de5', comments='', user_id=505, ts='2019-09-11 14:04:20' WHERE test_id=29 
2019-09-11 14:04:21	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=28
2019-09-11 14:04:28	UPDATE test SET verified_by=505, date_verified='2019-09-11 14:04:28' WHERE test_id=29
2019-09-11 14:04:44	UPDATE specimen_session SET count=20 WHERE session_num='20190911'
2019-09-11 14:05:17	BEGIN
2019-09-11 14:05:17	COMMIT
2019-09-11 14:05:29	UPDATE `test` SET result=',,4d9ea238553134ef7ea53f8c140ebb7d973ac094', comments='', user_id=505, ts='2019-09-11 14:05:29' WHERE test_id=30 
2019-09-11 14:05:29	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=29
2019-09-11 14:06:08	UPDATE `test` SET result='Neg,,4d9ea238553134ef7ea53f8c140ebb7d973ac094', comments='', user_id=505, ts='2019-09-11 14:06:08' WHERE test_id=23 
2019-09-11 14:06:08	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=22
2019-09-11 14:06:15	UPDATE test SET verified_by=505, date_verified='2019-09-11 14:06:15' WHERE test_id=23
2019-09-11 14:09:28	UPDATE specimen_session SET count=21 WHERE session_num='20190911'
2019-09-11 14:19:22	DELETE FROM report_config WHERE landscape = 9999009 
2019-09-11 14:19:22	DELETE FROM report_config WHERE landscape = 9999019 
2019-09-15 16:39:55	INSERT INTO user_feedback (user_id, rating, comments) VALUES (505, 6, '')
2019-09-15 17:06:05	INSERT INTO user_feedback (user_id, rating, comments) VALUES (505, 6, '')
