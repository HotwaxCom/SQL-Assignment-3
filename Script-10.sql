## Question 10: Total Items in Various Virtual Facilities

**Business Problem:**

Retailers need to study the relation of inventory levels of products to the type of facility it's stored at. Retrieve all inventory levels for products at locations and include the facility type ID. Do **not** retrieve facilities that are of type **Virtual**.

**Fields to Retrieve:**

- PRODUCT_ID  
- FACILITY_ID  
- FACILITY_TYPE_ID  
- QOH (Quantity on Hand)  
- ATP (Available to Promise)  

---

### ✅ Solution:

> ```
> select 
>     ii.product_id,
>     ii.facility_id,
>     f.facility_type_id,
>     ii.quantity_on_hand_total as QOH,
>     ii.available_to_promise_total as ATP
> from inventory_item ii
>     join facility f
>         on f.facility_id = ii.facility_id
>     join facility_type ft
>         on ft.facility_type_id = f.facility_type_id 	
> where f.facility_type_id = "VIRTUAL_FACILITY" 
>    or ft.PARENT_TYPE_ID = "VIRTUAL_FACILITY";
> ```

---

### 📌 Reasoning:

We were asked to retrieve inventory levels of products based on the type of facility they're stored in. The query joins inventory, facility, and facility type tables and filters for those that are virtual either directly or through a parent type. This is essential for analyzing how much product is held at virtual storage locations.

---

> **Query Cost**: `802273.89`
