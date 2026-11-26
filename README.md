# replads plugins

Benchmarks for ads in ChatGPT, for Claude and ChatGPT. Figures come from published advertiser reports: cost per click, cost per 1,000 impressions, click-through rate and daily budget, by country, industry and currency.

| Folder | Contents |
| --- | --- |
| `skills/`, `assets/` | Source of the skill and the logo |
| `claude/` | Plugin for Claude |
| `openai/` | Plugin for ChatGPT |
| `docs/` | [Connect](docs/connect.md), [MCP](docs/mcp.md), [API](docs/api.md), [Data](docs/data.md) |

The skill and the logo are edited only in `skills/` and `assets/`. After a change run:

```bash
./build.sh
```

It copies them into both plugins and builds `dist/replads-openai.zip`.

Website: https://replads.com. Support: info@replads.com.

<!-- test commit: verifying write access -->
