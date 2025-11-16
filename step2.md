# Шаг 2: Исследование Prometheus

## Откройте Prometheus UI:
Перейдите по ссылке: **http://localhost:9090**

## Проверим targets:
1. Перейдите в **Status > Targets**
2. Убедитесь, что `demo-app` в статусе **UP**

## Поработаем с PromQL:

1. Перейдите на вкладку **Graph**
2. Попробуйте запросы:

```promql
jvm_memory_used_bytes

rate(http_server_requests_seconds_count[5m])

process_cpu_usage


