# Шаг 4: Создание комплексного дашборда

## Создадим дашборд для мониторинга приложения:

### Панель 1: Память JVM
```promql
jvm_memory_used_bytes{area="heap"}

Тип визуализации: Graph

Title: Heap Memory Usage

Панель 2: Запросы в секунду (RPS)

'''rate(http_server_requests_seconds_count[1m])

Тип визуализации: Stat

Title: Requests per Second

Панель 3: CPU использование

'''system_cpu_usage

Тип визуализации: Gauge

Title: CPU Usage

Min: 0, Max: 1

Генерация нагрузки (опционально):
Откройте новую вкладку терминала и создайте нагрузку:

'''while true; do curl http://localhost:8080/actuator/health > /dev/null; sleep 0.1; done

Наблюдайте как меняются графики в реальном времени!

Финальное задание: Создайте дашборд с 3-4 панелями для ключевых метрик приложения.

