with dim_movies as(
    select * from {{ ref('src_dim_movies') }}
),ephemeral_dim_raw_tags as (
    select * from {{ ref('ephemeral_dim_raw_tags') }}
)

select dim_movies.movie_id,
       dim_movies.movie_title,
       dim_movies.movie_genres,
       ephemeral_dim_raw_tags.tag_name,
       ephemeral_dim_raw_tags.user_id,
       ephemeral_dim_raw_tags.tag_timestamp
from dim_movies 
left join ephemeral_dim_raw_tags
on dim_movies.movie_id = ephemeral_dim_raw_tags.movie_id