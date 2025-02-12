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
 