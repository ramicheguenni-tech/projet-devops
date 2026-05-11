pipeline {
    agent any

    environment {
        APP_NAME   = 'devops-app'
        VERSION    = '1.0.0'
        SONAR_HOST = 'http://localhost:9000'
        NEXUS_URL  = 'http://localhost:8081'
    }

    stages {

        stage('Checkout') {
            steps {
                echo '📥 Checkout - Rami Cheguenni - SESAME Technology'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo '🔨 Building application...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running JUnit tests...'
                sh 'mvn test'
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Code Quality - SonarQube') {
            steps {
                echo '🔍 SonarQube analysis...'
                withSonarQubeEnv('SonarQube') {
                    sh '''
                        mvn sonar:sonar \
                            -Dsonar.projectKey=devops-app \
                            -Dsonar.projectName="DevOps App - SESAME" \
                            -Dsonar.java.coveragePlugin=jacoco \
                            -Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml
                    '''
                }
            }
        }

        stage('Publish to Nexus') {
            steps {
                echo '📦 Publishing to Nexus...'
                sh 'mvn deploy -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                sh "docker build -t ${APP_NAME}:${VERSION} ."
                sh "docker tag ${APP_NAME}:${VERSION} ${APP_NAME}:latest"
            }
        }

        stage('OWASP ZAP Security Scan') {
            steps {
                echo '🔒 Running OWASP ZAP security scan...'
                sh '''
                    mkdir -p zap-reports
                    docker run --rm \
                        --network devops-network \
                        -v $(pwd)/zap-reports:/zap/wrk:rw \
                        ghcr.io/zaproxy/zaproxy:stable \
                        zap-baseline.py \
                        -t http://devops-app:8080 \
                        -r zap-report.html \
                        -I || true
                    echo "OWASP ZAP scan completed"
                '''
            }
            post {
                always {
                    echo '✅ OWASP ZAP scan done - check zap-reports/zap-report.html'
                }
            }
        }

        stage('Deploy Container') {
            steps {
                echo '🚀 Deploying container...'
                sh "docker stop ${APP_NAME} || true"
                sh "docker rm ${APP_NAME} || true"
                sh """
                    docker run -d \
                        --name ${APP_NAME} \
                        --network devops-network \
                        -p 8085:8080 \
                        --restart unless-stopped \
                        ${APP_NAME}:latest
                """
                echo "✅ App deployed at http://localhost:8085"
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline SUCCESS!'
        }
        failure {
            echo '❌ Pipeline FAILED - check logs'
        }
    }
}
