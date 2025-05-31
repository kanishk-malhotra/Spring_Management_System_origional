# Use Maven to build the app
FROM maven:3.9.4-eclipse-temurin-21 as builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Use a smaller image to run the app
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=builder /app/target/Spring_Management_System-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
