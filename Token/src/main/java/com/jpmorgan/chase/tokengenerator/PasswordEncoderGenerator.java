package com.jpmorgan.chase.tokengenerator;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoderGenerator {
	public static void main(String[] args) {

		String password = "123456";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);
		String hashedPassword = passwordEncoder.encode(password);
		System.out.println(hashedPassword);

	}
}
