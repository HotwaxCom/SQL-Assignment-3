Question:

Identify which facility (store) handled the highest volume of “one-day shipping” orders in the previous month, useful for operational benchmarking.

Fields to retrieve:
-FACILITY_ID
-FACILITY_NAME
-TOTAL_ONE_DAY_SHIP_ORDERS
-REPORTING_PERIOD

Solution:

select
    oisg.facility_id,
    f.facility_name,
    count(distinct(oisg.order_id)) as total_one_day_shipped_orders,
    date_format(curdate() - interval 1 month, '%Y-%m') as reporting_period
from
    order_item_ship_group oisg
join item_issuance ii
	on ii.order_id = oisg.order_id
join 
    facility f
    on f.facility_id = oisg.facility_id
where 
    oisg.shipment_method_type_id IN ('EXPRESS','SAME_DAY','NEXT_DAY')
    and ii.issued_date_time >= DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01')
    and ii.issued_date_time <  DATE_FORMAT(CURDATE(), '%Y-%m-01')
group by  
    oisg.facility_id, f.facility_name
order by 
    total_one_day_shipped_orders desc
limit 1;

Query Cost: 15,440.34

