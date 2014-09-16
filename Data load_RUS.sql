-- 1 Load the EIM_UCM_CON table from the Contact source data file -> OK

-- 2 Update EIM_UCM_CON Ids -> OK

update siebel.eim_ucm_con
  set row_id = 'CON-RUS-' || row_id, ucm_uid = 'CON-RUS-' || ucm_uid, UCM_EXT_ID = 'CON-RUS-' || UCM_EXT_ID;

-- 3 Load the EIM_UCM_ADRPER table from the Contact source data file -> OK

-- 4 Update EIM_UCM_ADRPER Ids for Contacts -> OK

update siebel.eim_ucm_adrper
  set row_id = 'CON-RUS-' || row_id, ucm_uid = 'CON-RUS-' || ucm_uid, par_ucm_con_uid = 'CON-RUS-' || par_ucm_con_uid;
  
-- 5 Load the EIM_UCM_ORG_TMP table from the Chain source data file -> OK
  
-- 6 Truncate EIM_UCM_ORG table -> OK

delete from siebel.EIM_UCM_ORG;
  
-- 7 Load the EIM_UCM_ORG table for Chains -> OK

INSERT INTO siebel.EIM_UCM_ORG (
  ROW_ID,
  IF_ROW_BATCH_NUM,
  IF_ROW_STAT,
  LOC,
  NAME,
  LOCATION_LEVEL,
  ACCNT_TYPE_CD,
  LEGAL_FORM_CD,
  MAIN_PH_NUM,
  MAIN_EMAIL_ADDR,
  URL,
  UCM_EXT_ID,
  UCM_TYPE_CD,
  UCM_UID,
  EXT_SYSTEM_NUM,
  PR_ADDR,
  PR_CITY,
  PR_PROVINCE,
  PR_COUNTRY,
  PR_ZIPCODE,
  PAR_UCM_CON_UID,
  OU_TYPE_CD,
  VAT_REGN_NUM,
  GSA_FLG,
  OU_NUM
)
  select
    'CHA-RUS-' || rownum,
    EIM_UCM_ORG_TMP.IF_ROW_BATCH_NUM,
    EIM_UCM_ORG_TMP.IF_ROW_STAT,
    EIM_UCM_ORG_TMP.LOC,
    EIM_UCM_ORG_TMP.NAME,
    EIM_UCM_ORG_TMP.LOCATION_LEVEL,
    EIM_UCM_ORG_TMP.ACCNT_TYPE_CD,
    EIM_UCM_ORG_TMP.LEGAL_FORM_CD,
    EIM_UCM_ORG_TMP.MAIN_PH_NUM,
    EIM_UCM_ORG_TMP.MAIN_EMAIL_ADDR,
    EIM_UCM_ORG_TMP.URL,
    'CHA-RUS-' || EIM_UCM_ORG_TMP.UCM_EXT_ID,
    EIM_UCM_ORG_TMP.UCM_TYPE_CD,
    'CHA-RUS-' || rownum,
    EIM_UCM_ORG_TMP.EXT_SYSTEM_NUM,
    EIM_UCM_ORG_TMP.PR_ADDR,
    EIM_UCM_ORG_TMP.PR_CITY,
    EIM_UCM_ORG_TMP.PR_PROVINCE,
    EIM_UCM_ORG_TMP.PR_COUNTRY,
    EIM_UCM_ORG_TMP.PR_ZIPCODE,
    EIM_UCM_CON.UCM_UID,
    EIM_UCM_ORG_TMP.OU_TYPE_CD,
    EIM_UCM_ORG_TMP.VAT_REGN_NUM,
    EIM_UCM_ORG_TMP.GSA_FLG,
    EIM_UCM_ORG_TMP.OU_NUM
  from sadmin.EIM_UCM_ORG_TMP left join siebel.EIM_UCM_CON on sadmin.EIM_UCM_ORG_TMP.OU_NUM = siebel.EIM_UCM_CON.COMMENTS;

-- 8 Load the EIM_UCM_ORG_TMP table from the Organization source data file -> OK
  
-- 9 Load the EIM_UCM_ADRPER_TMP table from the Organization source data file -> OK
  
-- 10 Load the EIM_UCM_ORG table for Organizations -> OK

INSERT INTO siebel.EIM_UCM_ORG (
  ROW_ID,
  IF_ROW_BATCH_NUM,
  IF_ROW_STAT,
  LOC,
  NAME,
  LOCATION_LEVEL,
  ACCNT_TYPE_CD,
  LEGAL_FORM_CD,
  MAIN_PH_NUM,
  MAIN_EMAIL_ADDR,
  URL,
  UCM_EXT_ID,
  UCM_TYPE_CD,
  UCM_UID,
  EXT_SYSTEM_NUM,
  PR_ADDR,
  PR_CITY,
  PR_PROVINCE,
  PR_COUNTRY,
  PR_ZIPCODE,
  PAR_UCM_CON_UID,
  OU_TYPE_CD,
  VAT_REGN_NUM,
  GSA_FLG,
  OU_NUM
)
  select
    'ORG-RUS-' || rownum,
    EIM_UCM_ORG_TMP.IF_ROW_BATCH_NUM,
    EIM_UCM_ORG_TMP.IF_ROW_STAT,
    EIM_UCM_ORG_TMP.LOC,
    EIM_UCM_ORG_TMP.NAME,
    EIM_UCM_ORG_TMP.LOCATION_LEVEL,
    EIM_UCM_ORG_TMP.ACCNT_TYPE_CD,
    EIM_UCM_ORG_TMP.LEGAL_FORM_CD,
    EIM_UCM_ORG_TMP.MAIN_PH_NUM,
    EIM_UCM_ORG_TMP.MAIN_EMAIL_ADDR,
    EIM_UCM_ORG_TMP.URL,
    'ORG-RUS-' || EIM_UCM_ORG_TMP.UCM_EXT_ID,
    EIM_UCM_ORG_TMP.UCM_TYPE_CD,
    'ORG-RUS-' || rownum,
    EIM_UCM_ORG_TMP.EXT_SYSTEM_NUM,
    EIM_UCM_ORG_TMP.PR_ADDR,
    EIM_UCM_ORG_TMP.PR_CITY,
    EIM_UCM_ORG_TMP.PR_PROVINCE,
    EIM_UCM_ORG_TMP.PR_COUNTRY,
    EIM_UCM_ORG_TMP.PR_ZIPCODE,
    EIM_UCM_CON.UCM_UID,
    EIM_UCM_ORG_TMP.OU_TYPE_CD,
    EIM_UCM_ORG_TMP.VAT_REGN_NUM,
    EIM_UCM_ORG_TMP.GSA_FLG,
    EIM_UCM_ORG_TMP.OU_NUM
  from sadmin.EIM_UCM_ORG_TMP left join siebel.EIM_UCM_CON on sadmin.EIM_UCM_ORG_TMP.OU_NUM = siebel.EIM_UCM_CON.COMMENTS;

-- 11 Load the EIM_UCM_ADRPER table for Organizations -> OK

INSERT INTO siebel.EIM_UCM_ADRPER (
  ROW_ID,
  IF_ROW_BATCH_NUM,
  IF_ROW_STAT,
  UCM_TYPE_CD,
  UCM_UID,
  PAR_UCM_ACCNT_UID,
  PAR_UCM_OBJTYPE_CD,
  EXT_SYSTEM_NUM,
  CITY,
  COUNTRY,
  ZIPCODE,
  PR_CHILD_FLG,
  PROVINCE,
  ADDR,
  STATE,
  ADDR_TYPE_CD,
  ADDR_LINE_2,
  ADDR_LINE_3
)
  select
    'ORG-RUS-' || rownum,
    EIM_UCM_ADRPER_TMP.IF_ROW_BATCH_NUM,
    EIM_UCM_ADRPER_TMP.IF_ROW_STAT,
    EIM_UCM_ADRPER_TMP.UCM_TYPE_CD,
    'ORG-RUS-' || rownum,
    EIM_UCM_ORG.UCM_UID,
    EIM_UCM_ADRPER_TMP.PAR_UCM_OBJTYPE_CD,
    EIM_UCM_ADRPER_TMP.EXT_SYSTEM_NUM,
    EIM_UCM_ADRPER_TMP.CITY,
    EIM_UCM_ADRPER_TMP.COUNTRY,
    EIM_UCM_ADRPER_TMP.ZIPCODE,
    EIM_UCM_ADRPER_TMP.PR_CHILD_FLG,
    EIM_UCM_ADRPER_TMP.PROVINCE,
    EIM_UCM_ADRPER_TMP.ADDR,
    EIM_UCM_ADRPER_TMP.STATE,
    EIM_UCM_ADRPER_TMP.ADDR_TYPE_CD,
    EIM_UCM_ADRPER_TMP.ADDR_LINE_2,
    EIM_UCM_ADRPER_TMP.ADDR_LINE_3
  from sadmin.EIM_UCM_ADRPER_TMP inner join siebel.EIM_UCM_ORG ON ('ORG-RUS-' || sadmin.EIM_UCM_ADRPER_TMP.PAR_UCM_ACCNT_UID) = siebel.EIM_UCM_ORG.UCM_EXT_ID;
      
-- 12 Load the EIM_UCM_ORG_TMP table from the Facility source data file -> OK
  
-- 13 Load the EIM_UCM_ADRPER_TMP table from the Facility source data file -> OK
  
-- 14 Load the EIM_UCM_ORG table for Facilities -> OK

INSERT INTO siebel.EIM_UCM_ORG (
  ROW_ID,
  IF_ROW_BATCH_NUM,
  IF_ROW_STAT,
  LOC,
  NAME,
  LOCATION_LEVEL,
  ACCNT_TYPE_CD,
  LEGAL_FORM_CD,
  MAIN_PH_NUM,
  MAIN_EMAIL_ADDR,
  URL,
  UCM_EXT_ID,
  UCM_TYPE_CD,
  UCM_UID,
  EXT_SYSTEM_NUM,
  PR_ADDR,
  PR_CITY,
  PR_PROVINCE,
  PR_COUNTRY,
  PR_ZIPCODE,
  PAR_UCM_CON_UID,
  OU_TYPE_CD,
  VAT_REGN_NUM,
  GSA_FLG,
  OU_NUM
)
  select
    'FAC-RUS-' || rownum,
    EIM_UCM_ORG_TMP.IF_ROW_BATCH_NUM,
    EIM_UCM_ORG_TMP.IF_ROW_STAT,
    EIM_UCM_ORG_TMP.LOC,
    EIM_UCM_ORG_TMP.NAME,
    EIM_UCM_ORG_TMP.LOCATION_LEVEL,
    EIM_UCM_ORG_TMP.ACCNT_TYPE_CD,
    EIM_UCM_ORG_TMP.LEGAL_FORM_CD,
    EIM_UCM_ORG_TMP.MAIN_PH_NUM,
    EIM_UCM_ORG_TMP.MAIN_EMAIL_ADDR,
    EIM_UCM_ORG_TMP.URL,
    'FAC-RUS-' || EIM_UCM_ORG_TMP.UCM_EXT_ID,
    EIM_UCM_ORG_TMP.UCM_TYPE_CD,
    'FAC-RUS-' || rownum,
    EIM_UCM_ORG_TMP.EXT_SYSTEM_NUM,
    EIM_UCM_ORG_TMP.PR_ADDR,
    EIM_UCM_ORG_TMP.PR_CITY,
    EIM_UCM_ORG_TMP.PR_PROVINCE,
    EIM_UCM_ORG_TMP.PR_COUNTRY,
    EIM_UCM_ORG_TMP.PR_ZIPCODE,
    EIM_UCM_CON.UCM_UID,
    EIM_UCM_ORG_TMP.OU_TYPE_CD,
    EIM_UCM_ORG_TMP.VAT_REGN_NUM,
    EIM_UCM_ORG_TMP.GSA_FLG,
    EIM_UCM_ORG_TMP.OU_NUM
  from sadmin.EIM_UCM_ORG_TMP left join siebel.EIM_UCM_CON on sadmin.EIM_UCM_ORG_TMP.OU_NUM = siebel.EIM_UCM_CON.COMMENTS;

-- 15 Load the EIM_UCM_ADRPER table for Facilities -> OK

INSERT INTO siebel.EIM_UCM_ADRPER (
  ROW_ID,
  IF_ROW_BATCH_NUM,
  IF_ROW_STAT,
  UCM_TYPE_CD,
  UCM_UID,
  PAR_UCM_ACCNT_UID,
  PAR_UCM_OBJTYPE_CD,
  EXT_SYSTEM_NUM,
  CITY,
  COUNTRY,
  ZIPCODE,
  PR_CHILD_FLG,
  PROVINCE,
  ADDR,
  STATE,
  ADDR_TYPE_CD,
  ADDR_LINE_2,
  ADDR_LINE_3
)
  select
    'FAC-RUS-' || rownum,
    EIM_UCM_ADRPER_TMP.IF_ROW_BATCH_NUM,
    EIM_UCM_ADRPER_TMP.IF_ROW_STAT,
    EIM_UCM_ADRPER_TMP.UCM_TYPE_CD,
    'FAC-RUS-' || rownum,
    EIM_UCM_ORG.UCM_UID,
    EIM_UCM_ADRPER_TMP.PAR_UCM_OBJTYPE_CD,
    EIM_UCM_ADRPER_TMP.EXT_SYSTEM_NUM,
    EIM_UCM_ADRPER_TMP.CITY,
    EIM_UCM_ADRPER_TMP.COUNTRY,
    EIM_UCM_ADRPER_TMP.ZIPCODE,
    EIM_UCM_ADRPER_TMP.PR_CHILD_FLG,
    EIM_UCM_ADRPER_TMP.PROVINCE,
    EIM_UCM_ADRPER_TMP.ADDR,
    EIM_UCM_ADRPER_TMP.STATE,
    EIM_UCM_ADRPER_TMP.ADDR_TYPE_CD,
    EIM_UCM_ADRPER_TMP.ADDR_LINE_2,
    EIM_UCM_ADRPER_TMP.ADDR_LINE_3
  from sadmin.EIM_UCM_ADRPER_TMP inner join siebel.EIM_UCM_ORG ON ('FAC-RUS-' || sadmin.EIM_UCM_ADRPER_TMP.PAR_UCM_ACCNT_UID) = siebel.EIM_UCM_ORG.UCM_EXT_ID;
      
-- COPY THE PROVINCE FIELD IN THE STATE FIELD -> OK

update siebel.eim_ucm_adrper set state = substr(province, 1, 10);

-- DELETE ADDRESSES NOT HAVING COUNTRY, CITY AND STREET ADDRESS SPECIFIED -> OK

delete from siebel.EIM_UCM_ADRPER where country is null or city is null or addr is null;

-- SET THE PERSON NAME -> OK

update siebel.eim_ucm_con set pr_sms_num = substr(eim_ucm_con.fst_name || ' ' || eim_ucm_con.last_name , 1, 100);