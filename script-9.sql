Select
    pf.product_id,
    p.internal_name as product_internal_name,
    count(pf.facility_id) as facility_count,
    group_concat(distinct pf.facility_id) as facility_ids
from  
    product_facility pf
join
    product p
    on p.product_id = pf.product_id
group by 
    pf.product_id, p.internal_name;
		
		
