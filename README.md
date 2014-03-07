# AuditBaltimore

## Import

```sql
COPY voters(
  vtrid,
  lastname,
  firstname,
  middlename,
  suffix,
  dob,
  gender,
  party,
  house_number,
  house_suffix,
  street_predirection,
  streetname,
  streettype,
  street_postdirection,
  unittype,
  unitnumber,
  address,
  non_std_address,
  residentialcity,
  residentialstate,
  residentialzip5,
  residentialzip4,
  mailingaddress,
  mailingcity,
  mailingstate,
  mailingzip5,
  mailingzip4,
  country,
  status_code,
  state_registration_date,
  county_registration_date,
  precinct,
  split,
  county,
  congressional_districts,
  legislative_districts,
  councilmanic_districts,
  ward_districts,
  municipal_districts,
  commissioner_districts,
  school_districts
)
FROM '/home/deploy/apps/audit_baltimore/current/voterfile.txt' DELIMITER E'\t' CSV HEADER;
```
