(input $runtime "runtime.wat")
(register "runtime" $runtime)
(input $Wasm.EuclideanRing "Wasm.EuclideanRing.wat")
(register "Wasm.EuclideanRing" $Wasm.EuclideanRing)
(input $Wasm.Ord "Wasm.Ord.wat")
(register "Wasm.Ord" $Wasm.Ord)
(input $main "main.wat")
(register "main" $main)
(input $test "../test/testSum5.wat")
(invoke "Test.testSum5" (f32.const 125) (f32.const 0))