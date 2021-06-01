package com.hustar.value_coding_boot.configuration;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@PropertySource("classpath:/application.properties") //①
public class DatabaseConfiguration {
	
	@Autowired		//<property> 태그 명시 안해도 Dependency 객체 자동 주입 (Automatic Dependency Injection)
    private ApplicationContext applicationContext;
	 
    //②
    @Bean
    @ConfigurationProperties(prefix="spring.datasource.hikari")
    public HikariConfig hikariConfig() {
        return new HikariConfig();
    }

    //③
    @Bean(destroyMethod = "close")
    public DataSource dataSource() throws Exception {
        DataSource dataSource = new HikariDataSource(hikariConfig());
//        System.out.println(dataSource.toString());
        return dataSource;
    }
    
    @Bean			//MyBatis에서 Sql Session 생성한다. SqlSessionFactory는 데이터베이스 연결과 SQL 실행에 대한 모든 것을 한다. SqlSessionFactory를 생성해주는 객체는 SqlSessionFactoryBean이다.
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/*.xml"));	//MyBatis Mapper 파일(sql 쿼리) 위치를 설정, **은 하위 폴더, *.xml은 xml 파일 전체를 의미
        return sqlSessionFactoryBean.getObject();
    }

    @Bean			//SqlSession을 구현하고 코드에서 SqlSession을 대체하는 역할, 여러 개의 DAO나 Mapper에서 공유할 수 있다.
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
    
}