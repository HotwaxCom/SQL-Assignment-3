## Question 1: Completed Sales Orders (Physical Items)

Merchants need to track only physical items (requiring shipping and fulfillment) for logistics and shipping-cost analysis.
Fields to Retrieve:

- ORDER_ID  
- ORDER_ITEM_SEQ_ID  
- PRODUCT_ID  
- PRODUCT_TYPE_ID  
- SALES_CHANNEL_ENUM_ID  
- ORDER_DATE  
- ENTRY_DATE  
- STATUS_ID  
- STATUS_DATETIME  
- ORDER_TYPE_ID  
- PRODUCT_STORE_ID  

```
select 
    oh.order_id,
    oi.order_item_seq_id,
    oi.product_id,
    pt.product_type_id,
    oh.sales_channel_enum_id,
    oh.order_date,
    oh.entry_date,
    oh.status_id,
    os.status_datetime as status_datetime,
    oh.order_type_id,
    oh.product_store_id
from order_header oh
left join order_status os
    on os.order_id = oh.order_id and os.status_id = oh.status_id 
join order_item oi 
    on oi.order_id = oh.order_id
join product p
    on p.product_id = oi.product_id
join product_type pt 
    on pt.product_type_id = p.product_type_id
where pt.is_physical = 'Y'
  and (oh.status_id = 'ORDER_CREATED' or oh.status_id = 'ORDER_APPROVED')
order by oh.order_id;
```

Query Cost: 574,125.48
