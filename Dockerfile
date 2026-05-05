FROM eclipse-temurin:21-jre-alpine
LABEL maintainer="Rami Cheguenni <rami.cheguenni@sesame.com.tn>"
LABEL description="DevOps App - SESAME Technology"
WORKDIR /app
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY target/devops-app-1.0.0.jar app.jar
RUN chown appuser:appgroup app.jar
USER appuser
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s CMD wget -q -O /dev/null http://localhost:8080/health || exit 1
ENTRYPOINT ["java", "-jar", "app.jar"]
