FROM alpine:latest

RUN apk --no-cache add git go nginx postgresql-client

WORKDIR /app

COPY nginx/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
