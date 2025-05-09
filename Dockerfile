FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY pom.xml ./
COPY src ./src

RUN apt-get update && \
    apt-get install -y maven && \
    mvn clean package -DskipTests

CMD ["java", "-jar", "target/schedule-app-0.0.1-SNAPSHOT.jar"]
