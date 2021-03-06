package br.com.casadocodigo.loja.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import br.com.casadocodigo.loja.daos.UserDAO;

@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDAO users;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/products/form").hasRole("ADMIN")
			.antMatchers("/shopping/**").permitAll()
			.antMatchers(HttpMethod.POST, "/products").hasRole("ADMIN")
			.antMatchers("/products/**").permitAll()
			.antMatchers("/resources/**").permitAll()
			.and().formLogin().loginPage("/login").permitAll()
			.and().logout().logoutSuccessUrl("/products").permitAll()
			.and().exceptionHandling().accessDeniedPage("/WEB-INF/views/403.jsp");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(users)
			.passwordEncoder(new BCryptPasswordEncoder());
	}
}
