### Section 3: Unit Tests Live Demo

Copy and paste YAML into _int_employees.yml and follow along!

```yml
unit_tests:
  - name: test_is_valid_employee_type
    model: int_employees
    description: >
      Check that employee_type logic captures of our known cases:
      - If role starts with 'store_' return 'store'
      - If role starts with 'warehouse_' return 'warehouse'
      - If role starts with 'regional_' return 'corporate'
      - If role equals 'founder' return 'executive'
    given:
      - input: ref('stg_jaffle_world__employees')
        rows:
          - {employee_id: 1, store_id: 1, warehouse_id: 1, role: store_clerk}
          - {employee_id: 2, store_id: 2, warehouse_id: 2, role: warehouse_driver}
          - {employee_id: 3, store_id: 3, warehouse_id: 3, role: regional_vp}
          - {employee_id: 4, store_id: 4, warehouse_id: 4, role: founder}
          - {employee_id: 5, store_id: 5, warehouse_id: 5, role: founding_clerk}
          - {employee_id: 6, store_id: 6, warehouse_id: 6, role: region_1_supervisor}
      - input: ref('int_stores')
        rows:
          - {store_id: 1, regional_manager_id: 1}
          - {store_id: 2, regional_manager_id: 2}
          - {store_id: 3, regional_manager_id: 3}
          - {store_id: 4, regional_manager_id: 4}
          - {store_id: 5, regional_manager_id: 5}
          - {store_id: 6, regional_manager_id: 6}
      - input: ref('stg_jaffle_world__warehouses')
        rows:
          - {warehouse_id: 1}
          - {warehouse_id: 2}
          - {warehouse_id: 3}
          - {warehouse_id: 4}
          - {warehouse_id: 5}
          - {warehouse_id: 6}
    expect:
      rows:
        - {employee_id: 1, employee_type: store}
        - {employee_id: 2, employee_type: warehouse}
        - {employee_id: 3, employee_type: corporate}
        - {employee_id: 4, employee_type: executive}
        - {employee_id: 5, employee_type: null}
        - {employee_id: 6, employee_type: null}
```