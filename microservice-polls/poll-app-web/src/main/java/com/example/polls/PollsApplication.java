package com.example.polls;

import java.util.Arrays;
import java.util.TimeZone;

import javax.annotation.PostConstruct;

import com.example.polls.model.Role;
import com.example.polls.model.RoleName;
import com.example.polls.repository.RoleRepository;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters;


@SpringBootApplication
@EntityScan(basePackageClasses = { PollsApplication.class, Jsr310JpaConverters.class })
public class PollsApplication {
	@Bean
    CommandLineRunner init(RoleRepository roleRepository) {
        return (evt) -> {
			if (roleRepository.count() > 0) {
				return;
			}
	
			Role admin = new Role(RoleName.ROLE_ADMIN);
			roleRepository.save(admin);
			Role user = new Role(RoleName.ROLE_USER);
			roleRepository.save(user);
		};
    }

	@PostConstruct
	void init() {
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
	}

	public static void main(String[] args) {
		SpringApplication.run(PollsApplication.class, args);
	}
}
