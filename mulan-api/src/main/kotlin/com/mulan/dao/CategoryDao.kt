package com.mulan.dao

import com.cfgglobal.test.dao.base.BaseDao
import com.mulan.domain.Category
import org.springframework.stereotype.Repository

@Repository
interface CategoryDao : BaseDao<Category, Long>