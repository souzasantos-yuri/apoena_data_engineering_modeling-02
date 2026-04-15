
  
    

  create  table "postgres"."public_raw"."raw_pedidos__dbt_tmp"
  
  
    as
  
  (
    select * from "postgres"."oltp"."pedidos"
  );
  