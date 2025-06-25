# java_kafka_demo

✅ 使用方式
1. 將這份內容儲存為 docker-compose.yml
2. 在該目錄下執行：
```
docker-compose up -d
```

3. 在 IntelliJ 的 application.properties 或 application.yml 中設定：
```
spring.kafka.bootstrap-servers=localhost:9092
```
4. 開啟瀏覽器進入 http://localhost:9000 查看 Kafdrop GUI