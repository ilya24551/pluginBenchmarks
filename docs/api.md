# API

Base address: `https://api.replads.com/v1`

Send an API key from your replads profile with every request:

```bash
curl "https://api.replads.com/v1/benchmarks/filters" -H "Authorization: Bearer YOUR_API_KEY"
```

## GET /benchmarks/filters

Returns the values accepted by the filters:

```json
{ "countries": ["Germany", "United States"], "industries": ["B2B Software"], "currencies": ["EUR", "GBP", "USD"] }
```

The example is shortened.

## GET /benchmarks

| Parameter | Required | Description |
| --- | --- | --- |
| `currency` | Yes | Value from `currencies` |
| `geo` | No | Value from `countries`. Omit for all |
| `category` | No | Value from `industries`. Omit for all |

```bash
curl "https://api.replads.com/v1/benchmarks?currency=USD&geo=United%20States" -H "Authorization: Bearer YOUR_API_KEY"
```

The response is described in [data.md](data.md).

## Errors

| Status | Meaning |
| --- | --- |
| 400 | `currency` is missing |
| 401 | The key is missing, wrong or no longer active |
| 404 | A filter value is not in the list, or there is no data yet |
