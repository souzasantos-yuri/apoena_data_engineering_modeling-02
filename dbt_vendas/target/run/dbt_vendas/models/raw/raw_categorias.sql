
  
    

  create  table "postgres"."public_raw"."raw_categorias__dbt_tmp"
  
  
    as
  
  (
    select * from "postgres"."oltp"."categorias"
  );
  