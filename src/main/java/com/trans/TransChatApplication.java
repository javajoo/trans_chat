package com.trans;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan({"com.trans.mapper"})
@SpringBootApplication
public class TransChatApplication {

	public static void main(String[] args) {
		SpringApplication.run(TransChatApplication.class, args);
	}

}
