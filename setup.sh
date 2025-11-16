#!/bin/bash

# Установка Docker
apt-get update
apt-get install -y docker.io curl
systemctl start docker
systemctl enable docker

# Создаем простое Java приложение с метриками
mkdir -p /app
cat > /app/Dockerfile << 'EOF'
FROM openjdk:17-jdk-slim
WORKDIR /app
ADD demo-app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
EOF

# Скачиваем готовое демо приложение с актуатором
cd /app
curl -L -o demo-app.jar "https://github.com/spring-guides/gs-actuator-service/raw/main/complete/build/libs/gs-actuator-service-0.1.0.jar"

# Собираем образ приложения
docker build -t demo-app:latest .

# Создаем docker-compose.yml
cat > /root/docker-compose.yml << 'EOF'
version: '3'

services:
  demo-app:
    image: demo-app:latest
    ports:
      - "8080:8080"

  prometheus:
    image: prom/prometheus:latest
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml

  grafana:
    image: grafana/grafana:latest
    ports:
      - "3000:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
      - GF_SECURITY_ADMIN_USER=admin
EOF

# Создаем конфиг Prometheus
cat > /root/prometheus.yml << 'EOF'
global:
  scrape_interval: 5s

scrape_configs:
  - job_name: 'demo-app'
    metrics_path: '/actuator/prometheus'
    static_configs:
      - targets: ['demo-app:8080']
    scrape_interval: 5s
EOF

# Запускаем все сервисы
cd /root
docker-compose up -d

echo "Ожидаем запуск сервисов..."
sleep 30

# Проверяем статус
echo "=== Статус сервисов ==="
docker-compose ps

echo "=== Проверка приложения ==="
curl -s http://localhost:8080/actuator/health | head -2

echo "=== Стенд готов к работе ==="
echo "Приложение: http://localhost:8080/actuator"
echo "Prometheus: http://localhost:9090"
echo "Grafana:    http://localhost:3000 (admin/admin)"
