Question:

Customer service and finance often need insights into returned items to manage refunds, replacements, and inventory restocking.

Solution:

select
	ri.return_id,
	ri.order_id,
	oh.product_store_id,
	rs.status_datetime,
	oh.order_name,
	rh.from_party_id,
	rh.entry_date as return_date,
	rh.return_channel_enum_id
from return_item ri
join return_header rh
	on ri.return_id=rh.RETURN_ID
join return_status rs
	on rs.return_id=rh.return_id
join order_header oh
	on oh.order_id=ri.order_id
	where rh.status_id=rs.status_id
	and ri.return_item_seq_id=rs.return_item_seq_id
	order by return_id;

Query Cost: 15,327.48
