package com.mulan.dao

import com.cfgglobal.test.dao.base.BaseDao
import com.mulan.domain.Product
import org.springframework.stereotype.Repository

@Repository
interface ProductDao: BaseDao<Product, Long>