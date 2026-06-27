with family as (
    select * from {{ ref('stg_family') }}
),

employees as (
    select * from {{ ref('stg_employee') }}
)

select
    e.employee_id,
    e.employee_name,
    f.parent_name,
    f.parent_gender,
    f.parent_dob,
    f.city,
    f.state,
    f.house_number,
    f.office_phone,
    f.personal_phone,
    f.kid_name
from employees e
left join family f
    on e.employee_name = f.parent_name