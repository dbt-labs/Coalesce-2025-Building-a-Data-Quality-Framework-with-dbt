### [ANSWER KEY] Exercise 4: Linting

1. Your file tree should look like:
   ```
   └── Coalesce-2025-Building-a-Data-Quality-Framework-with-dbt
    ├── analyses/
    ├── macros/
    ├── models/
    ├── # other folders/files...
    ├── .sqlfluff <---------------------- # file should be created at this level
    └── dbt_project.yml
   ```

2. When first linting the `stg_jaffle_shop__custoemrs` model, it should return
   no linting errors.

3. After changing the comma's `line_position` config to `leading`, the linting
   of `stg_jaffle_shop__customers` should return errors stating that leading
   commas were expected.

4. Clicking "Fix" on `stg_jaffle_shop__customers` should change all trailing commas 
   to leading commas in the SQL.

5. Adding the `capitalisation_policy` for keyowrds should result in uncapitalized keyword
   errors in `stg_jaffle_shop__customers`. Fixing these should change all lower-cased
   keywords to uppercase.

Here are the finished `.sqlfluff` contents:
```
[sqlfluff]
dialect = snowflake
templater = dbt
runaway_limit = 10
max_line_length = 80
indent_unit = space
exclude_rules = LT01, RF04, ST06

[sqlfluff:indentation]
tab_space_size = 4

[sqlfluff:layout:type:comma]
spacing_before = touch
line_position = leading

[sqlfluff:rules:capitalisation.keywords]
capitalisation_policy = upper
```