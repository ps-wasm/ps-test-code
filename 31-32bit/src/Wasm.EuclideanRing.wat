(module
  (type $runtime.closure_arg_array (array (mut (ref null eq))))
  (type $runtime.closure_top (struct (field (ref func))(field (ref $runtime.closure_arg_array))))
  (type $runtime.classDict (array (mut (ref null eq))))
  (type $runtime.boxedi32 (struct (field i32)))
  (type $runtime.boxedi64 (struct (field i64)))
  (type $runtime.boxedf32 (struct (field f32)))
  (type $runtime.boxedf64 (struct (field f64)))
  
  
  (type $runtime.apply (func (param (ref $runtime.closure_top)) (param (ref null eq)) (result (ref null eq))))
  (type $runtime.addToArgArray (func (param (ref $runtime.closure_arg_array))(param (ref null eq))(result (ref $runtime.closure_arg_array))))
  (type $runtime.newClosure (func (param (ref func))(param (ref $runtime.closure_arg_array))(result (ref $runtime.closure_top))))
  (type $runtime.getSingleClosureArg (func (param (ref $runtime.closure_arg_array))(param i32)(result (ref null eq))))
  (type $runtime.func-param-clos (func (param (ref $runtime.closure_arg_array))(param (ref null eq))(result (ref null eq))))
  (type $runtime.func-clos (func (param (ref $runtime.closure_arg_array))(result (ref null eq))))


  (import "runtime" "apply" (func $runtime.apply (type $runtime.apply)))
  (import "runtime" "newClosure" (func $runtime.newClosure (type $runtime.newClosure)))
  (import "runtime" "getSingleClosureArg" (func $runtime.getSingleClosureArg (type $runtime.getSingleClosureArg)))
  (import "runtime" "addToArgArray" (func $runtime.addToArgArray (type $runtime.addToArgArray)))

  (elem declare func $intDegree)
  (elem declare func $intDiv)
  (elem declare func $intDiv-aux-1)
  (elem declare func $intMod)
  (elem declare func $intMod-aux-1)
  (elem declare func $numDiv)
  (elem declare func $numDiv-aux-1)

  (func $intDegree (export "intDegree") (type $runtime.func-param-clos)
    (local $x i32)

    local.get 1
    ref.cast (ref i31)
    i31.get_s
    local.tee $x

    ;; get absolute value of $x
    i32.const 0
    i32.lt_s
    (if (result i32)
      (then 
        local.get $x
        i32.const -1
        i32.mul
      )
      (else
        local.get $x
      )
    )

    i31.new

    ;; why does .js cap off at these values?
    ;;9223372036854775807
    ;;2147483647
  )

  (func $intDiv (export "intDiv") (type $runtime.func-param-clos)
    ;; ref to other func on stack
    ref.func $intDiv-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $intDiv-aux-1 (type $runtime.func-param-clos)
    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref i31)
    i31.get_s

    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref i31)
    i31.get_s

    ;; divide and box
    i32.div_s
    i31.new
  )

  (func $intMod (export "intMod") (type $runtime.func-param-clos)
    ;; ref to other func on stack
    ref.func $intMod-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )


  (func $intMod-aux-1 (type $runtime.func-param-clos)
    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref i31)
    i31.get_s
    
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref i31)
    i31.get_s

    ;; get remainder and box
    i32.rem_s
    i31.new
  )

  (func $numDiv (export "numDiv") (type $runtime.func-param-clos)
    ;; ref to other func on stack
    ref.func $numDiv-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

(func $numDiv-aux-1 (type $runtime.func-param-clos)
    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0


    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0

    ;; divide and box
    f32.div
    struct.new $runtime.boxedf32
  )

;; degreeTest (int)
  (func $degreeIntTest (export "degreeIntTest") (param i32) (result i32)
    ref.func $intDegree
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 0
    i31.new
    call $runtime.apply
    ref.cast (ref i31)
    i31.get_s
  )

;; modTest (int)
  (func $modIntTest (export "modIntTest") (param i32 i32) (result i32)
    ref.func $intMod
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 0
    i31.new

    call $runtime.apply
    ref.cast (ref $runtime.closure_top)

    local.get 1
    i31.new

    call $runtime.apply
    ref.cast (ref i31)
    i31.get_s
  )

;; divTest (int)

  (func $divIntTest (export "divIntTest") (param i32 i32) (result i32)
    ref.func $intDiv
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 0
    i31.new

    call $runtime.apply
    ref.cast (ref $runtime.closure_top)

    local.get 1
    i31.new

    call $runtime.apply
    ref.cast (ref i31)
    i31.get_s
  )
  
  ;; divTest (number)
  (func $divNumbTest (export "divNumbTest") (param f32 f32) (result f32)
    ref.func $numDiv
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 0
    struct.new $runtime.boxedf32

    call $runtime.apply
    ref.cast (ref $runtime.closure_top)

    local.get 1
    struct.new $runtime.boxedf32

    call $runtime.apply
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0
  )


  ;; --------------------------- Ring -------------------------------
  (elem declare func $intSub)
  (elem declare func $intSub-aux-1)
  (elem declare func $numSub)
  (elem declare func $numSub-aux-1)

  (func $subTest (export "intSubTest") (param i32 i32) (result i32)
    ref.func $intSub
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 0
    i31.new

    call $runtime.apply
    ref.cast (ref $runtime.closure_top)

    local.get 1
    i31.new

    call $runtime.apply
    ref.cast (ref i31)
    i31.get_s
  )

  (func $intSub (export "intSub") (type $runtime.func-param-clos)
    ;; ref to other func on stack
    ref.func $intSub-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $intSub-aux-1 (type $runtime.func-param-clos)
    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref i31)
    i31.get_s
    
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref i31)
    i31.get_s

    ;; add and box
    i32.sub
    i31.new
  )

  (func $numSub (export "numSub") (type $runtime.func-param-clos)
    ;; ref to other func on stack
    ref.func $numSub-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $numSub-aux-1 (type $runtime.func-param-clos)
    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0
    
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0

    ;; add and box
    f32.sub
    struct.new $runtime.boxedf32
  )


  ;; --------------------------- Semiring ---------------------------
  (elem declare func $intAdd)
  (elem declare func $intAdd-aux-1)
  (elem declare func $intMul)
  (elem declare func $intMul-aux-1)
  (elem declare func $numAdd)
  (elem declare func $numAdd-aux-1)
  (elem declare func $numMul)
  (elem declare func $numMul-aux-1)

  (func $intAdd (export "intAdd") (type $runtime.func-param-clos)
    ;; ref to other func on stack
    ref.func $intAdd-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    ;;struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $intAdd-aux-1 (type $runtime.func-param-clos)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref i31)
    i31.get_s

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref i31)
    i31.get_s

    ;; add and box
    i32.add
    i31.new
  )

  (func $intMul (export "intMul") (type $runtime.func-param-clos)
    ;; ref to other func on stack
    ref.func $intMul-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )


  (func $intMul-aux-1 (type $runtime.func-param-clos)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref i31)
    i31.get_s

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref i31)
    i31.get_s

    ;; multiply and box
    i32.mul
    i31.new
  )

  (func $numAdd (export "numAdd") (type $runtime.func-param-clos)
    ;; ref to other func on stack
    ref.func $numAdd-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $numAdd-aux-1 (type $runtime.func-param-clos)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0

    ;; add and box
    f32.add
    struct.new $runtime.boxedf32
  )

  (func $numMul (export "numMul") (type $runtime.func-param-clos)
    ;; ref to other func on stack
    ref.func $numMul-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )


  (func $numMul-aux-1 (type $runtime.func-param-clos)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0

    ;; multiply and box
    f32.mul
    struct.new $runtime.boxedf32
  )

)