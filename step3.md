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

## Создаем первую панель:
1. В поле запроса введите: `jvm_memory_used_bytes`
2. Нажмите **Apply**
3. Дайте название панели: "JVM Memory Usage"

## Полезные метрики для тестирования:
```promql
# Использование памяти heap
jvm_memory_used_bytes{area="heap"}

# Количество HTTP запросов
rate(http_server_requests_seconds_count[1m])

# Использование CPU
system_cpu_usage

# Количество потоков JVM
jvm_threads_live


## После создания файла:

1. **Сохраните** `step3.md` в GitHub репозитории
2. **Убедитесь, что теперь у вас есть ВСЕ 8 файлов:**
   - ✅ `index.json`
   - ✅ `setup.sh` 
   - ✅ `intro.md`
   - ✅ `step1.md`
   - ✅ `step2.md`
   - ✅ `step3.md` ← только что создали
   - ✅ `step4.md`
   - ✅ `finish.md`

3. **Вернитесь в Killercoda**
4. **Нажмите "Sync Now"**
5. **Сценарий должен появиться** в списке "My Scenarios"

После этого вы сможете запустить сценарий и увидеть 3 сервиса в статусе UP!

