package com.mulan.domain

import com.cfgglobal.test.domain.BaseEntity
import javax.persistence.*
import javax.persistence.JoinColumn


@Entity
class Category : BaseEntity(){
    var name: String? =null

    @ManyToMany(mappedBy="categories")
    lateinit var products: List<Product>

    @ManyToOne()
    @JoinColumn(name = "module_id")
    lateinit var module: Module

}