### Exercise 1:

1. Lines 8-12 should look like:
   ```yml
     - name: customer_id
       description: A unique identifier for each customer.
       data_tests:
         - unique
         - not_null 
   ```
2. The run should have unique and not_null tests that pass.
3. Lines 12-23 should look like:
   ```sql
    select
        customer_id,
        order_id,
        count(order_id) as total_orders,
        count(order_id) > 1 as is_repeat_customer,
        min(ordered_at) as earliest_order_at,
        max(ordered_at) as latest_order_at,
        round(sum(order_subtotal), 2) as total_gross_spend,
        round(sum(order_total), 2) as total_net_spend,
        round(sum(tax), 2) as total_tax_paid
    from orders
    group by 1, 2
   ```
   The unique test should fail when running `dbt build -s fct_orders`.

### Exercise 2: Generic Tests

1. The generic test should be a SQL file created in /tests/generic/.
   Example: tests/generic/is_decimal.sql:
   ```sql
   {%- test is_decimal(model, column_name) %}
   select
       {{ column_name }}
   from {{ model }}
   where typeof({{ column_name }}) != 'DECIMAL'
   {%- endtest %}
   ```

2. Lines 31-44 should look like:
   ```yml
   - name: order_total
     description: The total amount for the order including taxes.
     data_tests:
       - is_decimal
   ```

3. Running `dbt build -s fct_orders` should run the is_decimal test,
   which should pass.