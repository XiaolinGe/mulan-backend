package com.mulan.domain

import com.cfgglobal.test.domain.BaseEntity
import javax.persistence.CascadeType
import javax.persistence.Entity
import javax.persistence.OneToMany


@Entity
class Module: BaseEntity() {
    var name: String? = null

    @OneToMany(mappedBy = "module", cascade = arrayOf(CascadeType.PERSIST, CascadeType.MERGE), orphanRemoval = true)
    lateinit var categories: List<Category>
}