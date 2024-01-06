with
    source as (select * from {{ source("retrosheet", "src_retrosheet__events") }}),
    transform as (select * from source)
select *
from transform
