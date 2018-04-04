package com.mulan.domain

import com.cfgglobal.test.domain.User
import javax.persistence.*

@Entity
class Customer: User() {
    var phone: String? = null
    var address: String? = null

    @OneToMany(mappedBy = "customer")
    lateinit var transactions: List<Transaction>

    @OneToMany(mappedBy = "customer")
    lateinit var point: List<Point>
}
