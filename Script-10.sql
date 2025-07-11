Question:

Retailers need to study the relation of inventory levels of products to the type of facility it's stored at. Retrieve all inventory levels for products at locations and include the facility type Id. Do not retrieve facilities that are of type Virtual.

Solution:
```

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

```
Reasoning:

Here, we needed region-specefic analysis specifically New York. So for this we took state_province_geo_id = "NY" or city ="New York" and applied joins as required in the question.

```
Query Cost: 77,126.12
```
