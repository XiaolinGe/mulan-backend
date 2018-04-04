package com.cfgglobal.fee;

import io.kotlintest.properties.forAll
import io.kotlintest.specs.StringSpec

class PropertyExample: StringSpec() {
  init {
    "String size" {
      forAll { a: String, b: String ->
        (a + b).length == a.length + b.length
      }
    }
  }
}