Question:

The mechandising team needs a list of orders that only have one return.

Fields to retrieve:
-PARTY_ID
-FIRST_NAME

Solution:

Select
    rh.from_party_id as party_id,
    p.first_name
from return_item ri
join return_header rh
    on rh.return_id = ri.return_id
join person p
-- Getting the party information from here 
    on p.party_id = rh.from_party_id 
group by rh.from_party_id, ri.order_id
-- Checks if there exsits only one return to the corresponding order
having count(ri.order_id) = 1 
order by rh.from_party_id;

Query Cost: 12,488.51
