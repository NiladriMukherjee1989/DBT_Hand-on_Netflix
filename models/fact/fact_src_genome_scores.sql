{{ config (
    materialized='table'
) }}

with fact_src_genome_scores as (
    select * from {{ ref('src_genome_scores') }}
)

select movie_id,
       tag_id,
       round(relevance,2) as relevance_rounded
from fact_src_genome_scores