
  
    

  create  table "postgres"."public_raw"."raw_clientes__dbt_tmp"
  
  
    as
  
  (
    select * from "postgres"."oltp"."clientes"
  );
  