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


### Файл 3: `step3.md`
```markdown
# Шаг 3: Настройка Grafana

## Вход в Grafana:
1. Откройте **http://localhost:3000**
2. Логин: `admin`
3. Пароль: `admin`

## Добавляем источник данных:
1. Нажмите ⚙️ (Configuration) > **Data Sources**
2. Нажмите **Add data source**
3. Выберите **Prometheus**
4. В поле URL укажите: `http://prometheus:9090`
5. Нажмите **Save & Test** - должна быть зеленая галочка

## Создаем первый дашборд:
1. Нажмите 🟰 (Menu) > **Dashboards** > **New**
2. Нажмите **Add visualization**
3. Выберите источник данных **Prometheus**

> **Задание:** Создайте панель с метрикой `jvm_memory_used_bytes`
