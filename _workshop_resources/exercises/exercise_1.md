### Exercise 1: Data Tests

1. Open `models/reports/docs/_customer_lifetime_values.yml`. 
   Add a data test which tests the customer_id to ensure it’s 
   unique and contains no NULL values.

2. Test the model by running `dbt build -s customer_lifetime_values`. 
   What is the result?

3. Try modifying `models/reports/customer_lifetime_values.sql` by 
   adding `order_id,` to line 14 and modifying the grouping to `group by 1, 2`. 
   Run your build command again. What is the result?