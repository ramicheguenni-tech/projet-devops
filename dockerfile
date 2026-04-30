# Étape 1 : Image de base avec Java 11
FROM openjdk:11-jre-slim

# Étape 2 : Métadonnées de l'image
LABEL maintainer="rami.cheguenni@sesame.com.tn"
LABEL description="Application Achat DevOps"

# Étape 3 : Créer un répertoire pour l'application
WORKDIR /app

# Étape 4 : Copier le JAR généré par Maven
# Le JAR se trouve dans le dossier target après compilation
COPY target/*.jar app.jar

# Étape 5 : Exposer le port de l'application (Spring Boot par défaut: 8080)
EXPOSE 8080

# Étape 6 : Variables d'environnement (optionnel)
ENV JAVA_OPTS=""

# Étape 7 : Commande de démarrage
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
