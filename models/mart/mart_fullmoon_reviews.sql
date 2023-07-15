{{
    config(
        materialized="table",
    )
}}

with
    fct_reviews as (select * from {{ ref("fct_reviews") }}),
    full_moon_dates as (select * from {{ ref("seed_full_moon_dates") }})

select
    r.*,
    case when fm.full_moon_date is null then 'f' else 't' end::boolean as is_full_moon
from fct_reviews r
left join
    full_moon_dates fm on (to_date(r.review_date) = dateadd(day, 1, fm.full_moon_date))
