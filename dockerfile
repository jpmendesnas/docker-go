# Estágio 1: Construir o aplicativo Go
FROM golang:1.16-alpine AS builder

WORKDIR /app

ADD . .

RUN go mod tidy
RUN go build -o main .

# Estágio 2: Executar o aplicativo Go
FROM golang:1.16-alpine

WORKDIR /app

COPY --from=builder /app/main /app/main

EXPOSE 8080

CMD ["/app/main"]
