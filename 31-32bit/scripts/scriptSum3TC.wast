(input $runtime "runtime.wat")
(register "runtime" $runtime)
(input $Wasm.EuclideanRing2 "Wasm.EuclideanRing2.wat")
(register "Wasm.EuclideanRing2" $Wasm.EuclideanRing2)
(input $main "main.wat")
(register "main" $main)
(input $test "../test/testSum3TC.wat")
(invoke "Test.testSum3TC" (i32.const 0))
(invoke "Test.testSum3TC" (i32.const 25))
(invoke "Test.testSum3TC" (i32.const 50))
(invoke "Test.testSum3TC" (i32.const 75))
(invoke "Test.testSum3TC" (i32.const 100))
(invoke "Test.testSum3TC" (i32.const 125))