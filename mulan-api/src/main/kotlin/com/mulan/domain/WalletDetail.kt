package com.mulan.domain
import com.cfgglobal.test.domain.BaseEntity
import java.util.*
import javax.persistence.*


@Entity
class WalletDetail : BaseEntity() {

    var amount: Double = 0.0
    var orderNo: String? = null

    @ManyToOne
    @JoinColumn(name = "wallet_id")
    lateinit var wallet: Wallet

    @ManyToOne
    @JoinColumn(name = "customer_id")
    lateinit var customer: Customer


}
