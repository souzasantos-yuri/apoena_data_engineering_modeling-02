
  
    

  create  table "postgres"."public_raw"."raw_itens_pedido__dbt_tmp"
  
  
    as
  
  (
    select * from "postgres"."oltp"."itens_pedido"
  );
  