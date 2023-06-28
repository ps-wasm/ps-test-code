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

  (elem declare func $ordBooleanImpl)
  (elem declare func $ordBooleanImpl-aux-1)
  (elem declare func $ordBooleanImpl-aux-2)
  (elem declare func $ordBooleanImpl-aux-3)
  (elem declare func $ordBooleanImpl-aux-4)
  (elem declare func $ordIntImpl)
  (elem declare func $ordIntImpl-aux-1)
  (elem declare func $ordIntImpl-aux-2)
  (elem declare func $ordIntImpl-aux-3)
  (elem declare func $ordIntImpl-aux-4)
  (elem declare func $ordNumberImpl)
  (elem declare func $ordNumberImpl-aux-1)
  (elem declare func $ordNumberImpl-aux-2)
  (elem declare func $ordNumberImpl-aux-3)
  (elem declare func $ordNumberImpl-aux-4)


  (func $ordIntTest (export "ordIntTest") (param i64 i64) (result i32)
    ref.func $ordIntImpl
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top

    i32.const -1
    i31.new
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    i32.const 0
    i31.new
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    i32.const 1
    i31.new
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    
    local.get 0
    call $runtime.box-i64
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    local.get 1
    call $runtime.box-i64
    call $runtime.apply
    ref.cast i31ref
    i31.get_s
  )
  

  ;; -----------------------------------------
  ;; boolean
  
  (func $ordBooleanImpl (export "ordBooleanImpl") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordBooleanImpl-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordBooleanImpl-aux-1 (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordBooleanImpl-aux-2

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordBooleanImpl-aux-2 (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordBooleanImpl-aux-3

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordBooleanImpl-aux-3 (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordBooleanImpl-aux-4

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordBooleanImpl-aux-4 (type $runtime.func_top)
    (local $x i32)
    (local $y i32)
        
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast i31ref
    i31.get_u
    local.set $y

    ;; get x: 4th arg in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast i31ref
    i31.get_u
    local.tee $x
    local.get $y
    i32.lt_s

    (if (result i31ref)
      (then
        ;; get LT value
        local.get 0
        i32.const 3
        call $runtime.getSingleClosureArg
        ref.cast i31ref
      )
      (else
        local.get $x
        local.get $y
        i32.eq
        (if (result i31ref)
          (then
            ;; get EQ value
            local.get 0
            i32.const 2
            call $runtime.getSingleClosureArg
            ref.cast i31ref
          )
          (else
            ;; get GT value
            local.get 0
            i32.const 1
            call $runtime.getSingleClosureArg
            ref.cast i31ref
          )
        )
      )
    )
  )

  ;; -----------------------------------------
  ;; Int
  
  (func $ordIntImpl (export "ordIntImpl") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordIntImpl-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordIntImpl-aux-1 (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordIntImpl-aux-2

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordIntImpl-aux-2 (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordIntImpl-aux-3

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordIntImpl-aux-3 (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordIntImpl-aux-4

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordIntImpl-aux-4 (type $runtime.func_top)
    
    (local $x i64)
    (local $y i64)
        
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
    local.set $y

    ;; get x: 4th arg in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi64)
    call $runtime.unbox-i64
    local.tee $x
    local.get $y
    i64.lt_s

    (if (result i31ref)
      (then
        ;; get LT value
        local.get 0
        i32.const 3
        call $runtime.getSingleClosureArg
        ref.cast i31ref
      )
      (else
        local.get $x
        local.get $y
        i64.eq
        (if (result i31ref)
          (then
            ;; get EQ value
            local.get 0
            i32.const 2
            call $runtime.getSingleClosureArg
            ref.cast i31ref
          )
          (else
            ;; get GT value
            local.get 0
            i32.const 1
            call $runtime.getSingleClosureArg
            ref.cast i31ref
          )
        )
      )
    )
  )

  ;; -----------------------------------------
  ;; number
  
  (func $ordNumberImpl (export "ordNumberImpl") (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordNumberImpl-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordNumberImpl-aux-1 (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordNumberImpl-aux-2

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordNumberImpl-aux-2 (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordNumberImpl-aux-3

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordNumberImpl-aux-3 (type $runtime.func_top)
    ;; ref to other func on stack
    ref.func $ordNumberImpl-aux-4

    ;; create new closure-args and place result on stack
    local.get 0
    struct.get $runtime.closure_top 1
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ordNumberImpl-aux-4 (type $runtime.func_top)
    (local $x f64)
    (local $y f64)
        
    ;; get arg passed with call and unbox
    local.get 1
    ref.cast (ref $runtime.boxedf64)
    call $runtime.unbox-f64
    local.set $y

    ;; get x: 4th arg in function closure and unbox
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf64)
    call $runtime.unbox-f64
    local.tee $x
    local.get $y
    f64.lt

    (if (result i31ref)
      (then
        ;; get LT value
        local.get 0
        i32.const 3
        call $runtime.getSingleClosureArg
        ref.cast i31ref
      )
      (else
        local.get $x
        local.get $y
        f64.eq
        (if (result i31ref)
          (then
            ;; get EQ value
            local.get 0
            i32.const 2
            call $runtime.getSingleClosureArg
            ref.cast i31ref
          )
          (else
            ;; get GT value
            local.get 0
            i32.const 1
            call $runtime.getSingleClosureArg
            ref.cast i31ref
          )
        )
      )
    )
  )
)