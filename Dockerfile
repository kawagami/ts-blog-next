FROM node:20-alpine AS base

# 安裝相依套件階段
FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

# 啟用 yarn
RUN corepack enable && corepack prepare yarn@stable --activate

# 複製 package 檔案
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# 建置階段
FROM base AS builder
WORKDIR /app

# 啟用 yarn
RUN corepack enable && corepack prepare yarn@stable --activate

COPY --from=deps /app/node_modules ./node_modules
COPY . .

# 如果使用 environment variables，在這裡設定
# ENV NEXT_PUBLIC_API_URL=your_api_url

RUN yarn build

# 執行階段
FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# 複製 public 資料夾
COPY --from=builder /app/public ./public

# 設定正確的權限
RUN mkdir .next
RUN chown nextjs:nodejs .next

# 複製 standalone 輸出
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000

ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

CMD ["node", "server.js"]