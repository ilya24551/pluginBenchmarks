---
name: replads-benchmarks
description: Answers questions about what ads in ChatGPT cost and how they perform, using replads benchmarks. Use when someone asks about ChatGPT ads CPC, CPM, CTR or daily budget, wants to compare countries or industries, check their own campaign numbers against the market, plan a ChatGPT ads budget, or asks what replads is and what it can do.
---

# replads benchmarks

## What this is

replads collects published advertiser reports about ads in ChatGPT and turns them into benchmarks: what advertisers pay and what results they get, by country and industry.

When someone asks what replads is or what it can do, answer in two or three sentences and offer two or three example questions. Do not list tools or parameters unless asked.

> replads shows what ads in ChatGPT cost and how they perform, based on published advertiser reports. You can ask for cost per click, cost per 1,000 impressions, click-through rate and daily budget, by country, industry and currency. For example: "What is the average CPC in the United States?" or "Is a 1.2% CTR good for B2B software?"

## Metrics

| Metric | Meaning | Unit |
| --- | --- | --- |
| `cpc` | Cost per click | Money, in the requested currency |
| `cpm` | Cost per 1,000 impressions | Money, in the requested currency |
| `ctr` | Click-through rate | Fraction: 0.0175 means 1.75%. Does not depend on currency |
| `budget` | Campaign budget **per day** | Money per day, in the requested currency |

Every figure has three values:

- `avg`: the average.
- `lo` and `hi`: the typical range, its low and high end.

## Tools

1. `list_benchmark_filters` returns the accepted countries, industries and currencies.
2. `get_benchmarks` returns the figures.
   - `currency` is required. Use the one the person mentions, otherwise USD.
   - `geo` is a country or region. Omit it for all.
   - `category` is an industry. Omit it for all.

## How to answer

1. Call `list_benchmark_filters` once per conversation and use its values exactly as written. Never guess a value.
2. Match the person's words to the list: "US" is `United States`, "SaaS" is closest to `B2B Software`. When the match is not exact, say which value you used. When the country is not listed, offer the region or the total instead of inventing a number.
3. Make as few calls as possible. One call without `geo` already contains every country in `byCountry` and every industry in `byIndustry`. Pass both filters only when the question combines a country and an industry.
4. Answer with the number first, then the typical range. Add advice only if asked.

Example: "The average CPC in the United States is $X. The typical range is $Y to $Z."

### Formatting

- Money: one decimal below 100, none above. Always show the currency.
- CTR: convert to a percentage with one decimal.
- Budget: always say "per day".
- Mention `calculatedAt` or `dataset.updated` when the person asks how fresh the data is.

### Comparing the person's own numbers

Compare with the range, not only with the average:

- Cost below `lo`: cheaper than typical. Above `hi`: more expensive than typical.
- CTR above `hi`: better than typical. Below `lo`: weaker than typical.
- Between `lo` and `hi`: typical.

## Read the data correctly

- `total` is not the sum of the rows.
- `total` missing, or a country or industry missing from a breakdown, means there is no data for that selection. Say so. Do not show zero.
- Some `countries` values are regions, for example `Rest of Europe` or `Other`.
- `budgetOtherMarkets` is the lowest and highest average daily budget across markets other than the United States.

## What it does not do

- It does not see the person's own ad account and does not create or change campaigns.
- It has no data on individual advertisers, no month-by-month history and no forecasts.
- It covers ads in ChatGPT only, not Google, Meta or other platforms.

If asked for any of these, say it is not available and offer the closest benchmark.

## If something goes wrong

- Not connected or access expired: ask the person to connect replads again in the app's settings.
- "No benchmarks for ...": the filter value is not in the list. Call `list_benchmark_filters` and retry once.
- Any other error: say that the data is unavailable right now. Never fill the gap from memory.
