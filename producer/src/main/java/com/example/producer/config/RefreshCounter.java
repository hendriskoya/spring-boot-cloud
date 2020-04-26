package com.example.producer.config;

import java.util.concurrent.atomic.AtomicLong;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.context.scope.refresh.RefreshScopeRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class RefreshCounter {

    private final Logger LOG = LoggerFactory.getLogger(RefreshCounter.class);

    private final AtomicLong counter = new AtomicLong(0);

    @EventListener
    public void refresh(RefreshScopeRefreshedEvent e) {
        LOG.info("The refresh count is now at: {}", counter.incrementAndGet());
    }
}
