package com.demo.kafka.service;


import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class KafkaLogSubscriber {

    @KafkaListener(topics = "log-topic", groupId = "log-consumer-group")
    public void listen(String message) {
        System.out.println("Received message: " + message);
    }
}

