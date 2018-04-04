package com.mulan.task;


import com.cfgglobal.test.config.app.ApplicationProperties;
import com.cfgglobal.test.security.AnonAuthentication;
import com.mulan.task.EmailSendWorker;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@EnableScheduling
@EnableConfigurationProperties(value = {ApplicationProperties.class})

public class ScheduledTasks {
    @Autowired
    private ApplicationProperties appProp;

    @Value("${spring.profiles.active}")
    private String profile;

    @Autowired
    private EmailSendWorker emailSendWorker;


    @Scheduled(fixedRate = 1_000 * 5)
    public void email() {
        SecurityContextHolder.getContext().setAuthentication(new AnonAuthentication());
        emailSendWorker.execute();
    }


}
