
  
    

  create  table "postgres"."public_raw"."raw_vendedores__dbt_tmp"
  
  
    as
  
  (
    select * from "postgres"."oltp"."vendedores"
  );
  