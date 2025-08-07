Question:

A picklist is necessary for warehouse staff to gather items. Orders missing a picklist might be delayed and need attention. Find orders without picklist.

Fields to retrieve:
-ORDER_ID
-ORDER_DATE
-ORDER_STATUS
-FACILITY_ID
-DURATION (How long has the order been assigned at the facility)

Solution:

select
    os.order_id,
    oh.order_date,
    oh.status_id as order_status,
    s.origin_facility_id as facility_id,
    ofc.change_datetime as duration
from order_shipment os
left join picklist_bin pb
    on pb.primary_order_id = os.order_id and pb.picklist_id is null
join order_header oh 
    on oh.order_id = os.order_id
join shipment s 
    on os.shipment_id = s.shipment_id 
left join order_facility_change ofc 
    on ofc.order_id = os.order_id
order by os.order_id;

Query Cost: 729,954.4
