package com.mulan.service

import com.cfgglobal.test.service.base.BaseService
import com.mulan.domain.Customer
import org.springframework.stereotype.Service

@Service
class CustomerService : BaseService<Customer, Long>()