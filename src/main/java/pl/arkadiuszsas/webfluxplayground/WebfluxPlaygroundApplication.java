package pl.arkadiuszsas.webfluxplayground;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.r2dbc.repository.config.EnableR2dbcRepositories;

@SpringBootApplication(scanBasePackages = "pl.arkadiuszsas.webfluxplayground.${current}")
@EnableR2dbcRepositories(basePackages = "pl.arkadiuszsas.webfluxplayground.${current}")
public class WebfluxPlaygroundApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebfluxPlaygroundApplication.class, args);
	}

}
