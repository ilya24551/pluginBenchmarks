# MCP server

- Address: `https://api.replads.com/mcp`
- Transport: Streamable HTTP
- Access: OAuth 2.0
- Scope: `replads.read`

Both tools are read only.

## list_benchmark_filters

No parameters. Returns `countries`, `industries` and `currencies`.

## get_benchmarks

| Parameter | Required | Description |
| --- | --- | --- |
| `currency` | Yes | Value from `currencies` |
| `geo` | No | Value from `countries`. Omit for all |
| `category` | No | Value from `industries`. Omit for all |

The result is described in [data.md](data.md).
