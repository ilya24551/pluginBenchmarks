# Data

Figures are computed from published advertiser reports about ads in ChatGPT.

```json
{
  "calculatedAt": "...",
  "currency": "USD",
  "geo": "United States",
  "dataset": { "reports": 0, "countries": 0, "updated": "...", "typicalRunDays": 0, "medianRunDays": 0 },
  "filters": { "countries": [], "industries": [], "currencies": [] },
  "metrics": {
    "cpc": { "total": { "avg": 0, "lo": 0, "hi": 0, "n": 0 }, "byCountry": {}, "byIndustry": {} }
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
| `avg` | Arithmetic mean, not weighted by spend |
| `lo`, `hi` | 25th and 75th percentiles |
| `n` | Number of reports |

## Notes

- `total` also includes reports with no stated country or industry. It is not the sum of the rows.
- One report can count in several markets, for example in a country and its region.
- `avg` can be above `hi` when a few campaigns are much larger than the rest.
- `total` is absent when there are no reports for the filters. Filters that are not set are absent too.
- `dataset` describes all data and does not depend on the filters.
- `typicalRunDays` and `medianRunDays` are the mean and median campaign length.
- `budgetOtherMarkets` is the lowest and highest average daily budget across markets other than the United States.
- `runId` identifies the calculation.
