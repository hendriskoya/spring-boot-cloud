package com.example.producer.controller;

import com.example.producer.properties.ApplicationProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProducerController {

    private static final Logger LOG = LoggerFactory.getLogger(ProducerController.class);

    private final ApplicationProperties applicationProperties;

    public ProducerController(ApplicationProperties applicationProperties) {
        this.applicationProperties = applicationProperties;
    }

    @GetMapping("/properties")
    public ResponseEntity<PropertiesResponse> getProperties() {
        LOG.info("Endpoint '/properties' was called at {}", System.currentTimeMillis());
        return ResponseEntity.ok(new PropertiesResponse(applicationProperties.getMessage()));
    }
}
