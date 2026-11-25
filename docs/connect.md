# Connect replads

You need a replads account. You can create one while connecting, with Google or email.

## Claude

Open **Settings → Connectors**, find replads or choose **Add custom connector**, enter `https://api.replads.com/mcp` and choose **Connect**. Sign in and choose **Allow**.

## Claude Code

```bash
claude mcp add --transport http replads https://api.replads.com/mcp
```

Run `/mcp` in Claude Code and authenticate. To use an MCP key from your replads profile instead:

```bash
claude mcp add --transport http replads https://api.replads.com/mcp --header "Authorization: Bearer YOUR_MCP_KEY"
```

## ChatGPT

Find replads in the plugin directory, choose **Connect**, sign in and choose **Allow**.

## Keys

MCP and API keys are separate. Create them at [web.replads.com](https://web.replads.com/profile). Generating a new key turns the old one off immediately. Keep keys private.
