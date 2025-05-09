FROM eclipse-temurin:17-jdk
VOLUME /tmp
COPY target/*.jar app.jar# 使用するJavaのベースイメージを指定
FROM openjdk:21-jdk-slim

# 作業ディレクトリを指定
WORKDIR /app

# `pom.xml`とソースコードをコピー
COPY pom.xml ./
COPY src /app/src

# Mavenでビルド
RUN mvn clean install

# アプリケーションを起動
CMD ["java", "-jar", "target/schedule-app-0.0.1-SNAPSHOT.jar"]

ENTRYPOINT ["java", "-jar", "/app.jar"]
