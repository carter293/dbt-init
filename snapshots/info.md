# dbt Snapshots Reference

## Overview
- **dbt snapshots** capture changes in your source data over time.
- Ideal for tracking historical changes and slowly changing dimensions.

## How It Works
1. **Define a Snapshot:**  
   Create snapshot files in the `snapshots/` directory with your snapshot configuration.
2. **Configure Snapshot:**  
   Specify parameters like the unique key and snapshot strategy (e.g., `check` or `timestamp`) within the snapshot file.
3. **Run Snapshots:**  
   Execute the `dbt snapshot` command to record the state of your source data at different points in time.
4. **Analyze:**  
   Use the historical data stored in your snapshots to audit changes and perform temporal analyses.

## Benefits
- **Historical Tracking:** Maintains a record of data changes for detailed historical analysis.
- **Data Auditing:** Simplifies auditing and debugging by preserving past data states.
- **Version Control:** Snapshot definitions are versioned with your project, ensuring transparency and collaboration.

## Considerations
- Best for datasets where retaining history is important.
- Not ideal for extremely high-frequency data changes due to potential performance and storage impacts.
- Requires careful configuration to balance data retention needs with system efficiency.

## Example Snapshot Configuration
```sql
{% snapshot my_snapshot %}
  {{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='check',
      check_cols=['name', 'email']
    )
  }}

  SELECT * FROM {{ ref('my_source_table') }}
{% endsnapshot %}
```

## Use Cases for a Logistics Company
- **Shipment Tracking:**  
  Capture historical changes in shipment statuses (e.g., from "In Transit" to "Delivered") to monitor delays and transit efficiency.
- **Inventory Management:**  
  Track inventory levels in warehouses over time to optimize stock replenishment and reduce overstock or shortages.
- **Vendor Performance Monitoring:**  
  Analyze historical delivery performance from vendors to identify trends, improve reliability, and inform supplier decisions.
- **Route Optimization:**  
  Leverage historical route data snapshots to evaluate and refine transportation routes, reducing costs and improving delivery times.
- **Compliance & Auditing:**  
  Maintain a detailed record of data changes for regulatory compliance, audits, and resolving discrepancies in logistics operations.
