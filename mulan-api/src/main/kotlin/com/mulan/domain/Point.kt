package com.mulan.domain
import com.cfgglobal.test.domain.BaseEntity
import javax.persistence.*

@Entity
class Point : BaseEntity() {

    var amount: Double = 0.0

    @ManyToOne
    @JoinColumn(name = "customer_id")
    lateinit var customer: Customer


}