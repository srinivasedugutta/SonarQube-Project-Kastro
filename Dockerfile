FROM eclipse-temurin:17-jdk

# Create non-root user
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

WORKDIR /app
COPY target/spotify-app-1.0.0.jar /app/spotify-app.jar

# Change ownership
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

EXPOSE 5555

ENTRYPOINT ["java", "-jar", "spotify-app.jar"]
