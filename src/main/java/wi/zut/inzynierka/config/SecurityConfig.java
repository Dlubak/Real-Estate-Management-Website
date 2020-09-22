package wi.zut.inzynierka.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import wi.zut.inzynierka.service.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	/*@Autowired
	private DataSource dataSource;
	*/
	@Autowired
    private UserService userService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
		/*
		  	auth.jdbcAuthentication().dataSource(dataSource)
			.usersByUsernameQuery("select username,password,id from user where username=?")
			.authoritiesByUsernameQuery("SELECT user.username as username, role.name as roles from user INNER JOIN users_roles ON user.id = users_roles.user_id INNER JOIN role ON users_roles.role_id = role.id WHERE user.username = ?");;
		 */
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/addOffer").hasAnyRole("ADMIN", "USER")
				.antMatchers("/addOffer/").hasAnyRole("ADMIN", "USER")
				.antMatchers("/admin/").hasRole("ADMIN")
				.antMatchers("/admin").hasRole("ADMIN")
				.antMatchers("/admin/edit/{id}").hasRole("ADMIN")
				.antMatchers("/admin/edit/{id}/").hasRole("ADMIN")
				//.antMatchers()
				.antMatchers("/profile").hasAnyRole("ADMIN", "USER")
				.antMatchers("/profile/").hasAnyRole("ADMIN", "USER")
				.anyRequest().permitAll()
			.and()
			.formLogin()
				.loginPage("/loginPage")
				.loginProcessingUrl("/authenticateTheUser")
				.permitAll()
			.and()
			.logout().permitAll()
			.logoutSuccessUrl("/")
			.and()
			.exceptionHandling().accessDeniedPage("/loginPage");
	}
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

		//authenticationProvider bean definition
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
		auth.setUserDetailsService(userService); //set the custom user details service
		auth.setPasswordEncoder(passwordEncoder()); //set the password encoder - bcrypt
		return auth;
	}
}
