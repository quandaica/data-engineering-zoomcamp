
-- Use the `ref` function to select from other models

select *
from {{ ref('homework_week_4_table') }}
where id = 1
