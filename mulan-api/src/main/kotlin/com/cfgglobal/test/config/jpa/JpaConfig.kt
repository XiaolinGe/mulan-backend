package com.cfgglobal.test.config.jpa

import com.cfgglobal.test.dao.base.BaseDaoFactoryBean
import com.querydsl.jpa.impl.JPAQueryFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.autoconfigure.domain.EntityScan
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.jpa.domain.support.AuditingEntityListener
import org.springframework.data.jpa.repository.config.EnableJpaAuditing
import org.springframework.data.jpa.repository.config.EnableJpaRepositories
import org.springframework.transaction.annotation.EnableTransactionManagement

import javax.persistence.EntityManager

@Configuration
@EnableJpaRepositories(repositoryFactoryBeanClass = BaseDaoFactoryBean::class, basePackages = arrayOf("com.cfgglobal.test.dao", "com.mulan.dao"))
@EntityScan(basePackages = arrayOf("com.cfgglobal.test.domain", "com.mulan.domain"))
@EnableJpaAuditing
@EnableTransactionManagement
class JpaConfig {


    @Autowired
    private val entityManager: EntityManager? = null

    @Bean
    fun jpaQueryFactory(): JPAQueryFactory {
        return JPAQueryFactory(entityManager)
    }


    @Bean
    fun createAuditingListener(): AuditingEntityListener {
        return AuditingEntityListener()
    }
}
