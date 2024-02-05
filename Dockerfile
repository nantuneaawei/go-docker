FROM alpine:latest

RUN apk --no-cache add nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY . /app

WORKDIR /app

RUN go build -o main .

CMD ["nginx", "-g", "daemon off;"]
