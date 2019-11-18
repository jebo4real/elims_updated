USE blis_1008;

2019-09-09 13:41:59	CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `page` varchar(45) NOT NULL default '',
  `comment` varchar(150) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:41:59	


CREATE TABLE IF NOT EXISTS `custom_field_type` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_type` varchar(45) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:00	


CREATE TABLE IF NOT EXISTS `delay_measures` (
  `User_Id` varchar(50) NOT NULL default '',
  `IP_Address` varchar(16) NOT NULL default '',
  `Latency` int(11) NOT NULL default '0',
  `Recorded_At` datetime NOT NULL default '0000-00-00 00:00:00',
  `Page_Name` varchar(45) default NULL,
  `Request_URI` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:00	


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
2019-09-09 13:42:00	


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
2019-09-09 13:42:00	


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
2019-09-09 13:42:00	


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
2019-09-09 13:42:00	


CREATE TABLE IF NOT EXISTS `lab_config_access` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`lab_config_id`),
  KEY `lab_config_id` (`lab_config_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:01	


CREATE TABLE IF NOT EXISTS `lab_config_specimen_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `specimen_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:01	


CREATE TABLE IF NOT EXISTS `lab_config_test_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `test_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `test_type_id` (`test_type_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:01	


CREATE TABLE IF NOT EXISTS `labtitle_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL,
  `field_options` varchar(200) NOT NULL,
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:01	


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
2019-09-09 13:42:01	


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
2019-09-09 13:42:01	


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
2019-09-09 13:42:02	


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
2019-09-09 13:42:02	


CREATE TABLE IF NOT EXISTS `patient_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` varchar(65474) NOT NULL default '',
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:02	


CREATE TABLE IF NOT EXISTS `patient_daily` (
  `datestring` varchar(45) NOT NULL,
  `count` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:02	


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
2019-09-09 13:42:02	


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
2019-09-09 13:42:02	


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
2019-09-09 13:42:03	


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
2019-09-09 13:42:03	


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
2019-09-09 13:42:03	


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
2019-09-09 13:42:03	


CREATE TABLE IF NOT EXISTS `specimen_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` varchar(65474) NOT NULL default '',
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:04	


CREATE TABLE IF NOT EXISTS `specimen_session` (
  `session_num` varchar(45) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:04	


CREATE TABLE IF NOT EXISTS `specimen_test` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `specimen_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relates tests to the specimens that are compatible with thos';
2019-09-09 13:42:04	


CREATE TABLE IF NOT EXISTS `specimen_type` (
  `specimen_type_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `disabled` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:04	


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
2019-09-09 13:42:04	


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
2019-09-09 13:42:05	


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
2019-09-09 13:42:05	


CREATE TABLE IF NOT EXISTS `test_category` (
  `test_category_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`test_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:05	


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
2019-09-09 13:42:05	


CREATE TABLE IF NOT EXISTS `test_type_measure` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `measure_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:05	


CREATE TABLE IF NOT EXISTS `unit` (
  `unit_id` int(11) unsigned NOT NULL auto_increment,
  `unit` varchar(45) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:06	


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
2019-09-09 13:42:06	


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
2019-09-09 13:42:06	


CREATE TABLE IF NOT EXISTS `user_rating` (
  `user_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`,`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:06	


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
2019-09-09 13:42:06	


CREATE TABLE IF NOT EXISTS `worksheet_custom_test` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `width` varchar(45) NOT NULL,
  KEY `worksheet_id` (`worksheet_id`),
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:07	


CREATE TABLE IF NOT EXISTS `worksheet_custom_userfield` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `name` varchar(70) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '10',
  `field_id` int(10) unsigned NOT NULL auto_increment,
  KEY `Primary Key` (`field_id`),
  KEY `worksheet_id` (`worksheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
2019-09-09 13:42:07	


CREATE TABLE IF NOT EXISTS `test_type_costs` (
  `earliest_date_valid` timestamp NOT NULL,
  `test_type_id` int(11) NOT NULL,
  `amount` decimal(10, 2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:42:07	

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
2019-09-09 13:42:07	

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
2019-09-09 13:42:07	

CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `patient_id` int(11) unsigned NOT NULL,
  `paid_in_full` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:42:07	

CREATE TABLE IF NOT EXISTS `bills_test_association` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `bill_id` int(11) unsigned NOT NULL,
  `test_id` int(11) unsigned NOT NULL,
  `discount_type` int(4) unsigned NOT NULL default '1000',
  `discount_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:42:08	

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL auto_increment,
  `amount` decimal(10,2) NOT NULL default '0.00',
  `bill_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
2019-09-09 13:42:08	


CREATE  TABLE IF NOT EXISTS `user_feedback` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NULL ,
  `rating` INT(3) NULL ,
  `comments` VARCHAR(500) NULL ,
  `ts` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) );
2019-09-09 13:42:08	


INSERT INTO `report_config` (`report_id`, `header`, `footer`, `margins`, `p_fields`, `s_fields`, `t_fields`, `p_custom_fields`, `s_custom_fields`,`test_type_id`,`title`,`landscape`,`row_items`,`show_border`,`show_result_border`,`result_border_horizontal`,`result_border_vertical`) VALUES 
('1', 'Patient Report', '', '2,0,10,0', '1,1,0,1,1,0,1,0,0,0,0,0,0', '1,0,0,0,0,1,1', '1,1,1,0,0,0,0,1,0,1,1,1', '', '', '0', 'Patient Report', 0, 1, 1, 1, 1, 1);
2019-09-09 13:42:08	

INSERT INTO `report_config` (`report_id`, `header`, `footer`, `margins`, `p_fields`, `s_fields`, `t_fields`, `p_custom_fields`, `s_custom_fields`) VALUES 
('2', 'Specimen Report', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('3', 'Test Records', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('4', 'Daily Log - Specimens', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('5', 'Worksheet', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', ''),
('6', 'Daily Log - Patients', '', '2,0,10,0', '1,1,1,1,1,1,1', '1,1,1,1,1,1', '1,0,1,1,1,0,1,1', '', '');
2019-09-09 13:42:08	

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
2019-09-09 13:42:08	

INSERT INTO `test_category` (`test_category_id`, `name`) VALUES(1, 'HIV');
2019-09-09 13:42:08	


CREATE TABLE `field_order` (
  `id` int(11) NOT NULL auto_increment,
  `lab_config_id` int(11) unsigned default NULL,
  `form_id` int(11) default NULL,
  `field_order` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
2019-09-09 13:42:08	

alter table removal_record add category varchar(20) default "test";
2019-09-09 13:42:08	

ALTER TABLE specimen ADD COLUMN referred_from_name varchar(20);
2019-09-09 13:42:08	

CREATE TABLE IF NOT EXISTS sites (
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255),
  lab_id INT,
  District VARCHAR(40),
 Region VARCHAR(40),
  PRIMARY KEY (id)
);
2019-09-09 13:42:09	

ALTER TABLE specimen ADD COLUMN site_id INT;
2019-09-09 13:42:09	

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
2019-09-09 13:42:09	

ALTER TABLE test_type ADD COLUMN is_reporting_enabled BOOLEAN DEFAULT 0;
2019-09-09 13:42:09	
;
2019-09-09 15:51:06	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1008, 1)
2019-09-09 15:52:57	UPDATE specimen_type SET name='Whole Blood', description='Whole Blood' WHERE specimen_type_id=1
2019-09-09 15:54:21	UPDATE specimen_type SET name='Whole Blood', description='Whole Blood' WHERE specimen_type_id=1
2019-09-09 15:55:48	UPDATE specimen_type SET name='Whole Blood', description='Whole Blood' WHERE specimen_type_id=1
2019-09-09 16:01:42	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1008, 2)
2019-09-09 16:13:11	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1008, 3)
2019-09-09 16:18:22	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1008, 4)
2019-09-09 16:23:45	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1008, 5)
2019-09-09 16:27:41	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1008, 6)
2019-09-09 16:32:29	INSERT INTO lab_config_test_type(lab_config_id, test_type_id) VALUES (1008, 7)
2019-09-09 16:34:58	INSERT INTO user_feedback (user_id, rating, comments) VALUES (506, 2, '')
2019-09-09 16:52:36	UPDATE specimen_type SET name='SPutum', description='' WHERE specimen_type_id=2
2019-09-09 16:55:06	UPDATE measure SET name='Malaria Parasites', range='$freetext$$', unit='' WHERE measure_id=6
2019-09-09 16:55:06	UPDATE test_type SET name='Malaria Parasites', description='Whole blood', clinical_data='', test_category_id='2', hide_patient_name='0', prevalence_threshold=70, target_tat=24 WHERE test_type_id=6
2019-09-09 16:57:21	INSERT INTO user_feedback (user_id, rating, comments) VALUES (506, 6, '')
2019-09-10 10:04:08	UPDATE specimen_type SET name='Sputum', description='' WHERE specimen_type_id=2
2019-09-10 14:13:22	INSERT INTO user_feedback (user_id, rating, comments) VALUES (506, 6, '')
2019-09-10 15:21:46	DELETE FROM field_order WHERE lab_config_id=1008 AND form_id=1
2019-09-10 15:21:46	DELETE FROM field_order WHERE lab_config_id=1008 AND form_id=2
2019-09-10 15:26:26	DELETE FROM field_order WHERE lab_config_id=1008 AND form_id=1
2019-09-10 15:26:26	DELETE FROM field_order WHERE lab_config_id=1008 AND form_id=2
2019-09-10 15:38:00	BEGIN
2019-09-10 15:38:00	COMMIT
2019-09-10 15:39:27	UPDATE specimen_session SET count=2 WHERE session_num='20190910'
2019-09-10 15:40:10	UPDATE specimen_session SET count=3 WHERE session_num='20190910'
2019-09-10 15:40:32	update patient_daily set count=2 where datestring='20190910' 
2019-09-10 15:41:33	BEGIN
2019-09-10 15:41:33	COMMIT
2019-09-10 15:41:41	update patient_daily set count=3 where datestring='20190910' 
2019-09-10 15:42:20	UPDATE specimen_session SET count=4 WHERE session_num='20190910'
2019-09-10 15:43:28	BEGIN
2019-09-10 15:43:28	COMMIT
2019-09-10 15:43:45	update patient_daily set count=4 where datestring='20190910' 
2019-09-10 15:44:18	UPDATE `test` SET result='10.0g/dl,,4b2dec6f4384d678e6ca62a946766345f60ed862', comments='', user_id=506, ts='2019-09-10 15:44:18' WHERE test_id=3 
2019-09-10 15:44:18	UPDATE `test` SET result='30,,4b2dec6f4384d678e6ca62a946766345f60ed862', comments='', user_id=506, ts='2019-09-10 15:44:18' WHERE test_id=4 
2019-09-10 15:44:18	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=3
2019-09-10 15:44:43	BEGIN
2019-09-10 15:44:43	COMMIT
2019-09-10 15:45:21	UPDATE specimen_session SET count=5 WHERE session_num='20190910'
2019-09-10 15:46:49	update patient_daily set count=5 where datestring='20190910' 
2019-09-10 15:47:50	BEGIN
2019-09-10 15:47:50	COMMIT
2019-09-10 15:48:39	UPDATE specimen_session SET count=6 WHERE session_num='20190910'
2019-09-10 15:48:56	UPDATE test SET result='10.0g/dl,,4b2dec6f4384d678e6ca62a946766345f60ed862', comments='Hb:12.0-13.0', verified_by=506, date_verified='2019-09-10 15:48:56' WHERE test_id=3
2019-09-10 15:48:56	UPDATE test SET result='30,,4b2dec6f4384d678e6ca62a946766345f60ed862', comments='pcv:40-50', verified_by=506, date_verified='2019-09-10 15:48:56' WHERE test_id=4
2019-09-10 15:49:42	update patient_daily set count=6 where datestring='20190910' 
2019-09-10 15:50:32	BEGIN
2019-09-10 15:50:32	COMMIT
2019-09-10 15:51:06	UPDATE test SET verified_by=506, date_verified='2019-09-10 15:51:06' WHERE test_id=3
2019-09-10 15:51:06	UPDATE test SET verified_by=506, date_verified='2019-09-10 15:51:06' WHERE test_id=4
2019-09-10 15:51:18	UPDATE specimen_session SET count=7 WHERE session_num='20190910'
2019-09-10 15:51:19	UPDATE specimen_session SET count=8 WHERE session_num='20190910'
2019-09-10 15:51:35	UPDATE specimen_session SET count=9 WHERE session_num='20190910'
2019-09-10 15:52:14	update patient_daily set count=7 where datestring='20190910' 
2019-09-10 15:52:50	BEGIN
2019-09-10 15:52:50	COMMIT
2019-09-10 15:54:03	update patient_daily set count=8 where datestring='20190910' 
2019-09-10 15:54:17	UPDATE patient SET name='Tony Cole', surr_id='0005-19', addl_id='', sex='M', age=0, partial_dob='1957' WHERE patient_id=7
2019-09-10 15:55:07	UPDATE specimen_session SET count=10 WHERE session_num='20190910'
2019-09-10 15:56:08	update patient_daily set count=9 where datestring='20190910' 
2019-09-10 15:56:44	BEGIN
2019-09-10 15:56:44	COMMIT
2019-09-10 15:56:51	BEGIN
2019-09-10 15:56:51	COMMIT
2019-09-10 15:57:28	UPDATE specimen_session SET count=11 WHERE session_num='20190910'
2019-09-10 15:57:52	UPDATE `test` SET result='Positive,,93c3fc820b4d906a04862114513f503b34c075ae', comments='', user_id=506, ts='2019-09-10 15:57:51' WHERE test_id=10 
2019-09-10 15:57:52	UPDATE `test` SET result='6700,,93c3fc820b4d906a04862114513f503b34c075ae', comments='', user_id=506, ts='2019-09-10 15:57:52' WHERE test_id=11 
2019-09-10 15:57:52	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=9
2019-09-10 15:58:26	update patient_daily set count=10 where datestring='20190910' 
2019-09-10 15:58:58	UPDATE specimen_session SET count=12 WHERE session_num='20190910'
2019-09-10 15:59:40	BEGIN
2019-09-10 15:59:40	COMMIT
2019-09-10 16:00:29	UPDATE specimen_session SET count=13 WHERE session_num='20190910'
2019-09-10 16:01:12	update patient_daily set count=11 where datestring='20190910' 
2019-09-10 16:01:29	update patient_daily set count=12 where datestring='20190910' 
2019-09-10 16:02:21	BEGIN
2019-09-10 16:02:21	COMMIT
2019-09-10 16:03:06	UPDATE specimen_session SET count=14 WHERE session_num='20190910'
2019-09-10 16:04:06	BEGIN
2019-09-10 16:04:06	COMMIT
2019-09-10 16:04:17	update patient_daily set count=13 where datestring='20190910' 
2019-09-10 16:04:58	BEGIN
2019-09-10 16:04:58	COMMIT
2019-09-10 16:05:44	UPDATE `test` SET result='[$]120/ul of Early trophoizoite of Plasmodium Falciparum[/$],,5781ca473b2137e66c60cb3b141f32172cfd6ac0', comments='', user_id=506, ts='2019-09-10 16:05:43' WHERE test_id=14 
2019-09-10 16:05:44	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=12
2019-09-10 16:05:45	UPDATE specimen_session SET count=15 WHERE session_num='20190910'
2019-09-10 16:06:37	UPDATE specimen_session SET count=16 WHERE session_num='20190910'
2019-09-10 16:06:54	update patient_daily set count=14 where datestring='20190910' 
2019-09-10 16:07:27	BEGIN
2019-09-10 16:07:27	COMMIT
2019-09-10 16:08:21	UPDATE specimen_session SET count=17 WHERE session_num='20190910'
2019-09-10 16:08:53	update patient_daily set count=15 where datestring='20190910' 
2019-09-10 16:09:17	update patient_daily set count=16 where datestring='20190910' 
2019-09-10 16:09:58	BEGIN
2019-09-10 16:09:58	COMMIT
2019-09-10 16:13:06	BEGIN
2019-09-10 16:13:06	COMMIT
2019-09-10 16:15:05	UPDATE specimen_session SET count=18 WHERE session_num='20190910'
2019-09-10 16:15:45	UPDATE `test` SET result='20 mm fall/hr,,236f3ff1d9a65525d0a4a5aaeed11bc45ca73d4d', comments='', user_id=506, ts='2019-09-10 16:15:45' WHERE test_id=18 
2019-09-10 16:15:45	UPDATE `test` SET result='[$]120/ul Early Trophoite of Plasmodium Falciparum[/$],,236f3ff1d9a65525d0a4a5aaeed11bc45ca73d4d', comments='', user_id=506, ts='2019-09-10 16:15:45' WHERE test_id=19 
2019-09-10 16:15:45	UPDATE `test` SET result='Negative,,236f3ff1d9a65525d0a4a5aaeed11bc45ca73d4d', comments='', user_id=506, ts='2019-09-10 16:15:45' WHERE test_id=20 
2019-09-10 16:15:45	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=16
2019-09-10 16:15:55	update patient_daily set count=17 where datestring='20190910' 
2019-09-10 16:16:44	UPDATE test SET verified_by=506, date_verified='2019-09-10 16:16:44' WHERE test_id=18
2019-09-10 16:16:44	UPDATE test SET verified_by=506, date_verified='2019-09-10 16:16:44' WHERE test_id=19
2019-09-10 16:16:44	UPDATE test SET verified_by=506, date_verified='2019-09-10 16:16:44' WHERE test_id=20
2019-09-10 16:17:04	UPDATE specimen_session SET count=19 WHERE session_num='20190910'
2019-09-10 16:17:15	BEGIN
2019-09-10 16:17:15	COMMIT
2019-09-10 16:20:27	update patient_daily set count=18 where datestring='20190910' 
2019-09-10 16:22:42	BEGIN
2019-09-10 16:22:43	COMMIT
2019-09-10 16:23:34	UPDATE `test` SET result='13.3-14.2,,35a50baf2b3c37575a5e16ebd0c89c4a4c768859', comments='', user_id=506, ts='2019-09-10 16:23:34' WHERE test_id=1 
2019-09-10 16:23:34	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=1
2019-09-10 16:23:57	UPDATE `test` SET result='Numerous pus cell Seen,,4f74126e1f211261ed02a2707ac0e4ec050388e3', comments='', user_id=506, ts='2019-09-10 16:23:57' WHERE test_id=22 
2019-09-10 16:23:57	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=18
2019-09-10 16:24:15	UPDATE specimen_session SET count=20 WHERE session_num='20190910'
2019-09-10 16:25:07	UPDATE specimen_session SET count=21 WHERE session_num='20190910'
2019-09-10 16:25:53	update patient_daily set count=19 where datestring='20190910' 
2019-09-10 16:26:39	UPDATE `test` SET result='36-45,,d47cab267abf354ec28691343c1dd28939b0d481', comments='', user_id=506, ts='2019-09-10 16:26:39' WHERE test_id=12 
2019-09-10 16:26:39	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=10
2019-09-10 16:27:25	UPDATE `test` SET result='2-8,,63bed7b05399be813aa70d9e4e3fa232224163c2', comments='', user_id=506, ts='2019-09-10 16:27:25' WHERE test_id=21 
2019-09-10 16:27:25	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=17
2019-09-10 16:28:27	BEGIN
2019-09-10 16:28:27	COMMIT
2019-09-10 16:28:44	UPDATE `test` SET result='[$]Positive[/$],,cbf6ce79b0f17a0bf4fc44079dd922ed6b6b770a', comments='', user_id=506, ts='2019-09-10 16:28:43' WHERE test_id=17 
2019-09-10 16:28:44	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=15
2019-09-10 16:29:05	UPDATE `test` SET result='Numerous Epithelial Cells Seen,,6d968de4f4163b0325f180f22dae6a1b26e6d110', comments='', user_id=506, ts='2019-09-10 16:29:05' WHERE test_id=23 
2019-09-10 16:29:05	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=19
2019-09-10 16:29:25	UPDATE `test` SET result='[$]Negative[/$],,adc84addd35c30a574b6b59d98439f46f68327af', comments='', user_id=506, ts='2019-09-10 16:29:25' WHERE test_id=5 
2019-09-10 16:29:25	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=4
2019-09-10 16:30:55	UPDATE `test` SET result='2-11,,5ecba9c581f5d74decf8328a6fb50b55fb5e9df6', comments='', user_id=506, ts='2019-09-10 16:30:55' WHERE test_id=7 
2019-09-10 16:30:55	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=6
2019-09-10 16:31:34	UPDATE `test` SET result='5-12,,a94504f61f01cdba165709b78ea6a3966f13f6cf', comments='', user_id=506, ts='2019-09-10 16:31:34' WHERE test_id=8 
2019-09-10 16:31:34	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=7
2019-09-10 16:32:17	UPDATE specimen_session SET count=22 WHERE session_num='20190910'
2019-09-10 16:32:37	UPDATE `test` SET result='[$]Positive[/$],,eae59fcabd765461f9e8c45f58adbf226df80d61', comments='', user_id=506, ts='2019-09-10 16:32:37' WHERE test_id=15 
2019-09-10 16:32:37	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=13
2019-09-10 16:33:40	UPDATE `test` SET result='4-12,,96d08b4e6216ed3a866f490932b49e92bb8fda76', comments='', user_id=506, ts='2019-09-10 16:33:40' WHERE test_id=16 
2019-09-10 16:33:40	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=14
2019-09-10 16:33:56	update patient_daily set count=20 where datestring='20190910' 
2019-09-10 16:35:09	BEGIN
2019-09-10 16:35:09	COMMIT
2019-09-10 16:36:55	UPDATE `test` SET result='2-4 Red Blood Cells Seen ,,c323977991d2e4f05d563182db85f497e2c646fd', comments='', user_id=506, ts='2019-09-10 16:36:55' WHERE test_id=24 
2019-09-10 16:36:55	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=20
2019-09-10 16:39:17	UPDATE `test` SET result='36-45,,fede48c1db246d82ffb6833179b31a6490f48bd6', comments='', user_id=506, ts='2019-09-10 16:39:17' WHERE test_id=9 
2019-09-10 16:39:17	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=8
2019-09-10 16:40:39	UPDATE `test` SET result='Positive,,19d014e2015c1fdb9692bff6e6b357ec03097cb4', comments='', user_id=506, ts='2019-09-10 16:40:39' WHERE test_id=13 
2019-09-10 16:40:40	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=11
2019-09-10 20:53:24	UPDATE specimen_session SET count=23 WHERE session_num='20190910'
2019-09-10 21:37:46	UPDATE test SET verified_by=506, date_verified='2019-09-10 21:37:46' WHERE test_id=21
2019-09-10 21:38:08	INSERT INTO user_feedback (user_id, rating, comments) VALUES (506, 6, '')
2019-09-11 13:13:23	INSERT INTO user_feedback (user_id, rating, comments) VALUES (516, 6, '')
2019-09-11 13:18:36	BEGIN
2019-09-11 13:18:36	COMMIT
2019-09-11 13:20:00	UPDATE specimen_session SET count=2 WHERE session_num='20190911'
2019-09-11 13:20:13	UPDATE specimen_session SET count=3 WHERE session_num='20190911'
2019-09-11 13:21:16	update patient_daily set count=2 where datestring='20190911' 
2019-09-11 13:24:54	UPDATE specimen_session SET count=4 WHERE session_num='20190911'
2019-09-11 13:25:27	BEGIN
2019-09-11 13:25:28	COMMIT
2019-09-11 13:26:00	UPDATE specimen_session SET count=5 WHERE session_num='20190911'
2019-09-11 13:27:00	UPDATE specimen_session SET count=6 WHERE session_num='20190911'
2019-09-11 13:27:07	update patient_daily set count=3 where datestring='20190911' 
2019-09-11 13:28:11	BEGIN
2019-09-11 13:28:11	COMMIT
2019-09-11 13:28:56	UPDATE specimen_session SET count=7 WHERE session_num='20190911'
2019-09-11 13:29:41	update patient_daily set count=4 where datestring='20190911' 
2019-09-11 13:30:03	update patient_daily set count=5 where datestring='20190911' 
2019-09-11 13:30:03	update patient_daily set count=6 where datestring='20190911' 
2019-09-11 13:30:42	BEGIN
2019-09-11 13:30:42	COMMIT
2019-09-11 13:30:46	BEGIN
2019-09-11 13:30:46	COMMIT
2019-09-11 13:31:35	UPDATE specimen_session SET count=8 WHERE session_num='20190911'
2019-09-11 13:32:23	UPDATE `test` SET result='[$]123/ul Eary Trophoizoite of Plasmodium Falciparum[/$],,cf55adb6e1752ae1c469ee281fa9c2a5932480e6', comments='', user_id=506, ts='2019-09-11 13:32:23' WHERE test_id=29 
2019-09-11 13:32:23	UPDATE `test` SET result='30,,cf55adb6e1752ae1c469ee281fa9c2a5932480e6', comments='', user_id=506, ts='2019-09-11 13:32:23' WHERE test_id=30 
2019-09-11 13:32:23	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=25
2019-09-11 13:32:27	update patient_daily set count=7 where datestring='20190911' 
2019-09-11 13:32:52	UPDATE test SET verified_by=506, date_verified='2019-09-11 13:32:52' WHERE test_id=29
2019-09-11 13:32:52	UPDATE test SET verified_by=506, date_verified='2019-09-11 13:32:52' WHERE test_id=30
2019-09-11 13:33:12	UPDATE specimen_session SET count=9 WHERE session_num='20190911'
2019-09-11 13:33:20	BEGIN
2019-09-11 13:33:20	COMMIT
2019-09-11 13:34:02	update patient_daily set count=8 where datestring='20190911' 
2019-09-11 13:34:37	BEGIN
2019-09-11 13:34:37	COMMIT
2019-09-11 13:34:41	UPDATE `test` SET result='2-11,,c61f2886d76c6f4e800cc4205983febf48b2c775', comments='', user_id=506, ts='2019-09-11 13:34:40' WHERE test_id=25 
2019-09-11 13:34:41	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=21
2019-09-11 13:35:21	UPDATE `test` SET result='3-4 Pus Cells Seen,,89ab585fe9966b4588ac002d12bb257618bc000b', comments='', user_id=506, ts='2019-09-11 13:35:21' WHERE test_id=32 
2019-09-11 13:35:21	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=27
2019-09-11 13:35:35	UPDATE `test` SET result='Positive,,0f58a5219e7cc7681e9415c997836845bc2ae72d', comments='', user_id=506, ts='2019-09-11 13:35:35' WHERE test_id=26 
2019-09-11 13:35:35	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=22
2019-09-11 13:35:35	UPDATE test SET verified_by=506, date_verified='2019-09-11 13:35:35' WHERE test_id=32
2019-09-11 13:36:13	UPDATE test SET verified_by=506, date_verified='2019-09-11 13:36:13' WHERE test_id=32
2019-09-11 13:36:22	UPDATE specimen_session SET count=10 WHERE session_num='20190911'
2019-09-11 13:36:31	UPDATE `test` SET result='12.8-14.5,,7bf079872c190c99cd9e55591365c96724009fe5', comments='', user_id=506, ts='2019-09-11 13:36:31' WHERE test_id=27 
2019-09-11 13:36:31	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=23
2019-09-11 13:37:31	UPDATE `test` SET result='2-13,,8f84d973c67c0526def1e050aae27975c854f1dd', comments='', user_id=506, ts='2019-09-11 13:37:31' WHERE test_id=28 
2019-09-11 13:37:31	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=24
2019-09-11 13:38:07	update patient_daily set count=9 where datestring='20190911' 
2019-09-11 13:38:17	UPDATE `test` SET result='[$]Negative[/$],,f1881303b69c7f3cad899fab698e5def5d1084ee', comments='', user_id=506, ts='2019-09-11 13:38:17' WHERE test_id=31 
2019-09-11 13:38:17	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=26
2019-09-11 13:39:18	BEGIN
2019-09-11 13:39:18	COMMIT
2019-09-11 13:40:15	UPDATE `test` SET result='5mm fall.hr,,1719eb70cb1c9ccd891f642165e2aad6f19a374e', comments='', user_id=506, ts='2019-09-11 13:40:14' WHERE test_id=33 
2019-09-11 13:40:15	UPDATE `test` SET result='9.8g/dl,,1719eb70cb1c9ccd891f642165e2aad6f19a374e', comments='', user_id=506, ts='2019-09-11 13:40:15' WHERE test_id=34 
2019-09-11 13:40:15	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=28
2019-09-11 13:40:40	UPDATE test SET result='5mm/fall.hr,,1719eb70cb1c9ccd891f642165e2aad6f19a374e', comments='', verified_by=506, date_verified='2019-09-11 13:40:40' WHERE test_id=33
2019-09-11 13:40:40	UPDATE test SET verified_by=506, date_verified='2019-09-11 13:40:40' WHERE test_id=34
2019-09-11 13:41:07	UPDATE specimen_session SET count=11 WHERE session_num='20190911'
2019-09-11 13:41:42	update patient_daily set count=10 where datestring='20190911' 
2019-09-11 13:42:32	BEGIN
2019-09-11 13:42:32	COMMIT
2019-09-11 13:43:11	UPDATE `test` SET result='Positive,,c932b4608cb05e42976c14eec75ee493db5f0781', comments='', user_id=506, ts='2019-09-11 13:43:10' WHERE test_id=35 
2019-09-11 13:43:11	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=29
2019-09-11 13:43:25	UPDATE test SET result='Positive_undefined,,c932b4608cb05e42976c14eec75ee493db5f0781', comments='', verified_by=506, date_verified='2019-09-11 13:43:25' WHERE test_id=35
2019-09-11 13:43:48	UPDATE specimen_session SET count=12 WHERE session_num='20190911'
2019-09-11 13:44:35	update patient_daily set count=11 where datestring='20190911' 
2019-09-11 13:45:27	BEGIN
2019-09-11 13:45:27	COMMIT
2019-09-11 13:46:15	UPDATE `test` SET result='6mmfall/hr,,d357a69f0d794a7e0bde30c3d9e7c31b3d6ea41d', comments='', user_id=506, ts='2019-09-11 13:46:15' WHERE test_id=36 
2019-09-11 13:46:15	UPDATE `specimen` SET status_code_id=1 WHERE specimen_id=30
2019-09-11 13:46:27	UPDATE test SET verified_by=506, date_verified='2019-09-11 13:46:27' WHERE test_id=36
2019-09-11 13:59:26	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:00:23	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:00:23	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=4
2019-09-11 14:00:23	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=1
2019-09-11 14:00:23	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=6
2019-09-11 14:00:23	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=2
2019-09-11 14:00:23	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=5
2019-09-11 14:00:23	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=3
2019-09-11 14:00:23	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=7
2019-09-11 14:00:31	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:00:44	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:00:44	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=4
2019-09-11 14:00:44	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=1
2019-09-11 14:00:44	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=6
2019-09-11 14:00:44	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=2
2019-09-11 14:00:44	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=5
2019-09-11 14:00:44	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=3
2019-09-11 14:00:44	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=7
2019-09-11 14:00:54	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:01:08	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:01:28	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:01:28	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=6
2019-09-11 14:01:28	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=5
2019-09-11 14:01:28	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=7
2019-09-11 14:01:35	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:02:06	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:02:30	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:02:30	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=4
2019-09-11 14:02:30	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=6
2019-09-11 14:02:30	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=7
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=4
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=1
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=6
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=2
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=5
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=3
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=7
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=4
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=6
2019-09-11 14:04:11	UPDATE test_type SET is_reporting_enabled=1 WHERE test_type_id=7
2019-09-11 14:04:16	UPDATE test_type SET is_reporting_enabled=0
2019-09-11 14:10:18	DELETE FROM report_config WHERE landscape = 9999009 
2019-09-11 14:10:18	DELETE FROM report_config WHERE landscape = 9999019 
2019-09-11 14:13:14	DELETE FROM report_config WHERE landscape = 9999009 
2019-09-11 14:13:14	DELETE FROM report_config WHERE landscape = 9999019 
2019-09-11 14:13:37	DELETE FROM report_config WHERE landscape = 9999009 
2019-09-11 14:13:37	DELETE FROM report_config WHERE landscape = 9999019 
2019-09-11 14:51:02	UPDATE removal_record SET status = 0 WHERE r_id = 16 AND category='test' AND status = 1 AND type = 1
2019-09-11 14:51:02	UPDATE removal_record SET status = 0 WHERE r_id = 14 AND category='specimen' AND status = 1 AND type = 1
2019-09-11 14:51:02	UPDATE removal_record SET status = 0 WHERE r_id = 14 AND category='patient' AND status = 1 AND type = 1
