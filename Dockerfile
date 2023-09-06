FROM node:alpine3.18 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build --prod --aot

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
