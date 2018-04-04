package com.mulan.controller

import com.cfgglobal.test.web.base.BaseController
import com.mulan.dao.CustomerDao
import com.mulan.service.ProductService
import com.mulan.dao.ProductDao
import com.mulan.domain.Customer
import com.mulan.domain.Product
import com.mulan.service.CustomerService
import io.vavr.collection.HashMap
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import javax.servlet.http.HttpServletRequest

@RestController
@RequestMapping("/v1/customer")
class CustomerController : BaseController() {
    @Autowired
    lateinit var customerDao: CustomerDao

    @Autowired
    lateinit var customerService: CustomerService

    @ResponseBody
    @GetMapping
    fun index(pageable: Pageable, request: HttpServletRequest): ResponseEntity<Page<Customer>> {
        // val queryParams = HashMap.ofAll(request.parameterMap)
        //val page = customerService.findBySecurity(request.method, request.requestURI, queryParams, pageable)
        val customerList = customerDao.findAll(pageable)
        return ResponseEntity.ok(customerList)
    }

    @GetMapping("{id}")
    fun get(@PathVariable id: Long?): ResponseEntity<*> {
        val customer = customerDao.findOne(id)
        return ResponseEntity.ok(customer)
    }
}