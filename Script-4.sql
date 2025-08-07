Question:

The retailer needs the total amount of items, were returned as well as how many appeasements were issued.

Fields to retrieve:
--TOTAL RETURNS
--RETURN $ TOTAL
--TOTAL APPEASEMENTS
--APPEASEMENTS $ TOTAL

Solution:

select 
	count(ri.return_item_seq_id) as total_returns,
	sum(ri.return_quantity*ri.return_price) as return_total,
	count(ra.return_adjustment_id) as total_appeasements,
	sum(ra.amount) as appeasement_total
from return_header rh
join return_item ri
	on rh.return_id = ri.RETURN_ID
left join return_adjustment ra
	on rh.return_id = ra.return_id and ra.return_adjustment_type_id = "APPEASEMENT";

Query Cost: 4149.45
