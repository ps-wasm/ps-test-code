(module
  (rec
    (type $runtime.func_top
      (func (param $clos (ref $runtime.closure_top)) (param $arg eqref) (result eqref)))
    (type $runtime.closure_top
      (struct (field (ref $runtime.func_top)) (field (ref $runtime.closure_arg_array))))
    (type $runtime.closure_arg_array (array (mut eqref)))
    (type $runtime.closure_arg_array_mut (array (mut eqref)))
  )
  (type $runtime.boxedi64 (struct (field i64)))
  (type $runtime.boxedf32 (struct (field f32)))
  (type $runtime.boxedf64 (struct (field f64)))
  (type $runtime.classDict (array (ref $runtime.func_top)))
  (type $runtime.unbox-i64 (func (param $x (ref $runtime.boxedi64)) (result i64)))
  (type $runtime.box-i64 (func (param $x i64) (result (ref $runtime.boxedi64))))
  (type $runtime.unbox-f32 (func (param $x (ref $runtime.boxedf32)) (result f32)))
  (type $runtime.box-f32 (func (param $x f32) (result (ref $runtime.boxedf32))))
  (type $runtime.unbox-f64 (func (param $x (ref $runtime.boxedf64)) (result f64)))
  (type $runtime.box-f64 (func (param $x f64) (result (ref $runtime.boxedf64))))
  (type $runtime.apply
    (func (param $clos (ref $runtime.closure_top)) (param $arg eqref) (result eqref)))
  (type $runtime.newClosure
    (func (param $func (ref $runtime.func_top))
          (param $clos (ref $runtime.closure_arg_array))
          (result (ref $runtime.closure_top))))
  (type $runtime.getSingleClosureArg
    (func (param $clos (ref $runtime.closure_top))
          (param $index i32)
          (result eqref)))
  (type $runtime.addToArgArray
    (func (param $arg-array (ref $runtime.closure_arg_array))
          (param $new-var eqref)
          (result (ref $runtime.closure_arg_array))))

  (import "runtime" "unbox-i64" (func $runtime.unbox-i64 (type $runtime.unbox-i64)))
  (import "runtime" "box-i64" (func $runtime.box-i64 (type $runtime.box-i64)))
  (import "runtime" "unbox-f32" (func $runtime.unbox-f32 (type $runtime.unbox-f32)))
  (import "runtime" "box-f32" (func $runtime.box-f32 (type $runtime.box-f32)))
  (import "runtime" "unbox-f64" (func $runtime.unbox-f64 (type $runtime.unbox-f64)))
  (import "runtime" "box-f64" (func $runtime.box-f64 (type $runtime.box-f64)))
  (import "runtime" "apply" (func $runtime.apply (type $runtime.apply)))
  (import "runtime" "newClosure" (func $runtime.newClosure (type $runtime.newClosure)))
  (import "runtime" "getSingleClosureArg"
    (func $runtime.getSingleClosureArg (type $runtime.getSingleClosureArg)))
  (import "runtime" "addToArgArray" (func $runtime.addToArgArray (type $runtime.addToArgArray)))

  (elem declare func $intAdd)
  (elem declare func $intAdd-aux-1)
  (elem declare func $intMul)
  (elem declare func $intMul-aux-1)
  (elem declare func $numAdd)
  (elem declare func $numAdd-aux-1)
  (elem declare func $numMul)
  (elem declare func $numMul-aux-1)

  (func $intAdd (export "intAdd") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $intAdd-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $intAdd-aux-1 (type $runtime.func_top)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
    ;;ref.cast i31ref
    ;;i31.get_u

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
;;    ref.cast i31ref
;;    i31.get_u

    ;; add and box
    i64.add
    call $runtime.box-i64
;;  i31.new
  )

  (func $intMul (export "intMul") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $intMul-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )


  (func $intMul-aux-1 (type $runtime.func_top)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64

    ;; multiply and box
    i64.mul
    call $runtime.box-i64
  )

  (func $numAdd (export "numAdd") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $numAdd-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $numAdd-aux-1 (type $runtime.func_top)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf64)
    call $runtime.unbox-f64

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf64)
    call $runtime.unbox-f64

    ;; add and box
    f64.add
    call $runtime.box-f64
  )

  (func $numMul (export "numMul") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $numMul-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )


  (func $numMul-aux-1 (type $runtime.func_top)
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf64)
    call $runtime.unbox-f64

    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf64)
    call $runtime.unbox-f64

    ;; multiply and box
    f64.mul
    call $runtime.box-f64
  )
)