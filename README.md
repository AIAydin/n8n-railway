# n8n Railway Deployment

One-click deploy n8n to Railway with PostgreSQL.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/n8n)

## Quick Setup

### 1. Deploy to Railway

Click the button above or:
1. Fork this repo
2. Connect to Railway
3. Add PostgreSQL plugin from Railway dashboard

### 2. Required Environment Variables

Set these in Railway dashboard → Variables:

| Variable | Description | Example |
|----------|-------------|---------|
| `N8N_ENCRYPTION_KEY` | **Required.** 32+ char random string | `openssl rand -hex 32` |
| `WEBHOOK_URL` | Your Railway public URL | `https://your-app.up.railway.app` |
| `N8N_EDITOR_BASE_URL` | Same as WEBHOOK_URL | `https://your-app.up.railway.app` |

### 3. PostgreSQL (Auto-configured)

When you add Railway's PostgreSQL plugin, these are set automatically:
- `PGHOST`, `PGPORT`, `PGDATABASE`, `PGUSER`, `PGPASSWORD`

### 4. Optional Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `GENERIC_TIMEZONE` | `America/Toronto` | Your timezone |
| `N8N_COMMUNITY_PACKAGES_ENABLED` | `true` | Allow community nodes |
| `EXECUTIONS_DATA_MAX_AGE` | `168` | Hours to keep execution data |

## Local Development

```bash
# Generate encryption key
export N8N_ENCRYPTION_KEY=$(openssl rand -hex 32)

# Start services
docker-compose up -d

# Access n8n at http://localhost:5678
```

## Troubleshooting

**Build fails?**
- Ensure PostgreSQL plugin is added
- Check `N8N_ENCRYPTION_KEY` is set

**Can't access webhooks?**
- Set `WEBHOOK_URL` to your Railway public domain

**Database connection errors?**
- Railway auto-injects `PG*` variables when PostgreSQL plugin is attached
