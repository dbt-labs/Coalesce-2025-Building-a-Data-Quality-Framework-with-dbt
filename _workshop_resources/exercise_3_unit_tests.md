### Exercise 3: Unit Tests
`models/staging/jaffle_world/stg_jaffle_world__customers.sql` has a column 
`is_valid_email` which uses regex to identify whether a customer’s email is 
valid or not based on emails that have been seen in the data. The data type 
returned is a `boolean`.

Starter YML is located at the bottom of this file. Use this to add a unit
test to `models/staging/jaffle_world/docs/_stg_jaffle_world__customers.yml`:

1. Copy/Paste the code to the last line of the file.
2. Add the model name that we want to test (stg_jaffle_world__customers)
3. Finish filling out the `input` configuration (hint: take a look at 
   models/staging/jaffle_world/stg_jaffle_world__customers.sql to see what
   source that model is using in the SQL)
4. Using the description, fill out the `given` and `expect` row and column values.
5. Run `dbt build -s stg_jaffle_world__customers`. What are the results of the unit test?

```yml
unit_tests:
  - name: test_is_valid_email_address
    model: 
    description: >
      Check that is_valid_email logic captures of our known edge cases:
      - emails that have a .com without domain like nodomain@.com
      - emails that have a domain, but truncated like truncated@domain.c
      - emails that have a missing dot in the domain, like missingdot@domaincom
      - emails with no @, like noat.com
      Additionally, we should check that we're not marking emails
      with valid special characters as invalid, such as:
      - c+berger@jaffle-shop.com
      - d.horner@jaffle.com
    given:
      - input: source('', '')
        rows:
          - {email: }
          - {email: }
          - {email: }
          - {email: }
          - {email: }
          - {email: }
    expect:
      rows:
        - {email: , is_valid_email: }
        - {email: , is_valid_email: }
        - {email: , is_valid_email: }
        - {email: , is_valid_email: }
        - {email: , is_valid_email: }
        - {email: , is_valid_email: }
```