Question:

Companies often want region-specific analysis to plan local marketing, staffing, or promotions in certain areas—here, specifically, New York.

Solution:

select
    oisg.facility_id,
    f.facility_name,
    count(oisg.shipment_method_type_id) as total_one_day_shipped_orders,
    date_format(curdate() - interval 1 month, '%Y-%m') as reporting_period
from
    order_item_ship_group oisg
join 
    facility f
    on f.facility_id = oisg.facility_id
where 
    (oisg.shipment_method_type_id = 'EXPRESS' 
     or oisg.shipment_method_type_id = 'SAME_DAY' 
     or oisg.shipment_method_type_id = 'NEXT_DAY')
    and oisg.created_tx_stamp >= date_format(curdate() - interval 1 month, '%Y-%m-01')
    and oisg.created_tx_stamp < date_format(curdate(), '%Y-%m-01') 
group by  
    oisg.facility_id, f.facility_name
order by 
    total_one_day_shipped_orders desc
limit 1; 

Query Cost: 1.76

