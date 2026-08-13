{{
 config(
     materialized='incremental',
     unique_key='movie_id'
 )
}}

with fact_incremental_rating as (
    select * from {{ ref('src_ratings') }}
)

select user_id, movie_id, rating, rating_timestamp, current_timestamp() as loaded_at
from fact_incremental_rating
where movie_id is not null

{% if is_incremental() %}

    and rating_timestamp > (select max(rating_timestamp) from {{ this }})

{% endif %}