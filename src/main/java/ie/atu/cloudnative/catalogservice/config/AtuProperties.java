package ie.atu.cloudnative.catalogservice.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

// Marks the class as a source for config properties starting with “atu.”
@ConfigurationProperties(prefix = "atu")
public class AtuProperties {
    // A message to welcome users.
    // Field for the custom atu.greeting property, parsed as String
    private String greeting;

    public String getGreeting() { return greeting; }
    public void setGreeting(String greeting) {this.greeting = greeting;}
}
