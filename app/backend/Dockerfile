
FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY --chown=node:node . .

USER node

EXPOSE 3001
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "fetch('http://127.0.0.1:3001/health').then(r => process.exit(r.ok ? 0 : 1)).catch(() => process.exit(1))"doc

CMD ["node", "src/app.js"]
