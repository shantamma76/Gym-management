package com.xworkz.gym.Configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

import javax.sql.DataSource;
import java.util.Arrays;

@Configuration
@ComponentScan("com.xworkz.gym")
@EnableWebMvc
@Slf4j
public class GymConfiguration {

    GymConfiguration(){
        System.out.println("Running No-Arg Const in GymConfiguration");
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean localContEntMangFaBean(){
        LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
        log.info("this is hp laptop======================================");
        bean.setPackagesToScan("com.xworkz.gym.Entity");
        bean.setDataSource(datasource());
        bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        return bean;
    }

    @Bean
    public ViewResolver onView(){
        return new InternalResourceViewResolver("/",".jsp");
    }

    @Bean
    public DataSource datasource(){
        DriverManagerDataSource dataSource=new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/gym_database");
        dataSource.setUsername("root");
        dataSource.setPassword("Xworkzodc@123");
        return dataSource;
    }

    @Bean(name="multipartResolver")
    public CommonsMultipartResolver commonsMultipartResolver(){
        CommonsMultipartResolver commonsMultipartResolver=new CommonsMultipartResolver();
        return commonsMultipartResolver;
    }


    //-----------------------------------------------------



    @Bean
    public SpringTemplateEngine templateEngine() {
        SpringTemplateEngine templateEngine = new SpringTemplateEngine();
        templateEngine.setTemplateResolver(templateResolver());
        return templateEngine;
    }

    @Bean
    public ClassLoaderTemplateResolver templateResolver() {
        ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
        resolver.setPrefix("/templates/");
        resolver.setSuffix(".html");
        resolver.setTemplateMode("HTML");
        resolver.setCharacterEncoding("UTF-8");
        return resolver;
    }

//    @Override
//    public void addViewControllers(ViewControllerRegistry registry) {
//        registry.addViewController("/").setViewName("index"); // Define your default page
//    }



}
