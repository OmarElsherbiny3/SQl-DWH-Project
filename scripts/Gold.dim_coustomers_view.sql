create view gold.dim_customers as

select
row_number() over (order by cst_id) as customer_key,
ci.cst_id as customer_id,
ci.cst_key as  customer_number,
ci.cst_firstname as customer_firstname,
ci.cst_lastname as customer_lastname,
CASE 
WHEN ci.cst_gndr IS NOT NULL 
     AND ci.cst_gndr NOT IN ('n/a','unknown') 
THEN ci.cst_gndr
ELSE COALESCE(cs.gen, 'n/a')
END as new_customer_gndr,
ci.cst_marital_status as  customer_marital_status,

ci.cst_create_date as customer_create_date,
cs.BDATE as customer_BDATE,
la.cntry as customer_country
from silver.crm_cust_info ci 
left join silver.erp_CUST_AZ12 cs 
on ci.cst_key=cs.CID 
left join silver.erp_Loc_a101 la on ci.cst_key=la.cid




