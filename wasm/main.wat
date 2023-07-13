(module
  (type $runtime.closure_arg_array (array (ref eq)))
  (type $runtime.closure_top (struct (field (ref func))(field (ref $runtime.closure_arg_array))))
  (type $runtime.classDict (array (mut (ref eq))))
  (type $runtime.boxedi64 (struct (field i64)))
  (type $runtime.boxedf32 (struct (field f32)))
  (type $runtime.boxedf64 (struct (field f64)))
  
  
  (type $runtime.apply (func (param (ref $runtime.closure_top)) (param (ref eq)) (result (ref eq))))
  (type $runtime.addToArgArray (func (param (ref $runtime.closure_arg_array))(param (ref eq))(result (ref $runtime.closure_arg_array))))
  (type $runtime.newClosure (func (param (ref func))(param (ref $runtime.closure_arg_array))(result (ref $runtime.closure_top))))
  (type $runtime.getSingleClosureArg (func (param (ref $runtime.closure_arg_array))(param i32)(result (ref eq))))
  (type $func-param-clos (func (param (ref $runtime.closure_arg_array))(param (ref eq))(result (ref eq))))
  (type $func-clos (func (param (ref $runtime.closure_arg_array))(result (ref eq))))
    
    (import "runtime" "apply" (func $runtime.apply (type $runtime.apply)))
    (import "runtime" "addToArgArray" (func $runtime.addToArgArray (type $runtime.addToArgArray)))
    (import "runtime" "getSingleClosureArg" (func $runtime.getSingleClosureArg (type $runtime.getSingleClosureArg)))
    (import "runtime" "newClosure" (func $runtime.newClosure (type $runtime.newClosure)))
    (import "Wasm.Semiring" "intAdd" (func $Wasm.Semiring.intAdd (type $func-param-clos)))
    (import "Wasm.Semiring" "intMul" (func $Wasm.Semiring.intMul (type $func-param-clos)))
    (import "Wasm.Semiring" "numAdd" (func $Wasm.Semiring.numAdd (type $func-param-clos)))
    (import "Wasm.Semiring" "numMul" (func $Wasm.Semiring.numMul (type $func-param-clos)))

    
    
    (func $Wasm.Semiring.Semiring.semiringNumber (result (ref eq))
      array.new_fixed $runtime.closure_arg_array 0
      call $Wasm.Semiring.semiringNumber.add
      array.new_fixed $runtime.closure_arg_array 0
      call $Wasm.Semiring.semiringNumber.mul
      call $Wasm.Semiring.semiringNumber.one
      call $Wasm.Semiring.semiringNumber.zero
      array.new_fixed $runtime.classDict 4
    )
    (func $Wasm.Semiring.semiringNumber.one (result (ref eq))
      f64.const 1.0
      struct.new $runtime.boxedf64
    )
    (func $Wasm.Semiring.semiringNumber.zero (result (ref eq))
      f64.const 0.0
      struct.new $runtime.boxedf64
    )
    (func $Wasm.Semiring.Semiring.semiringInt (result (ref eq))
      array.new_fixed $runtime.closure_arg_array 0
      call $Wasm.Semiring.semiringInt.add
      array.new_fixed $runtime.closure_arg_array 0
      call $Wasm.Semiring.semiringInt.mul
      call $Wasm.Semiring.semiringInt.one
      call $Wasm.Semiring.semiringInt.zero
      array.new_fixed $runtime.classDict 4
    )
    (func $Wasm.Semiring.semiringInt.one (result (ref eq))
      i64.const 1
      struct.new $runtime.boxedi64
    )
    (func $Wasm.Semiring.semiringInt.zero (result (ref eq))
      i64.const 0
      struct.new $runtime.boxedi64
    )
    
    (elem declare func $Main.som-aux-1)
    (elem declare func $Main.som-aux-2)
    (elem declare func $Main.som)
    (elem declare func $Wasm.Semiring.add)
    (elem declare func $Wasm.Semiring.mul)
    (elem declare func $Wasm.Semiring.one)
    (elem declare func $Wasm.Semiring.zero)
    (elem declare func $Main.add)
    (elem declare func $Wasm.Semiring.semiringNumber.add)
    (elem declare func $Wasm.Semiring.semiringNumber.mul)
    (elem declare func $Wasm.Semiring.semiringInt.add)
    (elem declare func $Wasm.Semiring.semiringInt.mul)
    
    (elem declare func $runtime.apply)
    (elem declare func $runtime.addToArgArray)
    (elem declare func $runtime.getSingleClosureArg)
    (elem declare func $runtime.newClosure)
    (elem declare func $Wasm.Semiring.intAdd)
    (elem declare func $Wasm.Semiring.intMul)
    (elem declare func $Wasm.Semiring.numAdd)
    (elem declare func $Wasm.Semiring.numMul)
    
    (func $Main.som-aux-1 (type $func-param-clos)
      ref.func $Main.som-aux-2
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $runtime.newClosure  
    )
    
    (func $Main.som-aux-2 (type $func-param-clos)
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $Main.add
      ref.cast (ref $runtime.closure_top)
      local.get 0
      i32.const 0
      call $runtime.getSingleClosureArg
      call $runtime.apply
      ref.cast (ref $runtime.closure_top)
      local.get 1
      call $runtime.apply  
    )
    
    (func $Main.som (export "Main.som") (type $func-param-clos)
      ref.func $Main.som-aux-1
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $runtime.newClosure  
    )
    
    (func $Wasm.Semiring.add (export "Wasm.Semiring.add") (type $func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 0
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Semiring.mul (export "Wasm.Semiring.mul") (type $func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 1
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Semiring.one (export "Wasm.Semiring.one") (type $func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 2
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Semiring.zero (export "Wasm.Semiring.zero") (type $func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 3
      array.get $runtime.classDict  
    )
    
    (func $Main.add (type $func-clos)
      ref.func $Wasm.Semiring.add
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      local.get 0
      i32.const 0
      call $runtime.getSingleClosureArg
      call $runtime.apply  
    )
    
    (func $Wasm.Semiring.semiringNumber.add (type $func-clos)
      ref.func $Wasm.Semiring.numAdd
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure  
    )
    
    (func $Wasm.Semiring.semiringNumber.mul (type $func-clos)
      ref.func $Wasm.Semiring.numMul
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure  
    )
    
    (func $Wasm.Semiring.semiringInt.add (type $func-clos)
      ref.func $Wasm.Semiring.intAdd
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure  
    )
    
    (func $Wasm.Semiring.semiringInt.mul (type $func-clos)
      ref.func $Wasm.Semiring.intMul
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure  
    )
  )