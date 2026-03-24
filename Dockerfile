FROM node:18-alpine AS build

WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps
RUN npm run build

FROM node:18-alpine
WORKDIR /app

RUN npm install -g serve

COPY --from=build /app/dist ./dist

CMD ["sh", "-c", "serve -s dist -l $PORT"]