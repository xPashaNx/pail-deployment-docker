build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down --remove-orphans

certs-generate:
	mkdir -p ./certs && \
    openssl req -x509 -nodes -newkey rsa:2048 \
      -keyout ./certs/selfsigned.key \
      -out ./certs/selfsigned.crt \
      -days 365 \
      -subj "/CN=$(hostname -I | awk '{print $1}')"

get-ip:
	hostname -I | awk '{print $1}'