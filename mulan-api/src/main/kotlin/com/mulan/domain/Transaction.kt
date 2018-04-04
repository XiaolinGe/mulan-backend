package com.mulan.domain
import com.mulan.fee.enums.TransactionStatusType
import com.cfgglobal.test.domain.BaseEntity
import org.hibernate.annotations.DynamicInsert
import org.hibernate.annotations.DynamicUpdate
import javax.persistence.*

@Entity
@DynamicUpdate
@DynamicInsert
@Table(uniqueConstraints = arrayOf(UniqueConstraint(name = "unique_order_id", columnNames = arrayOf("orderId"))))
class Transaction : BaseEntity() {

    var orderId: String? = null

    var payCurrency: String? = null

    var payAmount: Double? = null

    var receiveCurrency: String? = null

    var receiveAmount: Double? = null

    var email: String? = null

    var name: String? = null

    var reference: String? = null

    var paymentMethod: String? = null

    @ManyToOne
    @JoinColumn(name = "customer_id")
    lateinit var customer: Customer

    @ManyToOne
    @JoinColumn(name = "product_id")
    var product: Product? = null


    @Enumerated(value = EnumType.STRING)
    var status: TransactionStatusType? = null

    var point: Double? = null


}
