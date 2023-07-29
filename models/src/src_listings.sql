{# with raw_listings as (select * from airbnb.raw.raw_listings) #}
with raw_listings as (select * from {{ source("airbnb", "listings") }})
select
    id as listing_id,
    name as listing_name,
    listing_url,
    room_type,
    price as price_str,
    minimum_nights,
    created_at,
    host_id,
    updated_at
from raw_listings
