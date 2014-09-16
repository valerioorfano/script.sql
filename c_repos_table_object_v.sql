CREATE OR REPLACE VIEW C_REPOS_TABLE_OBJECT_V
AS
select 'C' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXCL.START_CLEANSE'  object_name
     , NVL(UNISTR('') || xf.Map_name, UNISTR('\30b9\30c6\30fc\30b8\30f3\30b0\5148\003a ' || ts.display_name)) object_desc
     , 'P' object_type_code
     , 'C' object_function_type_code
     , 1 public_ind
     , 'C' || trim(ts.rowid_table) ||', ERR_MSG, RETURN_CODE, IN_STG_ROWID_TABLE, IN_RUN_SYNCH, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM ' parameter
     , 1 valid_ind
  from c_repos_table ts
     , C_REPOS_CL_TABLE_FUNCTION_MAP xf
 where ts.type_ind = 10
   and ts.rowid_table = xf.rowid_tgt_table
 UNION
select trim(t0.rowid_table) || trim(ts.rowid_table) rowid_table_object
     , t0.rowid_table rowid_table
     , 'CMXLD.LOAD_MASTER'  object_name
     , UNISTR('\30ed\30fc\30c9\5143\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'L' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERROR_MSG, RETURN_CODE, FORCE_UPDATE_IND, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM ' parameter
     , 1 valid_ind
  from c_repos_table t0, c_repos_table ts
 where t0.rowid_table = ts.rowid_parent
   and ts.type_ind = 10
 UNION
select 'B' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMA.MATCH_AND_MERGE'  object_name
     , UNISTR('\4e00\81f4\3068\30de\30fc\30b8\3092\884c\3046\5bfe\8c61\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'B' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', IN_MATCH_SET_NAME, ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1 and ts.match_link_enabled_ind = 0
 UNION
select 'N' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMA.GENERATE_MATCH_TOKENS'  object_name
     , UNISTR('\4e00\81f4\30c8\30fc\30af\30f3\3092\751f\6210\3059\308b\5bfe\8c61\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'N' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM, IN_FULL_RESTRIP_IND '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1
 and ts.exact_match_object_ind = 0
 UNION
select 'M' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMA.MATCH'  object_name
     , UNISTR('\4e00\81f4\3092\884c\3046\5bfe\8c61\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'M' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, null, 0, IN_MATCH_SET_NAME, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1
 UNION
 select 'LM' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMA.LINK_TABLE_MANAGEMENT'  object_name
     , UNISTR('\30ea\30f3\30af\7ba1\7406\306e\5bfe\8c61\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'LM' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1
   and ts.link_management_ind = 1
 UNION
select 'Z' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMA.MATCH'  object_name
     , UNISTR('\4e00\81f4\5206\6790\3092\884c\3046\5bfe\8c61\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'Z' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, null, 1, IN_MATCH_SET_NAME, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1
 and ts.exact_match_object_ind = 0
 UNION
select 'K' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMA.KEY_MATCH'  object_name
     , UNISTR('\30ad\30fc\4e00\81f4\3092\884c\3046\5bfe\8c61\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'K' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1
   and exists (select 1 from c_repos_key_match where rowid_table = ts.rowid_table)
 UNION
select 'G' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMM.AUTOMERGE'  object_name
     , UNISTR('\30de\30fc\30b8\3059\308b\30c7\30fc\30bf\306e\5834\6240\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'G' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1 and ts.match_link_enabled_ind = 0
 UNION
select 'E' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMA.EXTERNAL_MATCH'  object_name
     , UNISTR('\5916\90e8\4e00\81f4\3092\884c\3046\5bfe\8c61\003a ') || ts.table_name object_desc
     , 'P' object_type_code
     , 'E' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', IN_MATCH_SET_NAME, ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1
 UNION
select 'W' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMA.RESET_LINKS'  object_name
     , UNISTR('\30ea\30f3\30af\3092\30ea\30bb\30c3\30c8\3059\308b\5bfe\8c61 ') || ts.table_name object_desc
     , 'P' object_type_code
     , 'W' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1 and ts.match_link_enabled_ind = 1
 UNION
select 'I' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXMM.AUTOLINK'  object_name
     , UNISTR('\30ea\30f3\30af\3059\308b\30c7\30fc\30bf\306e\5834\6240 ') || ts.table_name object_desc
     , 'P' object_type_code
     , 'I' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1 and ts.match_link_enabled_ind = 1
 UNION
 select 'V' || trim(ts.rowid_table) rowid_table_object
      , ts.rowid_table rowid_table
      , 'CMXBV.GENERATE_SNAPSHOT'  object_name
      , UNISTR('\6700\5584\30c7\30fc\30bf\306e\30b9\30ca\30c3\30d7\30b7\30e7\30c3\30c8\3092\751f\6210\3059\308b\5bfe\8c61\003a ') || ts.table_name object_desc
      , 'P' object_type_code
      , 'V' object_function_type_code
      , 1 public_ind
      , ts.rowid_table || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
      , 1 valid_ind
   from c_repos_table ts
 where ts.type_ind = 1 and ts.match_link_enabled_ind = 1
  UNION
select 'S' || rtrim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXUT.SYNC'  object_name
     , UNISTR('\30e1\30bf\30c7\30fc\30bf\3092\540c\671f\3059\308b\5bfe\8c61\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'S' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , c1.dirty_ctl_ind valid_ind
  from c_repos_table ts
     , (select rowid_table, max(dirty_ctl_ind) dirty_ctl_ind from c_repos_column group by rowid_table) c1
 where ts.type_ind = 1
   and ts.rowid_table = c1.rowid_table
   and (c1.dirty_ctl_ind = 1
        or exists (select 1 from c_repos_job_control
                    where rowid_table_object = rtrim(ts.rowid_table) || 'S'))
 UNION
select 'PR' || TRIM(ts.rowid_table) rowid_table_object
     , t0.rowid_table rowid_table
     , 'CMXSM.AUTO_PROMOTE'  object_name
     , UNISTR('\6607\683c\3059\308b\30d5\30e9\30b0\4ed8\304d\30ec\30b3\30fc\30c9\306e\5834\6240\003a ') || ts.display_name object_desc
     , 'P' object_type_code
     , 'PR' object_function_type_code
     , 1 public_ind
     , t0.rowid_table || ', ERROR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM ' parameter
     , 1 valid_ind
  from c_repos_table t0, c_repos_table ts
 where t0.rowid_table = ts.rowid_parent
   and ts.type_ind = 2
   and t0.state_management_ind = 1
 UNION
 SELECT 'H' || TRIM(ts.rowid_table) rowid_table_object
      , ts.rowid_table rowid_table
      , 'CMXUT.REVALIDATE_BO'  object_name
      , UNISTR('\518d\691c\8a3c\3059\308b\5bfe\8c61\003a ') || ts.table_name object_desc
      , 'P' object_type_code
      , 'H' object_function_type_code
      , 1 public_ind
      , ts.table_name || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
      , 1 valid_ind
   FROM c_repos_table ts
  WHERE ts.type_ind = 1
    AND EXISTS(SELECT 1
                 FROM c_repos_column c
                WHERE c.rowid_table = ts.rowid_table
                  AND EXISTS (SELECT 1
                                FROM c_repos_valid_rule_col r
                               WHERE r.rowid_column=c.rowid_column))
 UNION
select 'FK' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXUT.VALIDATE_BO_FKS'  object_name
     , UNISTR('\5916\90e8\30ad\30fc\30ea\30ec\30fc\30b7\30e7\30f3\3092\691c\8a3c\3059\308b\5bfe\8c61\003a ') || ts.table_name object_desc
     , 'P' object_type_code
     , 'FK' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1
 UNION
 select 'ZB' || trim(ts.rowid_table) rowid_table_object
     , ts.rowid_table rowid_table
     , 'CMXZDT.backfill_batch'  object_name
     , UNISTR('\30c7\30fc\30bf\306e\30d0\30c3\30af\30d5\30a3\30eb\3092\884c\3046\5bfe\8c61\003a ') || ts.table_name object_desc
     , 'P' object_type_code
     , 'ZB' object_function_type_code
     , 1 public_ind
     , ts.rowid_table || ', ERR_MSG, RETURN_CODE, NULL, IN_DIRTY_ONLY_IND, ROWID_JOB_GRP_CTRL, ROWID_JOB_GRP_ITEM '  parameter
     , 1 valid_ind
  from c_repos_table ts
 where ts.type_ind = 1 AND exists (select 1 from c_repos_zdt_backfill_task b where b.rowid_table = ts.rowid_table)
 AND EXISTS(SELECT 1 FROM c_repos_db_release WHERE zdt_ind= 1)
 AND EXISTS(SELECT 1 FROM c_repos_zdt_status WHERE replication_target_ind= 1)
  UNION
select rtrim(rowid_table_object) rowid_table_object
     , rowid_table
     , object_name
     , UNISTR('') || object_desc object_desc
     , object_type_code
     , object_function_type_code
     , public_ind
     , parameter
     , decode(object_function_type_code,'A',1,0) valid_ind
  from c_repos_table_object
 where object_type_code = 'P';
 
