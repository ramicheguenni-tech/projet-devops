# Rapport de Securite CI/CD - OWASP Top 10
## Projet DevOps - SESAME Technology
## Auteur: Rami Cheguenni | rami.cheguenni@sesame.com.tn

## 1. Gestion des Secrets
- Tokens GitHub stockes dans Jenkins Credentials Store
- Token SonarQube: Secret Text Jenkins (ID: sonar-token)
- Credentials Nexus: Username/Password Jenkins (ID: nexus-creds)
- Aucun mot de passe en clair dans le code

## 2. OWASP Top 10
| Risque | Statut | Mesure |
|--------|--------|--------|
| A01 - Broken Access Control | Mitigue | Actuator endpoints documentes |
| A02 - Cryptographic Failures | Mitigue | Pas de donnees sensibles exposees |
| A03 - Injection | Mitigue | Spring Boot validation activee |
| A05 - Security Misconfiguration | Partiel | HTTPS non active (dev only) |
| A06 - Vulnerable Components | Mitigue | SonarQube analyse dependances |
| A09 - Security Logging | Mitigue | Prometheus + Grafana monitoring |

## 3. Securite Docker
- Image de base: eclipse-temurin:21-jre-alpine (minimale)
- Utilisateur non-root dans le conteneur
- Health check integre
- Aucun secret dans le Dockerfile

## 4. Vulnerabilites Restantes
- HTTPS non configure (env. developpement)
- Recommandation: OWASP Dependency-Check dans Jenkins
- Recommandation: Quality Gates SonarQube bloquants

## 5. OWASP ZAP - Scan de Securite
- Scanner integre dans le pipeline Jenkins
- Rapport genere a chaque build
- URL scannee: http://devops-app:8080
