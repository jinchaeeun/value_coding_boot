package com.hustar.value_coding_boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@SpringBootApplication(exclude = {MultipartAutoConfiguration.class})
public class ValueCodingBootApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(ValueCodingBootApplication.class, args);
	}
	
	@Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
	
}
