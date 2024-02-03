with
source as (select * from {{ source("retrosheet", "src_retrosheet__subs") }}),

transform as (select * from source)

select *
from transform
