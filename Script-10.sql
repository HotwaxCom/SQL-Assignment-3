Question:

Retailers need to study the relation of inventory levels of products to the type of facility it is stored at. Retrieve all inventory levels for products at locations and include the facility type Id. Do not retrieve facilities that are of type Virtual.

Fields to retrieve:
-PRODUCT_ID
-FACILITY_ID
-FACILITY_TYPE_ID
-QOH (Quantity on Hand)
-ATP (Available to Promise)

Solution:
	
SELECT
	ii.product_id,
	ii.facility_id,
	f.facility_type_id,
	ii.quantity_on_hand_total as QOH,
	ii.available_to_promise_total as ATP
from inventory_item ii
	join facility f
		on f.facility_id = ii.facility_id
where f.facility_type_id != "VIRTUAL_FACILITY";

Query Cost: 908,816.97

