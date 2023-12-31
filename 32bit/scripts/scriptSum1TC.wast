(input $runtime "runtime.wat")
(register "runtime" $runtime)
(input $Wasm.EuclideanRing "Wasm.EuclideanRing.wat")
(register "Wasm.EuclideanRing" $Wasm.EuclideanRing)
(input $Wasm.Ord "Wasm.Ord.wat")
(register "Wasm.Ord" $Wasm.Ord)
(input $main "main.wat")
(register "main" $main)
(input $test "../test/testSum1TC.wat")
(invoke "Test.testSum1TC" (f32.const 0))
(invoke "Test.testSum1TC" (f32.const 25))
(invoke "Test.testSum1TC" (f32.const 50))
(invoke "Test.testSum1TC" (f32.const 75))
(invoke "Test.testSum1TC" (f32.const 100))
(invoke "Test.testSum1TC" (f32.const 125))
(invoke "Test.testSum1TC" (f32.const 20_000))
(invoke "Test.testSum1TC" (f32.const 30_000))
(invoke "Test.testSum1TC" (f32.const 30_000_000))
(invoke "Test.testSum1TC" (f32.const 1_000_000_000))