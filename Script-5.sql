Question:
	
Certain teams need granular return data (reason, date, refund amount) for analyzing return rates, identifying recurring issues, or updating policies.

Fields to retrieve:
-RETURN_ID
-ENTRY_DATE
-RETURN_ADJUSTMENT_TYPE_ID (refund type, store credit, etc.)
-AMOUNT
-COMMENTS
-ORDER_ID
-ORDER_DATE
-RETURN_DATE
-PRODUCT_STORE_ID

Solution:

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
join return_item ri
	on ri.return_id = rh.return_id
join order_header oh
	on oh.order_id = ri.order_id
join return_adjustment ra 
	on ra.return_id = ri.return_id
	order by rh.return_id;

Query Cost: 10,653.85


	
	


	
