(input $runtime "runtime.wat")
(register "runtime" $runtime)
(input $Wasm.EuclideanRing "Wasm.EuclideanRing.wat")
(register "Wasm.EuclideanRing" $Wasm.EuclideanRing)
(input $Wasm.Ord "Wasm.Ord.wat")
(register "Wasm.Ord" $Wasm.Ord)
(input $main "main.wat")
(register "main" $main)
(input $test "../test/testSum5TC.wat")
(invoke "Test.testSum5TC" (f64.const 125) (f64.const 0))