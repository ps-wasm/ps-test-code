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

  (elem declare func $intDegree)
  (elem declare func $intDiv)
  (elem declare func $intDiv-aux-1)
  (elem declare func $intMod)
  (elem declare func $intMod-aux-1)
  (elem declare func $numDiv)
  (elem declare func $numDiv-aux-1)

  (func $intDegree (export "intDegree") (type $runtime.func_top)
    (local $x i64)

    local.get 1
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
    local.tee $x

    ;; get absolute value of $x
    i64.const 0
    i64.lt_s
    (if (result i64)
      (then 
        local.get $x
        i64.const -1
        i64.mul
      )
      (else
        local.get $x
      )
    )

    call $runtime.box-i64

    ;; why does .js cap off at these values?
    ;;9223372036854775807
    ;;2147483647
  )

  (func $intDiv (export "intDiv") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $intDiv-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $intDiv-aux-1 (type $runtime.func_top)
    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
    ;;    ref.cast i31ref
    ;;    i31.get_u


    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
    ;;ref.cast i31ref
    ;;i31.get_u

    ;; divide and box
    i64.div_s
    call $runtime.box-i64
    ;;  i31.new
  )

  (func $intMod (export "intMod") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $intMod-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )


  (func $intMod-aux-1 (type $runtime.func_top)
    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
    
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64

    ;; get remainder and box
    i64.rem_s
    call $runtime.box-i64
  )

  (func $numDiv (export "numDiv") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $numDiv-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

(func $numDiv-aux-1 (type $runtime.func_top)
    ;; get arg present in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf64)
    call $runtime.unbox-f64
    ;;    ref.cast i31ref
    ;;    i31.get_u


    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf64)
    call $runtime.unbox-f64
    ;;ref.cast i31ref
    ;;i31.get_u

    ;; divide and box
    f64.div
    call $runtime.box-f64
    ;;  i31.new
  )

;; degreeTest (int)
  (func $degreeIntTest (export "degreeIntTest") (param i64) (result i64)
    ref.func $intDegree
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 0
    call $runtime.box-i64
    call $runtime.apply
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
  )

;; modTest (int)
  (func $modIntTest (export "modIntTest") (param i64 i64) (result i64)
    ref.func $intMod
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 0
    call $runtime.box-i64

    call $runtime.apply
    ref.cast (ref $runtime.closure_top)

    local.get 1
    call $runtime.box-i64

    call $runtime.apply
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
  )

;; divTest (int)

  (func $divIntTest (export "divIntTest") (param i64 i64) (result i64)
    ref.func $intDiv
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 0
    call $runtime.box-i64

    call $runtime.apply
    ref.cast (ref $runtime.closure_top)

    local.get 1
    call $runtime.box-i64

    call $runtime.apply
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
  )
  
  ;; divTest (number)
  (func $divNumbTest (export "divNumbTest") (param f64 f64) (result f64)
    ref.func $numDiv
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 0
    call $runtime.box-f64

    call $runtime.apply
    ref.cast (ref $runtime.closure_top)

    local.get 1
    call $runtime.box-f64

    call $runtime.apply
    ref.cast (ref $runtime.boxedf64)
    call $runtime.unbox-f64
  )

)