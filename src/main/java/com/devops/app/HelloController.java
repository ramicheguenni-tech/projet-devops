package com.devops.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;
import java.util.HashMap;

@RestController
public class HelloController {

    @GetMapping("/")
    public Map<String, String> home() {
        Map<String, String> response = new HashMap<>();
        response.put("message", "Hello from DevOps App!");
        response.put("team", "Rami Cheguenni");
        response.put("school", "SESAME Technology");
        response.put("version", "1.0.0");
        return response;
    }

    @GetMapping("/health")
    public Map<String, String> health() {
        Map<String, String> response = new HashMap<>();
        response.put("status", "UP");
        response.put("author", "Rami Cheguenni");
        return response;
    }

    @GetMapping("/api/info")
    public Map<String, String> info() {
        Map<String, String> response = new HashMap<>();
        response.put("project", "DevOps CI/CD Pipeline");
        response.put("school", "SESAME Technology");
        response.put("student", "Rami Cheguenni");
        response.put("email", "rami.cheguenni@sesame.com.tn");
        response.put("tools", "Jenkins, SonarQube, Nexus, Docker, Prometheus, Grafana");
        return response;
    }
}
