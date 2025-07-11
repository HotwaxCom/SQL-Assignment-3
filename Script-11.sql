Question:

When transferring stock between facilities, the system should reserve inventory. If it isn’t reserved, the transfer may fail or oversell.

Solution:

select
  it.order_id as tansfer_order_id,
  it.facility_id as from_facility_id,
  it.facility_id_to as to_facility_id,
  it.product_id,
  it.quantity as requested_quantity,
  oisgir.quantity as reserved_quantity,
  it.send_date as transfer_date,
  it.status_id as status
from inventory_transfer it
  join order_item_ship_grp_inv_res oisgir
  on oisgir.inventory_item_id = it.inventory_item_id;

Query Cost: 7.49

