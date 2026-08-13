with raw_genmore_scores AS (

    select * from NETFLIX.RAW.RAW_GENOME_SCORES
)

select movieid AS movie_id,
 tagid AS tag_id    ,
relevance
from raw_genmore_scores 