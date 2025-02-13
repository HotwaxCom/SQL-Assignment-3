select 
	fp.party_id,
	concat(p.first_name, ' ', p.last_name) as name,
	fp.role_type_id,
	fp.facility_id,
	pty.status_id
	from facility_party fp
		join person p
			on p.party_id = fp.party_id
		join party pty
			on pty.party_id = p.party_id
	 where fp.role_type_id = "WAREHOUSE_PICKER"
	or fp.role_type_id = "WAREHOUSE_PACKER"
	or fp.role_type_id = "PICKER"
	or fp.role_type_id = "PACKER"
	order by fp.party_id;
	
