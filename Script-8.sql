Question:

Warehouse managers need a list of employees responsible for picking and packing orders to manage shifts, productivity, and training needs.

Fields to retrieve:
-PARTY_ID (or Employee ID)
-NAME (First/Last)
-ROLE_TYPE_ID (e.g., “WAREHOUSE_PICKER”)
-FACILITY_ID (assigned warehouse)
-STATUS (active or inactive employee)

Solution:

select 
	pr.party_id,
	concat(p.first_name, ' ', p.last_name) as name,
	pr.role_type_id,
	pi.facility_id,
	pty.status_id
from picklist pi
join picklist_role pr
	on pr.PICKLIST_ID = pi.picklist_id and pr.role_type_id in ("WAREHOUSE_PICKER","WAREHOUSE_PACKER")
join party pty
	on pty.party_id = pr.party_id
join person p
	on p.party_id = pr.party_id;

Query Cost: 2,292.49
