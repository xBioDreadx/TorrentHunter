package com.example

import org.apache.log4j.BasicConfigurator
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication
class TorrentHunterApplication {

	static void main(String[] args) {
		SpringApplication.run TorrentHunterApplication, args
		BasicConfigurator.configure();
	}
}
