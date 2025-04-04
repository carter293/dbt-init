Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


Packages are defined in packages.yml, install with instructions from hub.getdbt.com

Existing tables defined in .yml files like so: 

```yml
version: 2

sources:
  - name: RAW_TP_TLX_INST 
    database: DEV_TP_TLX_INST_DB
    schema: RAW
    tables:
      - name: INTERSTATE_JOBS

```

Referenced like so: 

```sql
SELECT 
	  TYPE
	, MAS_TYPE
	...
    , MAN_TYPE
FROM
	{{ source('RAW_TP_TLX_INST', 'INTERSTATE_JOBS') }}
```


reference other models like this: 

SELECT 
      CONCAT(YEAR(DATE), '-', MONTH(DATE)) AS YEAR_MONTH
    , SUM(PRICE_NETT) as TOTAL_REVENUE
FROM 
    {{ ref('INTERSTATE_JOBS') }}
GROUP BY 
    CONCAT(YEAR(DATE), '-', MONTH(DATE))