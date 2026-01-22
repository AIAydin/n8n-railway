FROM n8nio/n8n:latest

USER root

# Install additional dependencies if needed
RUN apk add --no-cache \
    graphicsmagick \
    tzdata \
    tini

# Create data directory with proper permissions
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node

WORKDIR /home/node

# Railway provides PORT dynamically
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production

# Health check for Railway
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:${PORT:-5678}/healthz || exit 1

# Use tini as init system for proper signal handling
ENTRYPOINT ["/sbin/tini", "--"]

# Start n8n with Railway's dynamic port
CMD ["sh", "-c", "n8n start --port=${PORT:-5678}"]
