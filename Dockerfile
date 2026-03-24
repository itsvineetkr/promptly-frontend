FROM node:18-alpine AS frontend-build

WORKDIR /app

COPY . .

RUN npm install --legacy-peer-deps

EXPOSE 5173
RUN npm run build