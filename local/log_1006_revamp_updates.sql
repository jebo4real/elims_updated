USE blis_revamp;

2019-09-08 14:59:03	UPDATE lab_config SET db_name='blis_1006' WHERE lab_config_id='1006' 
2019-09-08 15:02:24	UPDATE lab_config SET s_addl=1 WHERE lab_config_id=1006
2019-09-08 15:02:24	UPDATE lab_config SET dformat='d-m-Y' WHERE lab_config_id=1006
2019-09-08 15:02:24	UPDATE lab_config SET dnum_reset=1 WHERE lab_config_id=1006
2019-09-08 15:02:24	UPDATE lab_config SET doctor=1 WHERE lab_config_id=1006
2019-09-08 15:03:37	UPDATE lab_config SET site_choice_enabled='1' WHERE lab_config_id='1006'
2019-09-10 15:27:40	UPDATE lab_config SET name='Central Public Health Laboratory', location='Freetown', admin_user_id=504, id_mode=1 WHERE lab_config_id=1006
2019-09-11 14:40:06	UPDATE lab_config SET site_choice_enabled='1' WHERE lab_config_id='1006'
2019-09-11 14:49:09	UPDATE lab_config SET site_choice_enabled='1' WHERE lab_config_id='1006'
2019-09-15 17:02:58	DELETE FROM user_type WHERE level=18
2019-09-15 17:02:58	DELETE FROM user_type_config WHERE level=18
2019-09-15 17:02:58	DELETE FROM user WHERE level=18
