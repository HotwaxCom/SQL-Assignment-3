Select
    rh.from_party_id as party_id,
    p.first_name
from return_item ri
join return_header rh
    on rh.return_id = ri.return_id
join person p
    on p.party_id = rh.from_party_id 
group by rh.from_party_id, ri.order_id
having count(ri.order_id) = 1 
order by rh.from_party_id;
