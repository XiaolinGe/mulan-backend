package com.mulan.controller

import com.cfgglobal.test.web.base.BaseController
import com.mulan.service.ProductService
import com.mulan.dao.ProductDao
import com.mulan.domain.Product
import io.vavr.collection.HashMap
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import javax.servlet.http.HttpServletRequest

@RestController
@RequestMapping("/v1/product")
class ProductController : BaseController() {
    @Autowired
    lateinit var productDao: ProductDao

    @Autowired
    lateinit var productService: ProductService

    @ResponseBody
    @GetMapping
    fun index(pageable: Pageable, request: HttpServletRequest): ResponseEntity<Page<Product>> {
        // val queryParams = HashMap.ofAll(request.parameterMap)
        //val page = productService.findBySecurity(request.method, request.requestURI, queryParams, pageable)
        val productList = productDao.findAll(pageable)
        return ResponseEntity.ok(productList)
    }

    @GetMapping("{id}")
    fun get(@PathVariable id: Long?): ResponseEntity<*> {
        val product = productDao.findOne(id)
        return ResponseEntity.ok(product)
    }

    @PostMapping
    fun create(@RequestBody product: Product):ResponseEntity<Product> {
        productDao.save(product)
        return ResponseEntity.ok(product)
    }
}