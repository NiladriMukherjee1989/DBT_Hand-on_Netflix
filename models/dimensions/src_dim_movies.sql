with dim_movies as(
    select * from {{ ref('src_movies') }}
) 

select movieid as movie_id,
title as movie_title,
SPLIT(genres, '|') as movie_genres
from dim_movies