# Part 1
#FROM eclipse-temurin:21
#WORKDIR /workspace
#ARG JAR_FILE=build/libs/*.jar
#COPY ${JAR_FILE} catalog-service.jar
#ENTRYPOINT ["java", "-jar", "catalog-service.jar"]

## Part 2
#FROM eclipse-temurin:21 AS builder
#WORKDIR /workspace
#ARG JAR_FILE=build/libs/*.jar
#COPY ${JAR_FILE} catalog-service.jar
## Extract layers
#RUN java -Djarmode=tools -jar catalog-service.jar extract --layers --launcher
#
#FROM eclipse-temurin:21
#WORKDIR workspace
## Copy layers separately
#COPY --from=builder /workspace/catalog-service/dependencies ./
#COPY --from=builder /workspace/catalog-service/spring-boot-loader ./
#COPY --from=builder /workspace/catalog-service/snapshot-dependencies ./
#COPY --from=builder /workspace/catalog-service/application ./
##  Use JarLauncher to launch extracted jar
#ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]

# Part 3
FROM eclipse-temurin:21 AS builder
WORKDIR /workspace
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} catalog-service.jar
# Extract layers
RUN java -Djarmode=tools -jar catalog-service.jar extract --layers --launcher

FROM eclipse-temurin:21
RUN useradd spring
USER spring
WORKDIR workspace
# Copy layers separately
COPY --from=builder /workspace/catalog-service/dependencies ./
COPY --from=builder /workspace/catalog-service/spring-boot-loader ./
COPY --from=builder /workspace/catalog-service/snapshot-dependencies ./
COPY --from=builder /workspace/catalog-service/application ./
#  Use JarLauncher to launch extracted jar
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]