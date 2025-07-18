Question:

Analyzing orders with multiple returns can identify potential fraud, chronic issues with certain items, or inconsistent shipping processes.

Solution:

select
    ri.order_id,
    ri.return_id,
    rh.return_date,
    ri.reason as return_reason,
    ri.return_quantity
from return_item ri
join return_header rh
    on rh.return_id = ri.return_id
where ri.order_id in (
    select ri.order_id
    from return_item ri
    group by ri.order_id
    having count(ri.return_id) > 1
)
order by 
	ri.order_id;

Query Cost: 6,933.22
```
