package com.mulan.domain
import com.cfgglobal.test.domain.BaseEntity
import javax.persistence.*


@Entity
class Wallet : BaseEntity() {

    var point: Double = 0.0

    @ManyToOne
    @JoinColumn(name = "customer_id")
    lateinit var customer: Customer

    @OneToMany(mappedBy = "wallet", cascade = arrayOf(CascadeType.PERSIST, CascadeType.MERGE), orphanRemoval = true)
    lateinit var walletDetails: List<WalletDetail>

}
