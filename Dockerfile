FROM alpine:latest

RUN apk --no-cache add git nginx postgresql-client

WORKDIR /app

COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN go get -u gorm.io/gorm && \
    go get -u gorm.io/driver/postgres && \
    go get -u github.com/githubnemo/CompileDaemon && \
    go get -u github.com/joho/godotenv && \
    go get -u github.com/gin-gonic/gin

RUN go install github.com/githubnemo/CompileDaemon

COPY . .

CMD ["nginx", "-g", "daemon off;"]
