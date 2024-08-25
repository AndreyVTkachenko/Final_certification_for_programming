package ru.gb;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import ru.gb.model.User;
import ru.gb.repository.UserRepository;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Bean
	public CommandLineRunner demo(UserRepository userRepository, BCryptPasswordEncoder encoder) {
		return args -> {
			if (userRepository.findByEmail("my_email@example.com").isEmpty()) {
				User user = new User();
				user.setFirstName("John");
				user.setLastName("Smith");
				user.setEmail("my_email@example.com");
				user.setPassword(encoder.encode("my_password"));
				userRepository.save(user);
			}
		};
	}
}
