package fia.ues.sv.libues.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
	@Qualifier("customUserDetailsService")
	UserDetailsService userDetailsService;
	
	@Autowired
	PersistentTokenRepository tokenRepository;
	
	@Autowired
	public void configGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailsService);
		auth.authenticationProvider(authenticationProvider());
	}
	 
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.authorizeRequests()
		.antMatchers("/","/index").access("!isAuthenticated() or hasRole('USUARIO') or hasRole('ADMINISTRADOR') "
				+ "or hasRole('DBA') or hasRole('BODEGUERO') or hasRole('VENDEDOR') or hasRole('DIRECTOR')")
		
		.antMatchers("/list","/autor-list","/editorial-list", "/tipo-list")
		.access("hasRole('ADMINISTRADOR') or hasRole('DBA')")
		
		.antMatchers("/edit-user-*","/newuser/**","/delete-user-*","/delete-autor-*","/delete-editorial-*","delete-producto-*","/delete-area-*")
		.access("hasRole('ADMINISTRADOR')")
		
		.antMatchers("/autor-agregar","edit-autor-*","/editorial-agrear","edit-editorial-*","/producto-agregar")
		.access("hasRole('ADMINISTRADOR') or hasRole('DBA')")
		
		
		
		.and().formLogin().loginPage("/login").loginProcessingUrl("/login").usernameParameter("ssoId").passwordParameter("password")
		.and().rememberMe().rememberMeParameter("remeber-me").tokenRepository(tokenRepository).tokenValiditySeconds(86400)
		.and().csrf()
		.and().exceptionHandling().accessDeniedPage("/Access_Denied");
	}
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider(){
		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
		authenticationProvider.setUserDetailsService(userDetailsService);
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		return authenticationProvider;
	}
	
	@Bean
	public PersistentTokenBasedRememberMeServices getPersistentTokenBasedRememberMeServices(){
		PersistentTokenBasedRememberMeServices tokenBasedService = new PersistentTokenBasedRememberMeServices("remeber-me", userDetailsService, tokenRepository);
		return tokenBasedService;
	}
	
	@Bean
	public AuthenticationTrustResolver getAuthenticationTrustResolver(){
		return new AuthenticationTrustResolverImpl();
	}

}

