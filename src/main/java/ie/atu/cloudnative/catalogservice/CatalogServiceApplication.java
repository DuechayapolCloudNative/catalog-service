package ie.atu.cloudnative.catalogservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.core.env.Environment;

@SpringBootApplication
// Loads configuration data beans in the Spring context
@ConfigurationPropertiesScan
public class CatalogServiceApplication {

	@Autowired
	private Environment environment;

	public static void main(String[] args) {
        System.out.println("Hello");
		SpringApplication.run(CatalogServiceApplication.class, args);
	}
}
