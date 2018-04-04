package com.mulan

import com.cfgglobal.test.config.app.ApplicationProperties
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication(scanBasePackages = arrayOf("com.cfgglobal.test", "com.mulan"))
class Application

fun main(args: Array<String>) {
    ApplicationProperties.myUserClass = "com.mulan.domain.Customer"
    ApplicationProperties.entityScanPackage = arrayOf("com.cfgglobal.test.domain","com.mulan.domain")
  //  ApplicationProperties.enumPackage = "com.cfgglobal.test.enums"
   // ApplicationProperties.enums = listOf()
    SpringApplication.run(Application::class.java, *args)
}
