package com.demo.kafka.controller;


import com.demo.kafka.service.KafkaLogPublisher;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class LogController {

    private final KafkaLogPublisher kafkaLogPublisher;

    public LogController(KafkaLogPublisher kafkaLogPublisher) {
        this.kafkaLogPublisher = kafkaLogPublisher;
    }

    @PostMapping("/publish")
    public ResponseEntity<String> publish(@RequestBody String message) {
        kafkaLogPublisher.publish("log-topic", message);
        return ResponseEntity.ok("Message published to Kafka");
    }
}

