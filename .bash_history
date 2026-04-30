docker run -d   --name jenkins   -p 8080:8080   -p 50000:50000   -v jenkins_home:/var/jenkins_home   -v /var/run/docker.sock:/var/run/docker.sock   jenkins/jenkins:lts
sudo apt update
sudo apt upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
docker --version
cd /var/lib/jenkins/workspace/Achat-Pipeline/achat
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y
ls -la /var/lib/jenkins/workspace/
sudo -i
systemctl status jenkins
vagrant ssh
git --version
git remote -v
# Initialize local repo
git init
git config --global user.name "Rami Cheguenni"
git config --global user.email "rami.cheguenni@sesame.com.tn"
# Create repo on GitHub/GitLab, then:
git remote add origin https://github.com/ramicheguenni-tech/projet-devops.git
git branch -M main
git push -u origin main
git init
git config --global user.name "Rami Cheguenni"
git config --global user.email "rami.cheguenni@sesame.com.tn"
git remote add origin https://github.com/ramicheguenni-tech/projet-devops.git
git branch -M main
git push -u origin main
git status
git branch
git status
# Create a README file
echo "# Projet DevOps - SESAME Technology" > README.md
echo "**Equipe:** Rami Cheguenni" >> README.md
# Stage and commit
git add .
git commit -m "Initial commit - project setup"
git branch -M main
git push -u origin main
# Initialize local repo
git init
git config --global user.name "Rami Cheguenni"
git config --global user.email "rami.cheguenni@sesame.com.tn"
# Create repo on GitHub/GitLab, then:
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
# Inside vagrant ssh:
docker --version
java --version
mvn --version
jenkins --version 2>/dev/null || echo "Jenkins not installed"
mvn --version
java --version
docker --version
echo "=== OS ===" && cat /etc/os-release | grep PRETTY_NAME
echo "=== Git ===" && git --version 2>/dev/null || echo "NOT INSTALLED"
echo "=== Java ===" && java -version 2>/dev/null || echo "NOT INSTALLED"
echo "=== Maven ===" && mvn --version 2>/dev/null || echo "NOT INSTALLED"
echo "=== Docker ===" && docker --version 2>/dev/null || echo "NOT INSTALLED"
echo "=== Docker Compose ===" && docker compose version 2>/dev/null || echo "NOT INSTALLED"
echo "=== Jenkins ===" && systemctl status jenkins 2>/dev/null | grep "Active:" || echo "NOT INSTALLED"
echo "=== Running containers ===" && docker ps --format "table {{.Names}}\t{{.Status}}" 2>/dev/null || echo "No containers"
echo "=== RAM ===" && free -h
echo "=== Disk ===" && df -h /
echo "=== Git repo ===" && git -C ~ remote -v 2>/dev/null || echo "No repo found"
cd ~
mkdir -p projet-devops && cd projet-devops
mkdir -p src/main/java/com/devops/app
mkdir -p src/main/resources
mkdir -p src/test/java/com/devops/app
touch pom.xml
rm pom.xml 
cat > pom.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.0</version>
    </parent>

    <groupId>com.devops</groupId>
    <artifactId>devops-app</artifactId>
    <version>1.0.0</version>
    <packaging>jar</packaging>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-registry-prometheus</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
            <plugin>
                <groupId>org.sonarsource.scanner.maven</groupId>
                <artifactId>sonar-maven-plugin</artifactId>
                <version>3.10.0.2594</version>
            </plugin>
            <plugin>
                <groupId>org.jacoco</groupId>
                <artifactId>jacoco-maven-plugin</artifactId>
                <version>0.8.11</version>
                <executions>
                    <execution>
                        <goals><goal>prepare-agent</goal></goals>
                    </execution>
                    <execution>
                        <id>report</id>
                        <phase>test</phase>
                        <goals><goal>report</goal></goals>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
</project>
EOF

ls 
cat > src/main/java/com/devops/app/Application.java << 'EOF'
package com.devops.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
EOF

cat > src/main/java/com/devops/app/HelloController.java << 'EOF'
package com.devops.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

@RestController
public class HelloController {

    @GetMapping("/")
    public Map<String, String> home() {
        return Map.of(
            "message", "Hello from DevOps App!",
            "team", "Rami Cheguenni",
            "school", "SESAME Technology"
        );
    }

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of("status", "UP");
    }
}
EOF

cat > src/main/resources/application.properties << 'EOF'
spring.application.name=devops-app
server.port=8080
management.endpoints.web.exposure.include=*
management.endpoint.health.show-details=always
management.prometheus.metrics.export.enabled=true
EOF

cat > src/test/java/com/devops/app/HelloControllerTest.java << 'EOF'
package com.devops.app;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
public class HelloControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testHome() throws Exception {
        mockMvc.perform(get("/"))
               .andExpect(status().isOk())
               .andExpect(jsonPath("$.message").value("Hello from DevOps App!"));
    }

    @Test
    public void testHealth() throws Exception {
        mockMvc.perform(get("/health"))
               .andExpect(status().isOk())
               .andExpect(jsonPath("$.status").value("UP"));
    }
}
EOF

mvn clean package -DskipTests
# Install Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc   https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]"   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
# Start Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
# Get initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# Remove old broken entry
sudo rm /usr/share/keyrings/jenkins-keyring.asc
sudo rm /etc/apt/sources.list.d/jenkins.list
# Add correct Jenkins key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg
# Add correct repo
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
# Update and install
sudo apt-get update
sudo apt-get install -y jenkins
# Start Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
# Get password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo systemctl status jenkins | grep "Active:"
clearvagrant@vagrant:~/projet-devops$ # Remove old broken entry
sudo rm /usr/share/keyrings/jenkins-keyring.asc
sudo rm /etc/apt/sources.list.d/jenkins.list
# Add correct Jenkins key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg
# Add correct repo
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
# Update and install
sudo apt-get update
sudo apt-get install -y jenkins
# Start Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
# Get password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
Ign:1 https://pkg.jenkins.io/debian-stable binary/ InRelease
Hit:2 https://download.docker.com/linux/ubuntu noble InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu noble InRelease
Hit:4 http://security.ubuntu.com/ubuntu noble-security InRelease
Get:5 https://pkg.jenkins.io/debian-stable binary/ Release [2,044 B]
Get:6 https://pkg.jenkins.io/debian-stable binary/ Release.gpg [833 B]
Hit:7 http://us.archive.ubuntu.com/ubuntu noble-updates InRelease
Hit:8 http://us.archive.ubuntu.com/ubuntu noble-backports InRelease
Ign:6 https://pkg.jenkins.io/debian-stable binary/ Release.gpg
Reading package lists... Done
W: GPG error: https://pkg.jenkins.io/debian-stable binary/ Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 7198F4B714ABFC68
E: The repository 'https://pkg.jenkins.io/debian-stable binary/ Release' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Package jenkins is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source
E: Package 'jenkins' has no installation candidate
Failed to start jenkins.service: Unit jenkins.service not found.
Failed to enable unit: Unit file jenkins.service does not exist.
cat: /var/lib/jenkins/secrets/initialAdminPassword: No such file or directory
vagrant@vagrant:~/projet-devops$ sudo systemctl status jenkins | grep "Active:"
Unit jenkins.service could not be found.
vagrant@vagrant:~/projet-devops$# Remove broken repo
sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo rm -f /usr/share/keyrings/jenkins-keyring.gpg
# Download Jenkins WAR directly
cd ~
wget https://get.jenkins.io/wa
# Remove broken repo
sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo rm -f /usr/share/keyrings/jenkins-keyring.gpg
# Download Jenkins WAR directly
cd ~
wget https://get.jenkins.io/war-stable/latest/jenkins.war
# Verify download
ls -lh jenkins.war
# Create Jenkins home directory
mkdir -p ~/.jenkins
# Run Jenkins in background
export JENKINS_HOME=~/.jenkins
nohup java -jar ~/jenkins.war --httpPort=8090 > ~/jenkins.log 2>&1 &
# Wait 30 seconds for startup
sleep 30
# Check if running
curl -s http://localhost:8090/login | grep -o "Jenkins" | head -1
# Get initial admin password
cat ~/.jenkins/secrets/initialAdminPassword
