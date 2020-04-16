package com.example.consumer.controller;

import com.example.consumer.properties.ApplicationProperties;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ConsumerController {

    private final ApplicationProperties applicationProperties;

    public ConsumerController(ApplicationProperties applicationProperties) {
        this.applicationProperties = applicationProperties;
    }

    @GetMapping("/properties")
    public ResponseEntity<PropertiesResponse> getProperties() {
        return ResponseEntity.ok(new PropertiesResponse(applicationProperties.getMessage()));
    }
}
