package com.mulan.service

import com.cfgglobal.test.service.base.BaseService
import com.mulan.domain.Product
import org.springframework.stereotype.Service

@Service
class ProductService: BaseService<Product, Long>()