# SwiftCart Payment Analytics

> **Context:** This project was built following a conversation with 
> Shammi Madhvani 
> at Stripe regarding my interest in the Technical Account Manager role. 
> It demonstrates my ability to work with REST APIs using Postman and 
> analyse data using SQL to solve real business problems.

---

## The Business Problem

SwiftCart is an online retailer processing payments through Stripe. As their 
transaction volume grew, they had no visibility into the health of their payments. 
Key questions they couldn't answer:

- Which transactions are failing and how often?
- What is our refund rate, and is it within acceptable limits?
- How much revenue are we actually processing?

Without answers to these questions, SwiftCart was flying blind on one of the most 
critical parts of their business.

---

## The Goal

Build a lightweight monitoring tool that:
1. Pulls live payment data directly from the Stripe API
2. Stores and queries that data in SQL to surface actionable business insights
3. Flags anomalies automatically so issues can be caught early

---

## Steps Taken

### Step 1 — Connected to the Stripe API via Postman
- Created a Postman environment with `base_url` and `secret_key` variables
- Built 3 API requests against Stripe's sandbox:
  - `GET /v1/charges` — all transactions
  - `GET /v1/refunds` — all refunds issued
  - `GET /v1/disputes` — any open disputes
- Added automated test scripts to the charges request to flag failed payments
- Chained requests using environment variables to store charge IDs
## Screenshots

### Postman — Get Charges (Test Results)
![Get Charges](paste-screenshot-here)

### Postman — Get Charges (Test Results)
![Get Charges](<img width="951" height="475" alt="image" src="https://github.com/user-attachments/assets/b87d13f1-2288-4a32-bbd4-2a2c01c43b0e" />
)

### Postman — Get Refunds
![Get Refunds](paste-screenshot-here)

### Postman — Get Disputes
![Get Disputes](paste-screenshot-here)

### SQL — Transaction Success Rate
![Query 1](paste-screenshot-here)

### SQL — Revenue by Currency
![Query 2](paste-screenshot-here)

### SQL — Refund Analysis
![Query 3](paste-screenshot-here)

### Step 2 — Loaded Data into SQL
- Created a SQLite database with two tables: `transactions` and `refunds`
- Inserted real data returned from the Stripe API calls

### Step 3 — Wrote Analytics Queries
- **Query 1:** Transaction success rate using `GROUP BY` and window functions
- **Query 2:** Revenue by currency using `SUM` and `GROUP BY`
- **Query 3:** Refund analysis using a `LEFT JOIN` across both tables

---

## Key Findings

| Metric | Result |
|---|---|
| Transactions processed | 7 |
| Success rate | 100% |
| Total revenue (GBP) | £17,475 |
| Refund rate | 28.5% ⚠️ |

> ⚠️ The 28.5% refund rate exceeds the recommended 10% threshold and would be 
> flagged for immediate review in a production environment.

---

## Tools Used
- **Stripe API** — source of real payment data (sandbox)
- **Postman** — API calls, environment variables, automated test scripts
- **SQL (SQLite)** — schema design, data storage, and analytics queries

---

## Next Steps
- Schedule daily automated runs of the Postman collection
- Add alerting when refund rate exceeds 10%
- Expand to track disputes over time across multiple merchants
