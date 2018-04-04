package com.mulan.task;

import com.cfgglobal.test.domain.EmailLog;
import com.cfgglobal.test.email.CustomMailUtil;
import com.cfgglobal.test.service.EmailLogService;
import io.vavr.Tuple2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

import static com.cfgglobal.test.enums.TaskStatus.*;


@Component
public class EmailSendWorker {

    @Autowired
    private CustomMailUtil customMailUtil;
    @Autowired
    private EmailLogService customEmailRepository;

    public void execute() {

        EmailLog email = new EmailLog();
        email.setStatus(TODO);
        List<EmailLog> list = customEmailRepository.findForSend(email);
        email.setStatus(FAILURE);
        email.setTimes(3);
        list.addAll(customEmailRepository.findForSend(email));
        list.forEach(item -> {
            Tuple2<String, Boolean> resultVO = customMailUtil.send(item);
            if (resultVO._2) {
                item.setStatus(SUCCESS);
            } else {
                item.setStatus(FAILURE);
                item.setTimes(item.getTimes() + 1);
                item.setMsg(resultVO._1);
            }
            customEmailRepository.update(item);
        });
    }
}
