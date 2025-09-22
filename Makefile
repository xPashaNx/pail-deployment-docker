build:
	docker compose build --no-cache

network-create:
	docker network create pail-trading-net || true

up:
	docker compose up -d

down:
	docker compose down --remove-orphans

generate-certs:
	mkdir -p ./certs && \
    openssl req -x509 -nodes -newkey rsa:2048 \
      -keyout ./certs/selfsigned.key \
      -out ./certs/selfsigned.crt \
      -days 365 \
      -subj "/CN=$(hostname -I | awk '{print $1}')"

get-ip:
	hostname -I | awk '{print $1}'