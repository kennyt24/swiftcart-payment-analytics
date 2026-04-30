# swiftcart-payment-analytics# SwiftCart Payment Analytics

A transaction monitoring tool built for SwiftCart, an online retailer using Stripe to process payments.

## Problem Statement
SwiftCart needed visibility into their payment health — which transactions are failing, what is the refund rate, and how much revenue is being processed.

## Tools Used
- **Stripe API** — source of payment data
- **Postman** — API calls, environment variables, automated test scripts
- **SQL (SQLite)** — data storage and analytics queries

## Postman Collection
Three requests built to monitor payment health:
- `GET /v1/charges` — fetches all transactions with automated tests to flag failures
- `GET /v1/refunds` — fetches all refunds
- `GET /v1/disputes` — fetches all disputes

Automated test scripts flag any failed charges and chain requests using environment variables.

## SQL Queries

### 1. Transaction Success Rate
Breaks down transactions by status and calculates percentage.

### 2. Revenue by Currency
Calculates total revenue and transaction count per currency.

### 3. Refund Analysis
Joins transactions and refunds tables to show which charges were refunded and for how much.

## Key Findings
- 7 transactions processed, all succeeded (100% success rate)
- £17,475 total revenue in GBP
- 2 out of 7 transactions refunded (28.5% refund rate)

## Next Steps
- Schedule daily automated runs of the Postman collection
- Add alerting when refund rate exceeds 10%
- Expand to track disputes over time
