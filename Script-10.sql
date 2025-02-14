select 
	ii.product_id,
	ii.facility_id,
	f.facility_type_id,
	ii.quantity_on_hand_total as QOH,
	ii.available_to_promise_total as ATP
from inventory_item ii
	join facility f
		on f.facility_id = ii.facility_id
	join facility_type ft
		on ft.facility_type_id = f.facility_type_id 	
		where f.facility_type_id = "VIRTUAL_FACILITY" 
		or ft.PARENT_TYPE_ID = "VIRTUAL_FACILITY";
