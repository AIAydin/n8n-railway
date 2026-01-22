FROM n8nio/n8n:latest

ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production

CMD ["sh", "-c", "n8n start --port=${PORT:-5678}"]
