FROM node:20-alpine

RUN apk add --no-cache python3 make g++

RUN npm install -g pnpm@9

WORKDIR /app

COPY package.json pnpm-lock.yaml* ./

RUN pnpm install --frozen-lockfile --ignore-scripts

COPY . .

EXPOSE 9000

CMD ["node", "src/cobalt"]
