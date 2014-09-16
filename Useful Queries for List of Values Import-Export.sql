select LOV_LANG_ID	,
LOV_TYPE	,
LOV_VAL	,
LOV_ACTIVE_FLG	,
LOV_DFLT_LIC_FLG	,
LOV_MODIFIABLE_FLG	,
LOV_MORG_DSALW_FLG	,
LOV_MULTILINGUALFL	,
LOV_ORDER_BY	,
LOV_REQD_LIC_FLG	,
LOV_TRANSLATE_FLG	,
LOV_DESC_TEXT	,
LOV_HIGH	,
LOV_LOW	,
LOV_NAME	,
LOV_RPLCTN_LVL_CD,
LOV_CODE
from eim_lst_of_val order by lov_type asc;

select LOV_TYPE, LOV_VAL, count(*) from eim_lst_of_val group by LOV_TYPE, LOV_VAL having count(*) > 1;

select LOV_TYPE, LOV_NAME, count(*) from eim_lst_of_val group by LOV_TYPE, LOV_NAME having count(*) > 1;

delete from eim_lst_of_val;

delete from s_lst_of_val where type in ('ACCOUNT_CATEGORY','ACCOUNT_TYPE','ACCOUNT_SUBTYPE','ACCOUNT_STATUS',
'FINCORP_CLIENT_LEGAL_FORM','CUT_ACCOUNT_TYPE','IMP_EXP_AGT_IND','ADDR_TYPE','CONTINENT','KEY_ACCOUNT_TYPE',
'KEY_ACCOUNT_CLASS','ACCOUNT_OWNERSHIP','FIN_PHONE_USAGE','PARTY_RELATIONSHIP_TYPE','COUNTRY','SIC_CODE','COUNTY');

update eim_lst_of_val set lov_val = upper(lov_val), lov_name = upper(lov_name);

select distinct if_row_stat from eim_lst_of_val;

select * from eim_lst_of_val where if_row_stat = 'NON_UNIQUE_UKEYS';

select
		IND_SIC,
		IND_NEWSACTIVE_FLG,
		IND_DESC_TEXT,
		IND_LANG_ID,
		IND_NAME,
		IND_SUB_TYPE,
		PAR_INDST_LANG_CD,
		PAR_INDST_SIC
from eim_industry order by par_indst_sic asc, ind_sic asc;

select distinct if_row_stat from eim_industry;

select ind_sic, count(*) from eim_industry group by ind_sic having count(*) > 1;

update eim_industry set ind_sic = upper(ind_sic), ind_desc_text = upper(ind_desc_text), ind_name = upper(ind_name), par_indst_sic=upper(par_indst_sic);

delete from eim_industry where row_id = 1;

select curcy_cd, NAME, ISSUING_COUNTRY, curcy_symbol, active_flg from eim_curcy;

select curcy_cd from eim_curcy where active_flg = 'Y' order by curcy_cd asc;

select * from eim_curcy where if_row_stat <> 'IMPORTED';

update eim_curcy set issuing_country = 'RUSSIAN FEDERATION' where issuing_country = 'RUSSIA';

update eim_curcy set issuing_country = 'KOREA, REPUBLIC OF' where issuing_country = 'KOREA';

update eim_curcy set issuing_country = 'TAIWAN, PROVINCE OF CHINA' where issuing_country = 'TAIWAN';

update eim_curcy set issuing_country = 'VIET NAM' where issuing_country = 'VIETNAM';

update eim_curcy set issuing_country = 'FRANCE' where issuing_country = 'EUROPEAN MONETARY UNION';

update eim_curcy set issuing_country = upper(issuing_country);

select * from s_indust where row_id = '1-588G';

delete from s_indust;