package com.demo.kafka.service;


import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class KafkaLogPublisher {

    private final KafkaTemplate<String, String> kafkaTemplate;

    public KafkaLogPublisher(KafkaTemplate<String, String> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    public void publish(String topic, String message) {
        kafkaTemplate.send(topic, message);
    }
}

