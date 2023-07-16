(module
  (type $runtime.closure_arg_array (array (mut (ref null eq))))
  (type $runtime.closure_top (struct (field (ref func))(field (ref $runtime.closure_arg_array))))
  (type $runtime.classDict (array (mut (ref null eq))))
  (type $runtime.boxedi64 (struct (field i64)))
  (type $runtime.boxedf32 (struct (field f32)))
  (type $runtime.boxedf64 (struct (field f64)))
  
  
  (type $runtime.apply (func (param (ref $runtime.closure_top)) (param (ref null eq)) (result (ref null eq))))
  (type $runtime.addToArgArray (func (param (ref $runtime.closure_arg_array))(param (ref null eq))(result (ref $runtime.closure_arg_array))))
  (type $runtime.newClosure (func (param (ref func))(param (ref $runtime.closure_arg_array))(result (ref $runtime.closure_top))))
  (type $runtime.getSingleClosureArg (func (param (ref $runtime.closure_arg_array))(param i32)(result (ref null eq))))
  (type $func-param-clos (func (param (ref $runtime.closure_arg_array))(param (ref null eq))(result (ref null eq))))
  (type $func-clos (func (param (ref $runtime.closure_arg_array))(result (ref null eq))))


  (import "runtime" "apply" (func $runtime.apply (type $runtime.apply)))
  (import "runtime" "newClosure" (func $runtime.newClosure (type $runtime.newClosure)))
  (import "runtime" "getSingleClosureArg" (func $runtime.getSingleClosureArg (type $runtime.getSingleClosureArg)))
  (import "runtime" "addToArgArray" (func $runtime.addToArgArray (type $runtime.addToArgArray)))

  (elem declare func $intAdd)
  (elem declare func $intAdd-aux-1)
  (elem declare func $intMul)
  (elem declare func $intMul-aux-1)
  (elem declare func $numAdd)
  (elem declare func $numAdd-aux-1)
  (elem declare func $numMul)
  (elem declare func $numMul-aux-1)

  (func $intAdd (export "intAdd") (type $func-param-clos)
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

  (func $intAdd-aux-1 (type $func-param-clos)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedi64)
    struct.get $runtime.boxedi64 0
    ;;ref.cast i31ref
    ;;i31.get_u

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi64)
    struct.get $runtime.boxedi64 0
;;    ref.cast i31ref
;;    i31.get_u

    ;; add and box
    i64.add
    struct.new $runtime.boxedi64
;;  i31.new
  )

  (func $intMul (export "intMul") (type $func-param-clos)
    ;; ref to other func on stack
    ref.func $intMul-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    ;;struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )


  (func $intMul-aux-1 (type $func-param-clos)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedi64)
    struct.get $runtime.boxedi64 0

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi64)
    struct.get $runtime.boxedi64 0

    ;; multiply and box
    i64.mul
    struct.new $runtime.boxedi64
  )

  (func $numAdd (export "numAdd") (type $func-param-clos)
    ;; ref to other func on stack
    ref.func $numAdd-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    ;;struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $numAdd-aux-1 (type $func-param-clos)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf64)
    struct.get $runtime.boxedf64 0

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf64)
    struct.get $runtime.boxedf64 0

    ;; add and box
    f64.add
    struct.new $runtime.boxedf64
  )

  (func $numMul (export "numMul") (type $func-param-clos)
    ;; ref to other func on stack
    ref.func $numMul-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    ;;struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )


  (func $numMul-aux-1 (type $func-param-clos)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf64)
    struct.get $runtime.boxedf64 0

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf64)
    struct.get $runtime.boxedf64 0

    ;; multiply and box
    f64.mul
    struct.new $runtime.boxedf64
  )
)