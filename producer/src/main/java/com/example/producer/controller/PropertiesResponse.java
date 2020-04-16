package com.example.producer.controller;

public class PropertiesResponse {

    private final String message;

    public PropertiesResponse(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
