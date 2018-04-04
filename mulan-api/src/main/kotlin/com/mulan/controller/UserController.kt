package com.mulan.controller

import com.cfgglobal.test.base.ApiResp
import com.cfgglobal.test.cache.CacheClient
import com.cfgglobal.test.config.app.ApplicationProperties
import com.cfgglobal.test.config.json.JsonConfig
import com.cfgglobal.test.domain.User
import com.cfgglobal.test.email.MailManager
import com.cfgglobal.test.enums.UserType
import com.cfgglobal.test.service.*
import com.cfgglobal.test.util.querydsl.Q
import com.cfgglobal.test.web.base.BaseController
import com.mulan.domain.Product
import io.vavr.API.Map
import io.vavr.collection.List
import io.vavr.kotlin.toVavrList
import lombok.extern.slf4j.Slf4j
import org.apache.commons.lang3.RandomStringUtils

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.http.ResponseEntity
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.web.bind.annotation.*
import javax.servlet.http.HttpServletRequest


@RestController
@RequestMapping("/v1/user")
@Slf4j
@EnableConfigurationProperties(value = *arrayOf(ApplicationProperties::class))
class UserController : BaseController() {
    val log = LoggerFactory.getLogger(UserController::class.java)!!
    @Autowired
    lateinit var appProp: ApplicationProperties

    @Autowired
    lateinit var userService: UserService
    @Autowired
    lateinit var roleService: RoleService
    @Autowired
    lateinit var branchService: BranchService
    @Autowired
    lateinit var passwordEncoder: PasswordEncoder
    @Autowired
    lateinit var mailManager: MailManager

    @Autowired
    lateinit var cacheClient: CacheClient





    @GetMapping("types")
    fun types(): ResponseEntity<List<UserType>> {
        val list: List<UserType> = UserType.values().toList().toVavrList()
        return ResponseEntity.ok(when {
            loginUser.role.id == 100L -> list.filter { it == UserType.INDIVIDUAL || it == UserType.COMPANY }
            else -> list
        })

    }

    @GetMapping("profile")
    fun index(): ResponseEntity<User> {
        return ResponseEntity.ok(userService.findOne(loginUser.id))
    }

    @PostMapping("password")
    fun updatePassword(oldPassword: String, newPassword: String, confirmPassword: String): ResponseEntity<*> {
        //  log.info("newPassword {}", newPassword)
        val user = loginUser
        if (!passwordEncoder.matches(oldPassword, user.password)) {
            throw  IllegalArgumentException("old password not match")
        }
        if (newPassword != confirmPassword) {
            throw  IllegalArgumentException("new password not equal")
        } else {
            user.password = passwordEncoder.encode(newPassword)
            userService.save(user)
            cacheClient.deleteByKey(appProp.userClass + "-" + user.username)

            val apiResp = ApiResp()
            apiResp.message = "success"
            return ResponseEntity.ok(apiResp)
        }
    }





    @PutMapping("/{id}/reset-password")
    fun resetPassword(@PathVariable id: Long?): ResponseEntity<*> {
        val user = userService.findOne(id)
        val password = RandomStringUtils.randomAlphanumeric(8)
        val encyptPassword = passwordEncoder.encode(password)
        user.password = encyptPassword
        val template = "/email/pwdReset.ftl"
        val context = Map<String, Any>("user", user,
                "password", password,
                "domain", appProp.domain)
        val emails = userService.getEmails(user)
        emails.forEach { email -> mailManager.sendSystem("Password Reset", email, template, context) }

        userService.save(user)
        JsonConfig.start()
                .include(User::class.java, Q.user.id)
                .end()
        cacheClient.deleteByKey(appProp.userClass + "-" + user.username)

        return ResponseEntity.ok(user)

    }



    companion object {


        val SYS_BRANCH_ID = 1L
    }


}