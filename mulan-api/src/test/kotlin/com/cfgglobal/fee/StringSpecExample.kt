package com.cfgglobal.fee;

import io.kotlintest.matchers.shouldBe
import io.kotlintest.properties.forAll
import io.kotlintest.properties.headers
import io.kotlintest.properties.row
import io.kotlintest.properties.table
import io.kotlintest.specs.StringSpec

class StringSpecExample : StringSpec() {
  init {
    "should add" {
       val myTable = table(
         headers("a", "b", "result"),
         row(1, 2, 3),
         row(1, 1, 2)
       )
       forAll(myTable) { a, b, result ->
         a + b shouldBe result
       }
    }

  }
}