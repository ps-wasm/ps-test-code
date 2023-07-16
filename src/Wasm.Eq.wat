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

  (elem declare func $eqIntImpl)
  (elem declare func $eqIntImpl-aux-1)
  (elem declare func $eqNumberImpl)
  (elem declare func $eqNumberImpl-aux-1)
  (elem declare func $eqBooleanImpl)
  (elem declare func $eqBooleanImpl-aux-1)

  (func $eqIntImpl (export "eqIntImpl") (type $func-param-clos)
    ref.func $eqIntImpl-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $eqIntImpl-aux-1 (type $func-param-clos)
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
    i64.eq
    i31.new
  )

 (func $eqNumberImpl (export "eqNumberImpl") (type $func-param-clos)
    ;; ref to other func on stack
    ref.func $eqNumberImpl-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $eqNumberImpl-aux-1 (type $func-param-clos)
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
    f64.eq
    i31.new
  )

  ;; #TODO is this okay?
  ;; booleans are boxed as an i31
  (func $eqBooleanImpl (export "eqBooleanImpl") (type $func-param-clos)
    ref.func $eqBooleanImpl-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $eqBooleanImpl-aux-1 (type $func-param-clos)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast i31ref
    i31.get_u

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast i31ref
    i31.get_u

    ;; add and box
    i32.eq
    i31.new
  )
)