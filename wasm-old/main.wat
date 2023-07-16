(module
    (type $runtime.closure_arg_array (array (mut (ref null eq))))
    (type $runtime.closure_top (struct (field (ref func))(field (ref $runtime.closure_arg_array))))
    (type $runtime.classDict (array (mut (ref null eq))))
    (type $runtime.boxedi64 (struct (field i64)))
    (type $runtime.boxedf32 (struct (field f32)))
    (type $runtime.boxedf64 (struct (field f64)))
    
    (type $runtime.apply (func (param (ref $runtime.closure_top))(param (ref null eq))(result (ref null eq))))
    (type $runtime.addToArgArray (func (param (ref $runtime.closure_arg_array))(param (ref null eq))(result (ref $runtime.closure_arg_array))))
    (type $runtime.newClosure (func (param (ref func))(param (ref $runtime.closure_arg_array))(result (ref $runtime.closure_top))))
    (type $runtime.getSingleClosureArg (func (param (ref $runtime.closure_arg_array))(param i32)(result (ref null eq))))
    (type $runtime.func-param-clos (func (param (ref $runtime.closure_arg_array))(param (ref null eq))(result (ref null eq))))
    (type $runtime.func-clos (func (param (ref $runtime.closure_arg_array))(result (ref null eq))))
    
    (import "runtime" "apply" (func $runtime.apply (type $runtime.apply)))
    (import "runtime" "addToArgArray" (func $runtime.addToArgArray (type $runtime.addToArgArray)))
    (import "runtime" "getSingleClosureArg" (func $runtime.getSingleClosureArg (type $runtime.getSingleClosureArg)))
    (import "runtime" "newClosure" (func $runtime.newClosure (type $runtime.newClosure)))
    (import "Wasm.Eq" "eqBooleanImpl" (func $Wasm.Eq.eqBooleanImpl (type $runtime.func-param-clos)))
    (import "Wasm.Eq" "eqIntImpl" (func $Wasm.Eq.eqIntImpl (type $runtime.func-param-clos)))
    (import "Wasm.Eq" "eqNumberImpl" (func $Wasm.Eq.eqNumberImpl (type $runtime.func-param-clos)))
    (import "Wasm.Semiring" "intAdd" (func $Wasm.Semiring.intAdd (type $runtime.func-param-clos)))
    (import "Wasm.Semiring" "intMul" (func $Wasm.Semiring.intMul (type $runtime.func-param-clos)))
    (import "Wasm.Semiring" "numAdd" (func $Wasm.Semiring.numAdd (type $runtime.func-param-clos)))
    (import "Wasm.Semiring" "numMul" (func $Wasm.Semiring.numMul (type $runtime.func-param-clos)))
    
    (func $Wasm.Eq.eqNumber (export "Wasm.Eq.eqNumber") (result (ref eq))
      ref.func $Wasm.Eq.eqNumberImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      array.new_fixed $runtime.classDict 1
    )
    (func $Wasm.Eq.eqInt (export "Wasm.Eq.eqInt") (result (ref eq))
      ref.func $Wasm.Eq.eqIntImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      array.new_fixed $runtime.classDict 1
    )
    (func $Wasm.Eq.eqBoolean (export "Wasm.Eq.eqBoolean") (result (ref eq))
      ref.func $Wasm.Eq.eqBooleanImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      array.new_fixed $runtime.classDict 1
    )
    (func $Wasm.Semiring.semiringNumber (export "Wasm.Semiring.semiringNumber") (result (ref eq))
      ref.func $Wasm.Semiring.numAdd
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.Semiring.numMul
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      f64.const 1.0
      struct.new $runtime.boxedf64
      f64.const 0.0
      struct.new $runtime.boxedf64
      array.new_fixed $runtime.classDict 4
    )
    (func $Wasm.Semiring.semiringInt (export "Wasm.Semiring.semiringInt") (result (ref eq))
      ref.func $Wasm.Semiring.intAdd
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.Semiring.intMul
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      i64.const 1
      struct.new $runtime.boxedi64
      i64.const 0
      struct.new $runtime.boxedi64
      array.new_fixed $runtime.classDict 4
    )
    
    (elem declare func $Wasm.Eq.notEq-aux-1)
    (elem declare func $Wasm.Eq.notEq-aux-2)
    (elem declare func $Main.plusIets)
    (elem declare func $Wasm.Eq.notEq)
    (elem declare func $Wasm.Eq.eq)
    (elem declare func $Wasm.Semiring.add)
    (elem declare func $Wasm.Semiring.mul)
    (elem declare func $Wasm.Semiring.one)
    (elem declare func $Wasm.Semiring.zero)
    (elem declare func $Wasm.Eq.eq2)
    (elem declare func $Main.eq)
    (elem declare func $Main.add)
    (elem declare func $Wasm.Eq.eq1)
    
    (elem declare func $runtime.apply)
    (elem declare func $runtime.addToArgArray)
    (elem declare func $runtime.getSingleClosureArg)
    (elem declare func $runtime.newClosure)
    (elem declare func $Wasm.Eq.eqBooleanImpl)
    (elem declare func $Wasm.Eq.eqIntImpl)
    (elem declare func $Wasm.Eq.eqNumberImpl)
    (elem declare func $Wasm.Semiring.intAdd)
    (elem declare func $Wasm.Semiring.intMul)
    (elem declare func $Wasm.Semiring.numAdd)
    (elem declare func $Wasm.Semiring.numMul)
    
    (func $Wasm.Eq.notEq-aux-1 (type $runtime.func-param-clos)
      ref.func $Wasm.Eq.notEq-aux-2
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $runtime.newClosure  
    )
    
    (func $Wasm.Eq.notEq-aux-2 (type $runtime.func-param-clos)
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $Wasm.Eq.eq1
      ref.cast (ref $runtime.closure_top)
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $Wasm.Eq.eq2
      ref.cast (ref $runtime.closure_top)
      local.get 0
      i32.const 1
      call $runtime.getSingleClosureArg
      call $runtime.apply
      ref.cast (ref $runtime.closure_top)
      local.get 1
      call $runtime.apply
      call $runtime.apply
      ref.cast (ref $runtime.closure_top)
      i32.const 0
      i31.new
      call $runtime.apply  
    )
    
    (func $Main.plusIets (export "Main.plusIets") (type $runtime.func-param-clos)
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $Main.eq
      ref.cast (ref $runtime.closure_top)
      local.get 1
      call $runtime.apply
      ref.cast (ref $runtime.closure_top)
      i64.const 0
      struct.new $runtime.boxedi64
      call $runtime.apply
      ref.cast (ref i31)
      i31.get_s
      (if (result (ref null eq))
        (then
          i64.const 0
          struct.new $runtime.boxedi64
        )
        (else
          local.get 0
          local.get 1
          call $runtime.addToArgArray
          call $Main.add
          ref.cast (ref $runtime.closure_top)
          local.get 1
          call $runtime.apply
          ref.cast (ref $runtime.closure_top)
          i64.const 2
          struct.new $runtime.boxedi64
          call $runtime.apply
        )
      )
    )
    
    (func $Wasm.Eq.notEq (export "Wasm.Eq.notEq") (type $runtime.func-param-clos)
      ref.func $Wasm.Eq.notEq-aux-1
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $runtime.newClosure  
    )
    
    (func $Wasm.Eq.eq (export "Wasm.Eq.eq") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 0
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Semiring.add (export "Wasm.Semiring.add") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 0
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Semiring.mul (export "Wasm.Semiring.mul") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 1
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Semiring.one (export "Wasm.Semiring.one") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 2
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Semiring.zero (export "Wasm.Semiring.zero") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 3
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Eq.eq2 (type $runtime.func-clos)
      ref.func $Wasm.Eq.eq
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      local.get 0
      i32.const 0
      call $runtime.getSingleClosureArg
      call $runtime.apply  
    )
    
    (func $Main.eq (type $runtime.func-clos)
      ref.func $Wasm.Eq.eq
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      call $Wasm.Eq.eqInt
      call $runtime.apply  
    )
    
    (func $Main.add (type $runtime.func-clos)
      ref.func $Wasm.Semiring.add
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      call $Wasm.Semiring.semiringInt
      call $runtime.apply  
    )
    
    (func $Wasm.Eq.eq1 (type $runtime.func-clos)
      ref.func $Wasm.Eq.eq
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      call $Wasm.Eq.eqBoolean
      call $runtime.apply  
    )
  )