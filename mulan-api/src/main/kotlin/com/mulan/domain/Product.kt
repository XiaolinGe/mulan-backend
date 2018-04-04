package com.mulan.domain

import com.cfgglobal.test.domain.BaseEntity
import javax.persistence.*

@Entity
class Product: BaseEntity() {

    var name: String? = null
    var quantity: String? = null
    var cost: Double? = null
    var price: Double? = null
    var specialPrice: Double? = null

    var color: String? = null
    var description: String? = null
    var author: String? = null
    val imgUrls: String? = null


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name="product_category",
            joinColumns= arrayOf( JoinColumn(name="product_id")),
            inverseJoinColumns=arrayOf(JoinColumn(name="category_id")))
    lateinit var categories: List<Category>


}
