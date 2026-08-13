{{
config(
    materialized='ephemeral'
)
}}

with ephemeral_dim_raw_tags as (
    select * from NETFLIX.RAW.RAW_TAGS
)

select movieid as movie_id,
       tag as tag_name,
       userid as user_id,
       cast(timestamp as timestamp) as tag_timestamp
       from ephemeral_dim_raw_tags