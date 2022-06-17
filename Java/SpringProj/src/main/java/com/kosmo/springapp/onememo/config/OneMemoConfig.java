package com.kosmo.springapp.onememo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
public class OneMemoConfig {
	
	@Bean
	public ObjectMapper objectMapper() {
		return new ObjectMapper();
	}
}
