Question:

Customer service and finance often need insights into returned items to manage refunds, replacements, and inventory restocking.

Fields to retrieve:

- RETURN_ID
-ORDER_ID
-PRODUCT_STORE_ID
-STATUS_DATETIME
-ORDER_NAME
-FROM_PARTY_ID
-RETURN_DATE
-ENTRY_DATE
-RETURN_CHANNEL_ENUM_ID

Solution:

select
	ri.return_id,
	ri.order_id,
	oh.product_store_id,
	rs.status_datetime,
	oh.order_name,
	rh.from_party_id,
	rh.return_date,
	rh.return_channel_enum_id
from return_header rh
join return_item ri
	on ri.return_id=rh.return_id 
join return_status rs
	-- since for a single return there might exist multiple statuses, so as to manage this we apply joins taking into consideration bot the fields
	on rs.return_id=rh.return_id and rs.status_id = rh.status_id
join order_header oh
	on oh.order_id=ri.order_id
	where ri.return_item_seq_id=rs.return_item_seq_id
	order by return_id;

Query Cost: 15,874.35
