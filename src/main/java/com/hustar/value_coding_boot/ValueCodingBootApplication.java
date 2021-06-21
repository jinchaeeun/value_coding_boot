package com.hustar.value_coding_boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration;

@SpringBootApplication(exclude = {MultipartAutoConfiguration.class})
public class ValueCodingBootApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(ValueCodingBootApplication.class, args);
	}
}
