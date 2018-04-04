package com.mulan.fee.util

import com.cfgglobal.test.domain.BaseEntity
import io.vavr.control.Option
import org.apache.commons.lang3.StringUtils

fun handleStatus(ids: String, longConsumer: (Long) -> BaseEntity) {
    Option.of(ids).map { StringUtils.split(it, ",") }
            .map { it.toList() }
            .getOrElse(emptyList())
            .map({ java.lang.Long.parseLong(it) })
            .forEach { longConsumer.invoke(it) }
}