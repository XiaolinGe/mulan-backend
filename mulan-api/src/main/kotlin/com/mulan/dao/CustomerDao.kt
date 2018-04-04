package com.mulan.dao

import com.cfgglobal.test.dao.base.BaseDao
import com.mulan.domain.Customer
import org.springframework.stereotype.Repository

@Repository
interface CustomerDao : BaseDao<Customer, Long>