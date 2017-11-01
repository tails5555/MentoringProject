package net.skhu.mentoring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import net.skhu.mentoring.service.MyAuthenticationProvider;


@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter
{
    @Autowired MyAuthenticationProvider myAuthenticationProvider;

    @Override
    public void configure(WebSecurity web) throws Exception
    {
        web.ignoring().antMatchers("/res/**");
        web.ignoring().antMatchers("/img/**");
        web.ignoring().antMatchers("/src/**");
        web.ignoring().antMatchers("/css/**");
        web.ignoring().antMatchers("/assets/**");
        web.ignoring().antMatchers("/lib/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception
    {
        http.authorizeRequests()
            .antMatchers("/employee/**").access("ROLE_EMPLLOYEE")
            .antMatchers("/professor/**").access("ROLE_PROFESSOR")
            .antMatchers("/studChairman/**").access("ROLE_STUDCHAIRMAN")
            .antMatchers("/mento/**").access("ROLE_MENTO")
            .antMatchers("/menti/**").access("ROLE_MENTI")
            .antMatchers("/guest/**").permitAll()
            .antMatchers("/").permitAll()
            .antMatchers("/**").authenticated();

        http.csrf().disable();

        http.formLogin()
            .loginPage("/guest/login")
            .loginProcessingUrl("/guest/login_processing")
            .failureUrl("/guest/login?error")
            .defaultSuccessUrl("/user/index", true)
            .usernameParameter("loginId")
            .passwordParameter("passwd");

        http.logout()
            .logoutRequestMatcher(new AntPathRequestMatcher("/user/logout_processing"))
            .logoutSuccessUrl("/")
            .invalidateHttpSession(true);

        http.authenticationProvider(myAuthenticationProvider);
    }
}
