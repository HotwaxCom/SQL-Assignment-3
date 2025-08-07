Question:

Analyzing orders with multiple returns can identify potential fraud, chronic issues with certain items, or inconsistent shipping processes.

Fields to retrieve:
-ORDER_ID
-RETURN_ID
-RETURN_DATE
-RETURN_REASON
-RETURN_QUANTITY


Solution:

select
    ri.order_id,
    ri.return_id,
    rh.return_date,
    ri.reason as return_reason,
    ri.return_quantity
from return_header rh
join return_item ri
    on rh.return_id = ri.return_id
where ri.order_id in (
    select ri.order_id
    from return_item ri
    group by ri.order_id
    having count(ri.return_id) > 1
)
order by 
	ri.order_id;

Query Cost: 6,009.85
```
