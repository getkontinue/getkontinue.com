# Build stage
FROM node:20-alpine AS builder

# Install bun
RUN npm install -g bun

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json bun.lock ./

# Install dependencies
RUN bun install --frozen-lockfile

# Copy source code
COPY . .

# Build the project
RUN bun run build --remote

# Production stage
FROM node:20-alpine AS runner
RUN apk --no-cache add curl

WORKDIR /app

# Create non-root user
RUN addgroup --system --gid 1001 astro && \
    adduser --system --uid 1001 astro

# Copy built application
COPY --from=builder --chown=astro:astro /app/node_modules ./node_modules
COPY --from=builder --chown=astro:astro /app/dist ./dist

# Switch to non-root user
USER astro

# Expose port
EXPOSE 4321

ENV ASTRO_DB_REMOTE_URL="file:/data/local.db"
RUN mkdir /data && touch /data/local.db

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "http.get('http://localhost:4321', (res) => process.exit(res.statusCode === 200 ? 0 : 1))"

# Start the application
CMD ["node", "./dist/server/entry.mjs"]