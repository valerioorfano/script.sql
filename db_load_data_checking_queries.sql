-- check that external systems exist
select * from db_load_in_ucm where system_name not in (select system_num from s_cif_ext_syst@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM);
-- must return no rows

-- check that external IDs are unique
select system_name, external_id_1, count(*) from db_load_in_ucm group by system_name, external_id_1 having count(*) > 1;
-- must return no rows

-- check that mandatory fields have been filled
select * from db_load_in_ucm where trim(name) is null;
-- must return no rows

-- check correctness of SPEAK_FLAG field
select * from db_load_in_ucm where speak_flag not in ('Y','N');
-- must return no rows

-- check length of NAME field
select * from db_load_in_ucm where length(name) > 100;
select * from db_load_in_ucm where length(headquarterparent_name) > 100;
select * from db_load_in_ucm where length(domestic_ultimate_name) > 100;
select * from db_load_in_ucm where length(global_ultimate_name) > 100;
-- must return no rows

-- check length of NAME_SECOND_FIELD field
select * from db_load_in_ucm where length(name_second_field) > 100;
-- must return no rows

-- check length of LEGAL_ENTITY_STREET_ADDRESS field
select * from db_load_in_ucm where length(legal_entity_street_address) > 200;
select * from db_load_in_ucm where length(mailing_address_street_address) > 200;
select * from db_load_in_ucm where length(headquarterparent_street_addr) > 200;
select * from db_load_in_ucm where length(domestic_ultimate_street_addre) > 200;
select * from db_load_in_ucm where length(global_ultimate_street_address) > 200;
-- must return no rows

-- check length of LEGAL_ENTITY_ADDRESS_LINE_2 field
select * from db_load_in_ucm where length(legal_entity_address_line_2) > 100;
-- must return no rows

-- check length of LEGAL_ENTITY_CITY field
select * from db_load_in_ucm where length(legal_entity_city) > 50;
select * from db_load_in_ucm where length(mailing_address_city) > 50;
select * from db_load_in_ucm where length(headquarterparent_city) > 50;
select * from db_load_in_ucm where length(domestic_ultimate_city) > 50;
select * from db_load_in_ucm where length(global_ultimate_city) > 50;
-- must return no rows

-- check length of LEGAL_ENTITY_STATE field
select * from db_load_in_ucm where length(legal_entity_state) > 10;
select * from db_load_in_ucm where length(mailing_address_state) > 10;
select * from db_load_in_ucm where length(headquarterparent_state) > 10;
select * from db_load_in_ucm where length(domestic_ultimate_state) > 10;
select * from db_load_in_ucm where length(global_ultimate_state) > 10;
-- must return no rows

-- update db_load_in_ucm set legal_entity_state  = substr(legal_entity_state,1,10) where length(legal_entity_state) > 10;
-- update db_load_in_ucm set mailing_address_state  = substr(mailing_address_state,1,10) where length(mailing_address_state) > 10;
-- update db_load_in_ucm set headquarterparent_state  = substr(headquarterparent_state,1,0) where length(headquarterparent_state) > 10;
-- update db_load_in_ucm set domestic_ultimate_state  = substr(domestic_ultimate_state,1,10) where length(domestic_ultimate_state) > 10;
-- update db_load_in_ucm set global_ultimate_state  = substr(global_ultimate_state,1,10) where length(global_ultimate_state) > 10;

-- check length of LEGAL_ENTITY_POSTAL_CODE field
select * from db_load_in_ucm where length(legal_entity_postal_code) > 30;
select * from db_load_in_ucm where length(mailing_address_postal_code) > 30;
select * from db_load_in_ucm where length(headquarterparent_postal_code) > 30;
select * from db_load_in_ucm where length(domestic_ultimate_postal_code) > 30;
select * from db_load_in_ucm where length(global_ultimate_postal_code) > 30;
-- must return no rows

-- check correctness of LEGAL_ENTITY_COUNTRY_NAME field

update db_load_in_ucm
set legal_entity_country_name = rtrim(legal_entity_country_name);
update db_load_in_ucm
set mailing_address_country_name = rtrim(mailing_address_country_name);
update db_load_in_ucm
set headquarterparent_country_nam = rtrim(headquarterparent_country_nam);
update db_load_in_ucm
set domestic_ultimate_country_name = rtrim(domestic_ultimate_country_name);
update db_load_in_ucm
set global_ultimate_country_name = rtrim(global_ultimate_country_name);

select * from db_load_in_ucm where legal_entity_country_name not in (select low from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'COUNTRY' and active_flg = 'Y');

select * from db_load_in_ucm where mailing_address_country_name not in (select low from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'COUNTRY' and active_flg = 'Y') and mailing_address_street_address is not null;

select count(*) from db_load_in_ucm where headquarterparent_country_nam not in (select low from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'COUNTRY' and active_flg = 'Y')
and headquarterparent_name is not null;

select count(*) from db_load_in_ucm where domestic_ultimate_country_name not in (select low from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'COUNTRY' and active_flg = 'Y')
and domestic_ultimate_name is not null;

select count(*) from db_load_in_ucm where global_ultimate_country_name not in (select low from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'COUNTRY' and active_flg = 'Y')
and global_ultimate_name is not null;

-- check length of ADDRESS2_STREET_ADDRESS field
select * from db_load_in_ucm where length(legal_entity_address_line_2) > 200;
-- must return no rows

-- check length of LADDRESS2_CITY field
select * from db_load_in_ucm where length(legal_entity_city) > 50;
select * from db_load_in_ucm where length(mailing_address_city) > 50;
select * from db_load_in_ucm where length(headquarterparent_city) > 50;
select * from db_load_in_ucm where length(domestic_ultimate_city) > 50;
select * from db_load_in_ucm where length(global_ultimate_city) > 50;
-- must return no rows

-- check correctness of COUNTY fields
select * from db_load_in_ucm where legal_entity_county not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'COUNTY' and active_flg = 'Y');
select * from db_load_in_ucm where mailing_address_county not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'COUNTY' and active_flg = 'Y');
select * from db_load_in_ucm where headquarterparent_county not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'COUNTY' and active_flg = 'Y');
select * from db_load_in_ucm where global_ultimate_county not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'COUNTY' and active_flg = 'Y');
-- must return no rows

-- check correctness of CONTINENT fields
select * from db_load_in_ucm where legal_entity_continent not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'CONTINENT' and active_flg = 'Y');
select * from db_load_in_ucm where mailing_address_continent not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'CONTINENT' and active_flg = 'Y');
select * from db_load_in_ucm where headquarterparent_continent not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'CONTINENT' and active_flg = 'Y');
select * from db_load_in_ucm where global_ultimate_continent not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'CONTINENT' and active_flg = 'Y');
-- must return no rows

-- check length of PHONE_NUMBER field
select * from db_load_in_ucm where length(phone_phone_number) > 30;
-- must return no rows

-- check length of FAX_PHONE_NUMBER field
select * from db_load_in_ucm where length(fax_phone_number) > 30;
-- must return no rows

-- Line of Business
select count(*) from db_load_in_ucm
where length(line_of_business) > 30;
-- must return no rows

-- update db_load_in_ucm set line_of_business = substr(line_of_business, 1, 30) where length(line_of_business) > 30;

-- check correctness of SIC codes
select * from db_load_in_ucm where sic_code_1 not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'SIC_CODE' and active_flg = 'Y') or
sic_code_2 not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'SIC_CODE' and active_flg = 'Y') or
sic_code_3 not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'SIC_CODE' and active_flg = 'Y') or
sic_code_4 not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'SIC_CODE' and active_flg = 'Y') or
sic_code_5 not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'SIC_CODE' and active_flg = 'Y') or
sic_code_6 not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'SIC_CODE' and active_flg = 'Y');
-- must return no rows

-- check correctness of IMPORTEXPORTAGENT_INDICATOR field
select * from db_load_in_ucm where IMPORTEXPORTAGENT_INDICATOR not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'IMP_EXP_AGT_IND' and active_flg = 'Y');
-- must return no rows

-- check correctness of LEGAL_STATUS field
select * from db_load_in_ucm where LEGAL_STATUS not in (select name from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'FINCORP_CLIENT_LEGAL_FORM' and active_flg = 'Y');
-- must return no rows

-- update db_load_in_ucm set LEGAL_STATUS = null where LEGAL_STATUS = '000';

-- check correctness of STATUS_CODE field
select * from db_load_in_ucm where STATUS_CODE not in (select val from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM 
where type = 'ACCOUNT_STATUS' and active_flg = 'Y');
-- must return no rows

--update db_load_in_ucm set status_code = null where STATUS_CODE not in (select val from s_lst_of_val@SIEBEL.REGRESS.RDBMS.DEV.US.ORACLE.COM@AREVA_UCM where type = 'ACCOUNT_STATUS' and active_flg = 'Y');

-- check correctness of SUBSIDIARY_CODE field
select * from db_load_in_ucm where SUBSIDIARY_CODE not in ('N','Y');
-- must return no rows

-- update db_load_in_ucm set SUBSIDIARY_CODE = null where SUBSIDIARY_CODE not in ('N','Y');

-- CEO Title
select count(*) from db_load_in_ucm where length(chief_executive_officer_title) > 30;
-- must return no rows

-- update db_load_in_ucm set chief_executive_officer_title = substr(chief_executive_officer_title, 1, 30) where length(chief_executive_officer_title) > 30;

-- check correctness of YEAR_STARTED field
select distinct to_date(YEAR_STARTED,'YYYY') from db_load_in_ucm;
-- must return no errors

-- check correctness of REPORT_DATE field
select distinct to_date(REPORT_DATE,'YYYYMMDD') from db_load_in_ucm;
-- must return no errors

-- check correctness of FAMILY_UPDATE_DATE field
select distinct to_date(FAMILY_UPDATE_DATE,'YYYYMMDD') from db_load_in_ucm;
-- must return no errors