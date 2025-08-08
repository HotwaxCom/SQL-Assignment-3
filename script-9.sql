Question:

Retailers want to see how many (and which) facilities (stores, warehouses, virtual sites) currently offer a product for sale.

Fields to retrieve:
-PRODUCT_ID
-PRODUCT_NAME (or INTERNAL_NAME)
-FACILITY_COUNT (number of facilities selling the product)
-(Optionally) a list of FACILITY_IDs if more detail is needed

Solution:
	
Select
    pf.product_id,
    p.internal_name as product_internal_name,
    count(pf.facility_id) as facility_count,
    group_concat(distinct pf.facility_id) as facility_ids
from  
    product_facility pf
join
    product p
    on p.product_id = pf.product_id and p.is_virtual = "N" and is_variant = "Y"
group by 
    pf.product_id;

Query Cost: 138,177.51

