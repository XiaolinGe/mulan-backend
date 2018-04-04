package com.cfgglobal.fee;

import io.kotlintest.TestCaseConfig
import io.kotlintest.seconds
import io.kotlintest.specs.StringSpec

class MySpec : StringSpec() {

  override val defaultTestCaseConfig = TestCaseConfig(invocations = 3)

  init {
    "should use config" {

    }.config(timeout = 2.seconds, invocations = 10, threads = 2)
  }
}