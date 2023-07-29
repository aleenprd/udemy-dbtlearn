{# checks that there is no review date that is submitted before its listing was created: 
Make sure that every review_date in fct_reviews is more recent than the associated created_at in dim_listings_cleansed. #}
select 
    fr.listing_id,
    fr.review_date,
    dlc.created_at
from {{ ref('fct_reviews') }} fr
join {{ ref('dim_listings_cleansed') }} dlc
on fr.listing_id = dlc.listing_id
where review_date <= created_at