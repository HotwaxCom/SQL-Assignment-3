select 
	rh.return_id,
	rh.entry_date,
	ra.return_adjustment_type_id,
	ra.amount,
	ra.comments,
	ri.order_id,
	oh.order_date,
	rh.return_date,
	oh.product_store_id
from return_header rh
left join return_item ri
	on ri.return_id = rh.return_id
left join return_adjustment ra 
	on ra.return_id = ri.return_id
left join order_header oh
	on oh.order_id = ri.order_id
	order by rh.return_id;


	
	


	
