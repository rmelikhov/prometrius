# Шаг 4: Создание комплексного дашборда

## Создадим дашборд для мониторинга приложения:

### Панель 1: Память JVM
```promql
jvm_memory_used_bytes{area="heap"}

rate(http_server_requests_seconds_count[1m])

system_cpu_usage

while true; do curl http://localhost:8080/actuator/health > /dev/null; sleep 0.1; done


### Файл 5: `finish.md`
```markdown
# Поздравляю! Вы завершили практикум

## Что мы изучили:
✅ Настройку Prometheus для сбора метрик Java приложения  
✅ Основы языка запросов PromQL  
✅ Создание дашбордов в Grafana  
✅ Мониторинг ключевых метрик JVM  

## Для дальнейшего изучения:
- Настройка алертов в Grafana
- Мониторинг бизнес-метрик приложения
- Использование Micrometer для кастомных метрик
- Настройка Spring Boot Actuator endpoints

## Ссылки:
- [Prometheus Documentation](https://prometheus.io/docs/)
- [Grafana Documentation](https://grafana.com/docs/)
- [Spring Boot Actuator](https://docs.spring.io/spring-boot/docs/current/reference/html/actuator.html)

Стенд будет автоматически остановлен через несколько минут.

