create view gold.dim_products as
select
row_number() over(order by prd_start_dt,pr.prd_key) as product_key,
pr.prd_id as product_id,
pr.prd_key as product_number,
pr.prd_nm as product_name,
pr.cat_id as category_id,
pc.cat as category,
pc.subcat as sub_category,
pc.maintenance,
pr.prd_line as product_line,
pr.prd_cost as product_cost,
pr.prd_start_dt as product_start_dt
from silver.crm_prd_info pr left join silver.erp_px_cat_g1v2 pc on pr.cat_id=pc.id
where prd_end_dt is null


