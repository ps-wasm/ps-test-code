(input $runtime "runtime.wat")
(register "runtime" $runtime)
(input $Wasm.EuclideanRing "Wasm.EuclideanRing.wat")
(register "Wasm.EuclideanRing" $Wasm.EuclideanRing)
(input $Wasm.Ord "Wasm.Ord.wat")
(register "Wasm.Ord" $Wasm.Ord)
(input $main "main.wat")
(register "main" $main)
(input $test "../test/testSum2.wat")
(invoke "Test.testSum2" (f64.const 0) (f64.const 0))
(invoke "Test.testSum2" (f64.const 0) (f64.const 25))
(invoke "Test.testSum2" (f64.const 0) (f64.const 50))
(invoke "Test.testSum2" (f64.const 0) (f64.const 75))
(invoke "Test.testSum2" (f64.const 0) (f64.const 100))
(invoke "Test.testSum2" (f64.const 0) (f64.const 125))