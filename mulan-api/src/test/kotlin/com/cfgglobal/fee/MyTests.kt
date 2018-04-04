package com.cfgglobal.fee;

import io.kotlintest.matchers.shouldBe
import io.kotlintest.specs.StringSpec

class MyTests : StringSpec() {
  init {
    "length should return size of string" {
      "hello".length shouldBe 5
    }
  }
}
