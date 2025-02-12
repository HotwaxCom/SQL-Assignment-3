select * from return_adjustment;
select return_adjustment_type_id from return_adjustment where return_adjustment_type_id="appeasement";
select * from appeasement;
select * from return_item;

select 
	count(ri.return_item_seq_id),
	(ri.return_quantity*ri.return_price) as return_total,
	a.amount as appeasement_total
from return_adjustment ra 
join appeasement a 
	on a.return_adjustment_type = ra.return_adjustment_type_id
join return_item ri
	on ri.return_id = ra.return_id;
	
