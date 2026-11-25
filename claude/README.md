# replads

Benchmarks for ads in ChatGPT, based on published advertiser reports. Ask what advertisers pay and what results they get: cost per click, cost per 1,000 impressions, click-through rate and daily budget, by country, industry and currency.

## What you can ask

- "What is the average CPC for ChatGPT ads in the United States?"
- "Compare CPM across industries in euros."
- "My CTR is 1.2% in B2B software. Is that good?"

## Connect

1. Install the plugin.
2. Connect replads when asked. A replads page opens.
3. Sign in or create an account with Google or email, then choose **Allow**.

## What the plugin contains

- A skill that tells Claude how to read and explain the benchmarks.
- A connection to one remote MCP server, `https://api.replads.com/mcp`. It runs no local code.

| Tool | What it does | Access |
| --- | --- | --- |
| `list_benchmark_filters` | Lists accepted countries, industries and currencies | Read only |
| `get_benchmarks` | Returns benchmarks for the selected filters | Read only |

## Data

The plugin sends the selected filters (currency, country or region, industry) to the replads server, together with the access token of your replads account. It does not send your conversation or files, and it does not access your ad accounts. See the [privacy policy](https://web.replads.com/privacy-policy.html).

## Support

info@replads.com
