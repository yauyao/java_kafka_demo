# 使用官方 OpenJDK 作為建置階段
FROM openjdk:21-jdk-slim AS build

# Install Git and Maven
RUN apt-get update && apt-get install -y git maven

# 建立工作目錄
WORKDIR /app

# 複製 pom.xml 並下載依賴
COPY pom.xml .
RUN mvn dependency:go-offline

# 複製原始碼並建置
COPY src ./src
RUN mvn clean package -DskipTests

# 使用輕量級 JDK 執行 JAR
FROM openjdk:21-jdk-slim

WORKDIR /app

# 從建置階段複製 JAR 檔
COPY --from=build /app/target/*.jar app.jar

# 啟動應用程式
ENTRYPOINT ["java", "-jar", "app.jar"]
