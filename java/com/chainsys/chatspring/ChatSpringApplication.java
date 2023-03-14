package com.chainsys.chatspring;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@EnableSwagger2
public class ChatSpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(ChatSpringApplication.class, args);
		Logger logger = LoggerFactory.getLogger(ChatSpringApplication.class);
		logger.info("Hell 'O' Chat ");
	}

}
