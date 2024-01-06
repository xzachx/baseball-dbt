with
    source as (select * from {{ source("retrosheet", "src_retrosheet__parks") }}),
    transform as (select * from source)
select *
from transform
