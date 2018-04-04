package com.mulan.service

import com.cfgglobal.test.service.base.BaseService
import com.mulan.domain.Category
import org.springframework.stereotype.Service

@Service
class CategoryService : BaseService<Category, Long>()