package com.example.producer.controller;

import com.example.producer.properties.ApplicationProperties;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProducerController {

    private final ApplicationProperties applicationProperties;

    public ProducerController(ApplicationProperties applicationProperties) {
        this.applicationProperties = applicationProperties;
    }

    @GetMapping("/properties")
    public ResponseEntity<PropertiesResponse> getProperties() {
        return ResponseEntity.ok(new PropertiesResponse(applicationProperties.getMessage()));
    }
}
