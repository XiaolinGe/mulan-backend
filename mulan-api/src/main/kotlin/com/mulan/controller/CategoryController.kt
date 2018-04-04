package com.mulan.controller

import com.cfgglobal.test.web.base.BaseController
import com.mulan.dao.CategoryDao
import com.mulan.domain.Category
import com.mulan.service.CategoryService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import javax.servlet.http.HttpServletRequest

@RestController
@RequestMapping("/v1/category")
class CategoryController : BaseController() {
    @Autowired
    lateinit var categoryDao: CategoryDao
    @Autowired
    lateinit var categoryService: CategoryService


    @ResponseBody
    @GetMapping
    fun index(pageable: Pageable, request: HttpServletRequest): ResponseEntity<Page<Category>> {
        // val queryParams = HashMap.ofAll(request.parameterMap)
        //val page = categoryService.findBySecurity(request.method, request.requestURI, queryParams, pageable)
        val categoryList = categoryDao.findAll(pageable)
        return ResponseEntity.ok(categoryList)
    }

    @GetMapping("{id}")
    fun get(@PathVariable id: Long?): ResponseEntity<*> {
        val category = categoryDao.findOne(id)
        return ResponseEntity.ok(category)
    }

    @PostMapping
    fun create(@RequestBody category: Category):ResponseEntity<Category> {
        categoryDao.save(category)
        return ResponseEntity.ok(category)
    }
}