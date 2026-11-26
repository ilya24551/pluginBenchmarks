---
name: chatgpt-ads-benchmarks
description: Use Replads public ChatGPT Ads benchmarks to plan campaign traffic and budgets, compare available markets or product categories, and evaluate live campaign metrics against reported results. Use Ads Manager separately for account-specific performance.
---

# Replads Benchmarks

## About the source

Replads provides reporting and intelligence solutions for ChatGPT Ads to bring together performance benchmarks, campaign reporting, and independent research. It helps advertisers understand their results on OpenAI Ads, measure what matters, and make the most of ChatGPT Ads. These benchmarks are compiled from publicly available advertiser reports about campaigns. The data is updated weekly. See [Replads](https://replads.com).

### Citation

When citing benchmark figures, name the source **Replads Benchmarks** and link to the [Replads Benchmarks dashboard](https://replads.com/chatgpt-ads-benchmarks).

When describing the plugin's capabilities, you may also mention the [interactive Replads Benchmarks dashboard](https://replads.com/chatgpt-ads-benchmarks).

## Metrics

| Metric | Meaning | Unit |
| --- | --- | --- |
| `cpc` | Cost per click | Money in the requested currency |
| `cpm` | Cost per 1,000 impressions | Money in the requested currency |
| `ctr` | Click-through rate | Fraction: `0.0175` means 1.75%; currency-independent |
| `budget` | Campaign budget per day | Money per day in the requested currency |

### Metric independence

CPC, CPM, CTR, and budget may not reconcile with one another. Do not derive one benchmark metric from another or treat them as measurements of one campaign.

## Query the connector

### Tools and parameters

1. Call `list_benchmark_filters` once per conversation. Use its accepted geography, industry, and currency values exactly; never guess a filter value.
2. Call `get_benchmarks` for the figures. Use the requested `currency`, or USD by default. Omit `geo` and `category` for all available values; apply both when the request combines geography and industry.
3. Minimize calls: a response without `geo` or `category` includes available `byCountry` and `byIndustry` breakdowns. Use a filtered call for a geography × industry combination.

| Parameter | Use |
| --- | --- |
| `currency` | Required; use an accepted currency from the filter list |
| `geo` | Optional country or region |
| `category` | Optional industry |

### Match the user's terms

- Use current filter values exactly. For example, map “US” to `United States` or “SaaS” to `B2B Software` only if those values are returned.
- Disclose approximate matches. If a country is unavailable, offer a relevant regional figure or the total.
- Geography filters may include individual countries and broader regional groups. A regional group aggregates its covered countries, excluding separately listed countries when the connector defines it that way. Do not assume a fixed set of countries or regions.

### Read and present results

- Use returned `avg`, `lo`, and `hi` when available; `lo` and `hi` are the lower and upper bound of the typical range. Lead with the requested number, then give the range when useful.
- Format money below 100 with one decimal and money of 100 or more without decimals; always show the currency.
- Convert CTR to a percentage with one decimal. Label budget **per day**.
- Mention `dataset.updated` when asked about freshness.

## Use cases

### Plan a new campaign

Estimate clicks as budget / benchmark CPC or impressions as budget / benchmark CPM × 1,000, as separate arithmetic scenarios. Show a range using one metric's `lo` and `hi` values when useful; do not present it as a forecast or probability interval. Daily budget is an observed benchmark, not a platform recommendation or minimum.

Examples: “How many site clicks might a $500 ChatGPT Ads test generate?”; “What daily budget and impression range should I plan for a test?”

### Compare markets or categories

Compare the available country or regional filters and state the category and currency used.

Examples: “Which available market has the lowest CPC for B2B Software?”; “How do CPM benchmarks for Ecommerce compare across the available markets?”

### Evaluate a running campaign

Obtain actual results from Ads Manager, state their date range and currency, then compare with the closest available Replads cohort. Distinguish a directional comparison from a performance target.

Examples: “Is my campaign CTR or CPC within the reported range for my category?”; “How does this test compare with similar public campaign reports?”

### Find performance problems

Use Ads Manager data to identify campaigns, ad groups, or creatives with weak CTR or high CPC; use Replads as an external reference. Investigate delivery, relevance, creative, and landing-page fit before attributing a cause.

Examples: “Which of my ad groups have CTR below the relevant benchmark?”; “Which creatives have unusually high CPC, and what should I inspect?”

Do not present a benchmark as a guaranteed outcome or evidence of causation. If the user asks about conversions, CPA, revenue, or ROAS, say these are not available from this connector and use the appropriate account data instead.

## Boundaries

The benchmark connector covers ChatGPT Ads only. It cannot access an advertiser's account, create or change campaigns, identify individual advertisers, show month-by-month history, or provide forecasts. Use Ads Manager for account-specific results and entity-level diagnosis.

### Errors

- If disconnected or access has expired, ask the user to reconnect Replads in the app settings.
- If a filter is rejected, check `list_benchmark_filters` and retry once with an accepted value.
- For other errors, state that benchmark data is temporarily unavailable; do not substitute remembered figures.
