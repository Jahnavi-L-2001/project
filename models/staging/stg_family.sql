SELECT
  parent_name      AS parent_name,
  gender           AS parent_gender,
  dob              AS parent_dob,
  city             AS city,
  state            AS state,
  house_number     AS house_number,
  office_phone     AS office_phone,
  personal_phone   AS personal_phone,
  kid_name         AS kid_name
FROM {{ source('raw', 'family') }}