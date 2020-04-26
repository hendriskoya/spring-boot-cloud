package com.example.producer.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class ApplicationEventListener {

    private static final Logger LOG = LoggerFactory.getLogger(ApplicationEventListener.class);

//    @EventListener
//    public void listener(ApplicationEvent event) {
//        LOG.info("\nevent: {}", event);
//    }

    @EventListener
    public void listener(ApplicationReadyEvent event) {
        LOG.info("\n\nevent: {}\n", event);
    }
}
