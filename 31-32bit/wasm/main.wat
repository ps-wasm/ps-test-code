(module
    (type $runtime.closure_arg_array (array (mut (ref null eq))))
    (type $runtime.closure_top (struct (field (ref func))(field (ref $runtime.closure_arg_array))))
    (type $runtime.classDict (array (mut (ref null eq))))
    (type $runtime.boxedi32 (struct (field i32)))
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
    (import "Wasm.EuclideanRing" "intDegree" (func $Wasm.EuclideanRing.intDegree (type $runtime.func-param-clos)))
    (import "Wasm.EuclideanRing" "intDiv" (func $Wasm.EuclideanRing.intDiv (type $runtime.func-param-clos)))
    (import "Wasm.EuclideanRing" "intMod" (func $Wasm.EuclideanRing.intMod (type $runtime.func-param-clos)))
    (import "Wasm.EuclideanRing" "numDiv" (func $Wasm.EuclideanRing.numDiv (type $runtime.func-param-clos)))
    (import "Wasm.EuclideanRing" "intAdd" (func $Wasm.EuclideanRing.intAdd (type $runtime.func-param-clos)))
    (import "Wasm.EuclideanRing" "intMul" (func $Wasm.EuclideanRing.intMul (type $runtime.func-param-clos)))
    (import "Wasm.EuclideanRing" "numAdd" (func $Wasm.EuclideanRing.numAdd (type $runtime.func-param-clos)))
    (import "Wasm.EuclideanRing" "numMul" (func $Wasm.EuclideanRing.numMul (type $runtime.func-param-clos)))
    (import "Wasm.EuclideanRing" "intSub" (func $Wasm.EuclideanRing.intSub (type $runtime.func-param-clos)))
    (import "Wasm.EuclideanRing" "numSub" (func $Wasm.EuclideanRing.numSub (type $runtime.func-param-clos)))
    (import "Wasm.Ord" "ltIntImpl" (func $Wasm.Ord.ltIntImpl (type $runtime.func-param-clos)))
    (import "Wasm.Ord" "gtIntImpl" (func $Wasm.Ord.gtIntImpl (type $runtime.func-param-clos)))
    (import "Wasm.Ord" "eqIntImpl" (func $Wasm.Ord.eqIntImpl (type $runtime.func-param-clos)))
    (import "Wasm.Ord" "ltNumbImpl" (func $Wasm.Ord.ltNumbImpl (type $runtime.func-param-clos)))
    (import "Wasm.Ord" "gtNumbImpl" (func $Wasm.Ord.gtNumbImpl (type $runtime.func-param-clos)))
    (import "Wasm.Ord" "eqNumbImpl" (func $Wasm.Ord.eqNumbImpl (type $runtime.func-param-clos)))
    (import "Wasm.Ord" "ltBoolImpl" (func $Wasm.Ord.ltBoolImpl (type $runtime.func-param-clos)))
    (import "Wasm.Ord" "gtBoolImpl" (func $Wasm.Ord.gtBoolImpl (type $runtime.func-param-clos)))
    (import "Wasm.Ord" "eqBoolImpl" (func $Wasm.Ord.eqBoolImpl (type $runtime.func-param-clos)))
    
    (func $Wasm.EuclideanRing.euclideanRingNumber (export "Wasm.EuclideanRing.euclideanRingNumber") (result (ref eq))
      ref.func $Wasm.EuclideanRing.numAdd
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      i32.const 1
      i31.new
      ref.func $Wasm.EuclideanRing.numDiv
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      f32.const 0.0
      struct.new $runtime.boxedf32
      ref.func $Wasm.EuclideanRing.numMul
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      f32.const 1.0
      struct.new $runtime.boxedf32
      ref.func $Wasm.EuclideanRing.numSub
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      f32.const 0.0
      struct.new $runtime.boxedf32
      array.new_fixed $runtime.classDict 8
    )
    (func $Wasm.EuclideanRing.euclideanRingInt (export "Wasm.EuclideanRing.euclideanRingInt") (result (ref eq))
      ref.func $Wasm.EuclideanRing.intAdd
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.EuclideanRing.intDegree
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.EuclideanRing.intDiv
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.EuclideanRing.intMod
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.EuclideanRing.intMul
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      i32.const 1
      i31.new
      ref.func $Wasm.EuclideanRing.intSub
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      i32.const 0
      i31.new
      array.new_fixed $runtime.classDict 8
    )
    (func $Wasm.Ord.ordNumb (export "Wasm.Ord.ordNumb") (result (ref eq))
      ref.func $Wasm.Ord.eqNumbImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.Ord.gtNumbImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.Ord.ltNumbImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      array.new_fixed $runtime.classDict 3
    )
    (func $Wasm.Ord.ordInt (export "Wasm.Ord.ordInt") (result (ref eq))
      ref.func $Wasm.Ord.eqIntImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.Ord.gtIntImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.Ord.ltIntImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      array.new_fixed $runtime.classDict 3
    )
    (func $Wasm.Ord.ordBoolean (export "Wasm.Ord.ordBoolean") (result (ref eq))
      ref.func $Wasm.Ord.eqBoolImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.Ord.gtBoolImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      ref.func $Wasm.Ord.ltBoolImpl
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      array.new_fixed $runtime.classDict 3
    )
    
    (elem declare func $Main.sum5-aux-1)
    (elem declare func $Wasm.EuclideanRing.negate-aux-1)
    (elem declare func $Wasm.Ord.notEq-aux-1)
    (elem declare func $Wasm.Ord.notEq-aux-2)
    (elem declare func $Main.sum5)
    (elem declare func $Wasm.EuclideanRing.negate)
    (elem declare func $Wasm.EuclideanRing.add)
    (elem declare func $Wasm.EuclideanRing.degree)
    (elem declare func $Wasm.EuclideanRing.div)
    (elem declare func $Wasm.EuclideanRing.mod)
    (elem declare func $Wasm.EuclideanRing.mul)
    (elem declare func $Wasm.EuclideanRing.one)
    (elem declare func $Wasm.EuclideanRing.sub)
    (elem declare func $Wasm.EuclideanRing.zero)
    (elem declare func $Wasm.Ord.notEq)
    (elem declare func $Wasm.Ord.eq)
    (elem declare func $Wasm.Ord.greaterThan)
    (elem declare func $Wasm.Ord.lessThan)
    (elem declare func $Wasm.EuclideanRing.sub1)
    (elem declare func $Wasm.EuclideanRing.zero1)
    (elem declare func $Wasm.Ord.eq2)
    (elem declare func $Main.eq)
    (elem declare func $Main.sub)
    (elem declare func $Main.add)
    (elem declare func $Wasm.Ord.eq1)
    
    (elem declare func $runtime.apply)
    (elem declare func $runtime.addToArgArray)
    (elem declare func $runtime.getSingleClosureArg)
    (elem declare func $runtime.newClosure)
    (elem declare func $Wasm.EuclideanRing.intDegree)
    (elem declare func $Wasm.EuclideanRing.intDiv)
    (elem declare func $Wasm.EuclideanRing.intMod)
    (elem declare func $Wasm.EuclideanRing.numDiv)
    (elem declare func $Wasm.EuclideanRing.intAdd)
    (elem declare func $Wasm.EuclideanRing.intMul)
    (elem declare func $Wasm.EuclideanRing.numAdd)
    (elem declare func $Wasm.EuclideanRing.numMul)
    (elem declare func $Wasm.EuclideanRing.intSub)
    (elem declare func $Wasm.EuclideanRing.numSub)
    (elem declare func $Wasm.Ord.ltIntImpl)
    (elem declare func $Wasm.Ord.gtIntImpl)
    (elem declare func $Wasm.Ord.eqIntImpl)
    (elem declare func $Wasm.Ord.ltNumbImpl)
    (elem declare func $Wasm.Ord.gtNumbImpl)
    (elem declare func $Wasm.Ord.eqNumbImpl)
    (elem declare func $Wasm.Ord.ltBoolImpl)
    (elem declare func $Wasm.Ord.gtBoolImpl)
    (elem declare func $Wasm.Ord.eqBoolImpl)
    
    (func $Main.sum5-aux-1 (type $runtime.func-param-clos)
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $Main.eq
      ref.cast (ref $runtime.closure_top)
      local.get 0
      i32.const 0
      call $runtime.getSingleClosureArg
      call $runtime.apply
      ref.cast (ref $runtime.closure_top)
      i32.const 0
      i31.new
      call $runtime.apply
      ref.cast (ref i31)
      i31.get_s
      (if (result (ref null eq))
        (then
          local.get 1
        )
        (else
          ref.func $Main.sum5
          local.get 0
          local.get 1
          call $runtime.addToArgArray
          call $runtime.newClosure
          ref.cast (ref $runtime.closure_top)
          local.get 0
          local.get 1
          call $runtime.addToArgArray
          call $Main.sub
          ref.cast (ref $runtime.closure_top)
          local.get 0
          i32.const 0
          call $runtime.getSingleClosureArg
          call $runtime.apply
          ref.cast (ref $runtime.closure_top)
          i32.const 1
          i31.new
          call $runtime.apply
          call $runtime.apply
          ref.cast (ref $runtime.closure_top)
          local.get 0
          local.get 1
          call $runtime.addToArgArray
          call $Main.add
          ref.cast (ref $runtime.closure_top)
          local.get 1
          call $runtime.apply
          ref.cast (ref $runtime.closure_top)
          local.get 0
          i32.const 0
          call $runtime.getSingleClosureArg
          call $runtime.apply
          call $runtime.apply
        )
      )
    )
    
    (func $Wasm.EuclideanRing.negate-aux-1 (type $runtime.func-param-clos)
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $Wasm.EuclideanRing.sub1
      ref.cast (ref $runtime.closure_top)
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $Wasm.EuclideanRing.zero1
      call $runtime.apply
      ref.cast (ref $runtime.closure_top)
      local.get 1
      call $runtime.apply  
    )
    
    (func $Wasm.Ord.notEq-aux-1 (type $runtime.func-param-clos)
      ref.func $Wasm.Ord.notEq-aux-2
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $runtime.newClosure  
    )
    
    (func $Wasm.Ord.notEq-aux-2 (type $runtime.func-param-clos)
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $Wasm.Ord.eq1
      ref.cast (ref $runtime.closure_top)
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $Wasm.Ord.eq2
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
    
    (func $Main.sum5 (export "Main.sum5") (type $runtime.func-param-clos)
      ref.func $Main.sum5-aux-1
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $runtime.newClosure  
    )
    
    (func $Wasm.EuclideanRing.negate (type $runtime.func-param-clos)
      ref.func $Wasm.EuclideanRing.negate-aux-1
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $runtime.newClosure  
    )
    
    (func $Wasm.EuclideanRing.add (export "Wasm.EuclideanRing.add") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 0
      array.get $runtime.classDict  
    )
    
    (func $Wasm.EuclideanRing.degree (export "Wasm.EuclideanRing.degree") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 1
      array.get $runtime.classDict  
    )
    
    (func $Wasm.EuclideanRing.div (export "Wasm.EuclideanRing.div") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 2
      array.get $runtime.classDict  
    )
    
    (func $Wasm.EuclideanRing.mod (export "Wasm.EuclideanRing.mod") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 3
      array.get $runtime.classDict  
    )
    
    (func $Wasm.EuclideanRing.mul (export "Wasm.EuclideanRing.mul") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 4
      array.get $runtime.classDict  
    )
    
    (func $Wasm.EuclideanRing.one (export "Wasm.EuclideanRing.one") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 5
      array.get $runtime.classDict  
    )
    
    (func $Wasm.EuclideanRing.sub (export "Wasm.EuclideanRing.sub") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 6
      array.get $runtime.classDict  
    )
    
    (func $Wasm.EuclideanRing.zero (export "Wasm.EuclideanRing.zero") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 7
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Ord.notEq (export "Wasm.Ord.notEq") (type $runtime.func-param-clos)
      ref.func $Wasm.Ord.notEq-aux-1
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      call $runtime.newClosure  
    )
    
    (func $Wasm.Ord.eq (export "Wasm.Ord.eq") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 0
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Ord.greaterThan (export "Wasm.Ord.greaterThan") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 1
      array.get $runtime.classDict  
    )
    
    (func $Wasm.Ord.lessThan (export "Wasm.Ord.lessThan") (type $runtime.func-param-clos)
      local.get 1
      ref.cast (ref $runtime.classDict)
      i32.const 2
      array.get $runtime.classDict  
    )
    
    (func $Wasm.EuclideanRing.sub1 (type $runtime.func-clos)
      ref.func $Wasm.EuclideanRing.sub
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      local.get 0
      i32.const 0
      call $runtime.getSingleClosureArg
      call $runtime.apply  
    )
    
    (func $Wasm.EuclideanRing.zero1 (type $runtime.func-clos)
      ref.func $Wasm.EuclideanRing.zero
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      local.get 0
      i32.const 0
      call $runtime.getSingleClosureArg
      call $runtime.apply  
    )
    
    (func $Wasm.Ord.eq2 (type $runtime.func-clos)
      ref.func $Wasm.Ord.eq
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      local.get 0
      i32.const 0
      call $runtime.getSingleClosureArg
      call $runtime.apply  
    )
    
    (func $Main.eq (type $runtime.func-clos)
      ref.func $Wasm.Ord.eq
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      call $Wasm.Ord.ordInt
      call $runtime.apply  
    )
    
    (func $Main.sub (type $runtime.func-clos)
      ref.func $Wasm.EuclideanRing.sub
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      call $Wasm.EuclideanRing.euclideanRingInt
      call $runtime.apply  
    )
    
    (func $Main.add (type $runtime.func-clos)
      ref.func $Wasm.EuclideanRing.add
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      call $Wasm.EuclideanRing.euclideanRingInt
      call $runtime.apply  
    )
    
    (func $Wasm.Ord.eq1 (type $runtime.func-clos)
      ref.func $Wasm.Ord.eq
      local.get 0
      call $runtime.newClosure
      ref.cast (ref $runtime.closure_top)
      call $Wasm.Ord.ordBoolean
      call $runtime.apply  
    )
  )