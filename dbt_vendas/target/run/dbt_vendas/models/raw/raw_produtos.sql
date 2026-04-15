
  
    

  create  table "postgres"."public_raw"."raw_produtos__dbt_tmp"
  
  
    as
  
  (
    select * from "postgres"."oltp"."produtos"
  );
  