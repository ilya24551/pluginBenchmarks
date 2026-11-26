# Data

Figures are computed from published advertiser reports about ads in ChatGPT.

```json
{
  "calculatedAt": "...",
  "currency": "USD",
  "geo": "United States",
  "dataset": { "countries": 0, "updated": "..." },
  "filters": { "countries": [], "industries": [], "currencies": [] },
  "metrics": {
    "cpc": { "total": { "avg": 0, "lo": 0, "hi": 0 }, "byCountry": {}, "byIndustry": {} }
  },
  "budgetOtherMarkets": { "min": 0, "max": 0 }
}
```

Zeros and dots show the structure only.

## Metrics

| Metric | Meaning | Unit |
| --- | --- | --- |
| `cpc` | Cost per click | Money |
| `cpm` | Cost per 1,000 impressions | Money |
| `ctr` | Click-through rate | Fraction: 0.0175 is 1.75% |
| `budget` | Campaign budget per day | Money per day |

## Figure

| Field | Meaning |
| --- | --- |
| `avg` | Average |
| `lo`, `hi` | Lower and upper bound of the typical range |

## Notes

- `total` is not the sum of the rows.
- `total` is absent when there is no data for the filters. Filters that are not set are absent too.
- `dataset` describes all data and does not depend on the filters.
- `budgetOtherMarkets` is the lowest and highest average daily budget across markets other than the United States.
- `runId` identifies the calculation.
