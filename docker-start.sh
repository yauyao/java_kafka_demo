#!/bin/bash

echo "🧹 停止並移除所有 Docker Compose 容器..."
docker-compose down -v --remove-orphans

#echo "🧼 清除未使用的 Docker 資源（images, volumes, networks）..."
#docker system prune -a -f --volumes

echo "🚀 重新建置並啟動 Docker Compose 服務..."
docker-compose up --build -d

echo "✅ 所有服務已啟動完成！"
docker-compose up -d

##建立 topic 並指定 replication factor 和 partition
docker exec -it kafka1 kafka-topics.sh \
  --create \
  --topic test-topic \
  --bootstrap-server kafka1:9092 \
  --replication-factor 2 \
  --partitions 3

## 查看 topic 狀態
docker exec -it kafka1 kafka-topics.sh \
  --describe \
  --topic test-topic \
  --bootstrap-server kafka1:9092

## 建立 log-topic
docker exec -it kafka1 kafka-topics.sh \
  --create \
  --topic log-topic \
  --bootstrap-server kafka1:9092 \
  --replication-factor 2 \
  --partitions 3 || echo "log-topic 已存在，略過建立"

