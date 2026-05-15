FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY pocketbase /app/pocketbase
COPY pb_migrations /app/pb_migrations
COPY pb_public /app/pb_public

RUN chmod +x /app/pocketbase

EXPOSE 8090

CMD ["/app/pocketbase", "serve", "--http", "0.0.0.0:8090"]
