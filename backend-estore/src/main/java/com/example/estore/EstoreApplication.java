package com.example.estore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
public class EstoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(EstoreApplication.class, args);
    }

}
