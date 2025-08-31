### [ANSWER KEY] Exercise 2: Generic Tests

1. The generic test should be a SQL file created in /tests/generic/.
   Example: tests/generic/is_decimal.sql.
   
   Working code:
   ```
   {%- test is_decimal(model, column_name) %}
   select
       {{ column_name }}
   from {{ model }}
   where typeof({{ column_name }}) != 'DECIMAL'
   {%- endtest %}
   ```

2. Lines 31-44 of `models/marts/docs/_fct_orders.yml` should look like:
   ```
   - name: order_total
     description: The total amount for the order including taxes.
     data_tests:
       - is_decimal
   ```

3. Running `dbt build -s fct_orders` should run the `is_decimal` test,
   which should pass.