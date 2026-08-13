with 
src_ratings as (
    select * from {{ ref('src_ratings') }}
),
src_tags as (
    select * from {{ ref('src_tags') }}
)

select distinct user_id from (
    select user_id from src_ratings
    union all
    select user_id from src_tags
)