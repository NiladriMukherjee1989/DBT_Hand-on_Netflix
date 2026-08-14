select status, count(*) as customer_count
from {{ source('RAW', 'SNAPSHOT_CUSTOMERS_RAW')   }}
group by status