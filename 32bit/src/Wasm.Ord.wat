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

  (elem declare func $ltIntImpl)
  (elem declare func $ltIntImpl-aux-1)
  (elem declare func $gtIntImpl)
  (elem declare func $gtIntImpl-aux-1)
  (elem declare func $eqIntImpl)
  (elem declare func $eqIntImpl-aux-1)
  (elem declare func $ltNumbImpl)
  (elem declare func $ltNumbImpl-aux-1) 
  (elem declare func $gtNumbImpl)
  (elem declare func $gtNumbImpl-aux-1)
  (elem declare func $eqNumbImpl)
  (elem declare func $eqNumbImpl-aux-1)
  (elem declare func $ltBoolImpl)
  (elem declare func $ltBoolImpl-aux-1) 
  (elem declare func $gtBoolImpl)
  (elem declare func $gtBoolImpl-aux-1)
  (elem declare func $eqBoolImpl)
  (elem declare func $eqBoolImpl-aux-1) 

  (func $ltIntImpl (export "ltIntImpl") (type $runtime.func-param-clos)
      ref.func $ltIntImpl-aux-1
      
      local.get 0
      local.get 1
      call $runtime.addToArgArray
      
      call $runtime.newClosure
  )

  (func $ltIntImpl-aux-1 (type $runtime.func-param-clos)
    local.get 1
    ref.cast (ref $runtime.boxedi32)
    struct.get $runtime.boxedi32 0
            
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi32)
    struct.get $runtime.boxedi32 0
          
    i32.lt_s
    i31.new
  )

  (func $gtIntImpl (export "gtIntImpl") (type $runtime.func-param-clos)
    ref.func $gtIntImpl-aux-1
      
    local.get 0
    local.get 1
    call $runtime.addToArgArray
     
    call $runtime.newClosure
  )

  (func $gtIntImpl-aux-1 (type $runtime.func-param-clos)
    local.get 1
    ref.cast (ref $runtime.boxedi32)
    struct.get $runtime.boxedi32 0
            
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi32)
    struct.get $runtime.boxedi32 0

    i32.gt_s
    i31.new
  )

  (func $eqIntImpl (export "eqIntImpl") (type $runtime.func-param-clos)
    ref.func $eqIntImpl-aux-1
    
    local.get 0
    local.get 1
    call $runtime.addToArgArray
     
    call $runtime.newClosure
  )

  (func $eqIntImpl-aux-1 (type $runtime.func-param-clos)
    local.get 1
    ref.cast (ref $runtime.boxedi32)
    struct.get $runtime.boxedi32 0
            
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedi32)
    struct.get $runtime.boxedi32 0
          
    i32.eq
    i31.new
  )

  (func $ltNumbImpl (export "ltNumbImpl") (type $runtime.func-param-clos)
    ref.func $ltNumbImpl-aux-1
     
    local.get 0
    local.get 1
    call $runtime.addToArgArray
      
    call $runtime.newClosure
  )

  (func $ltNumbImpl-aux-1 (type $runtime.func-param-clos)
    local.get 1
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0
          
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0
           
    f32.lt
    i31.new
  )

  (func $gtNumbImpl (export "gtNumbImpl") (type $runtime.func-param-clos)
    ref.func $gtNumbImpl-aux-1
      
    local.get 0
    local.get 1
    call $runtime.addToArgArray
     
    call $runtime.newClosure
  )

  (func $gtNumbImpl-aux-1 (type $runtime.func-param-clos)
    local.get 1
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0
            
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0

    f32.gt
    i31.new
  )

  (func $eqNumbImpl (export "eqNumbImpl") (type $runtime.func-param-clos)
    ref.func $eqNumbImpl-aux-1
    
    local.get 0
    local.get 1
    call $runtime.addToArgArray
    
    call $runtime.newClosure
  )

  (func $eqNumbImpl-aux-1 (type $runtime.func-param-clos)
    local.get 1
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0
            
    local.get 0
    i32.const 0
    call $runtime.getSingleClosureArg
    ref.cast (ref $runtime.boxedf32)
    struct.get $runtime.boxedf32 0
          
    f32.eq
    i31.new
  )

  ;; #TODO is this okay?
  ;; booleans are boxed as an i31
  (func $ltBoolImpl (export "ltBoolImpl") (type $runtime.func-param-clos)
    ref.func $eqBoolImpl-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $ltBoolImpl-aux-1 (type $runtime.func-param-clos)
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

    ;; compare and box
    i32.lt_s
    i31.new
  )

  (func $gtBoolImpl (export "gtBoolImpl") (type $runtime.func-param-clos)
    ref.func $eqBoolImpl-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $gtBoolImpl-aux-1 (type $runtime.func-param-clos)
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

    ;; compare and box
    i32.gt_s
    i31.new
  )

  (func $eqBoolImpl (export "eqBoolImpl") (type $runtime.func-param-clos)
    ref.func $eqBoolImpl-aux-1

    ;; create new closure-args and place result on stack
    local.get 0
    local.get 1
    call $runtime.addToArgArray

    ;; create and return new function closure
    call $runtime.newClosure
  )

  (func $eqBoolImpl-aux-1 (type $runtime.func-param-clos)
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

    ;; compare and box
    i32.eq
    i31.new
  )



   ;; ltTest (int)

  (func $ltIntTest (export "ltIntTest") (param i32 i32) (result i32)
    ref.func $ltIntImpl
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 1
    struct.new $runtime.boxedi32
    
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    
    local.get 0
    struct.new $runtime.boxedi32
    
    call $runtime.apply
    ref.cast i31ref
    i31.get_u
  )
  
  ;;ltTest (number)
  (func $ltNumbTest (export "ltNumbTest") (param f32 f32) (result i32)
    ref.func $ltNumbImpl
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 1
    struct.new $runtime.boxedf32
    
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    
    local.get 0
    struct.new $runtime.boxedf32
    
    call $runtime.apply
    ref.cast i31ref
    i31.get_u
  )

  ;; gtTest (int)
  (func $gtIntTest (export "gtIntTest") (param i32 i32) (result i32)
    ref.func $gtIntImpl
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 1
    struct.new $runtime.boxedi32
    
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    
    local.get 0
    struct.new $runtime.boxedi32
    
    call $runtime.apply
    ref.cast i31ref
    i31.get_u
  )

  ;; gtTest (number)
  (func $gtNumbTest (export "gtNumbTest") (param f32 f32) (result i32)
    ref.func $gtNumbImpl
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 1
    struct.new $runtime.boxedf32
    
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    
    local.get 0
    struct.new $runtime.boxedf32
    
    call $runtime.apply
    ref.cast i31ref
    i31.get_u
  )

  ;; eqtest (int)
  (func $eqIntTest (export "eqIntTest") (param i32 i32) (result i32)
    ref.func $eqIntImpl
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 1
    struct.new $runtime.boxedi32
    
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    
    local.get 0
    struct.new $runtime.boxedi32
    
    call $runtime.apply
    ref.cast i31ref
    i31.get_u
  )

  ;; eqtest (number)
  (func $eqNumbTest (export "eqNumbTest") (param f32 f32) (result i32)
    ref.func $eqNumbImpl
    array.new_fixed $runtime.closure_arg_array 0
    struct.new $runtime.closure_top
    local.get 1
    struct.new $runtime.boxedf32
    
    call $runtime.apply
    ref.cast (ref $runtime.closure_top)
    
    local.get 0
    struct.new $runtime.boxedf32
    
    call $runtime.apply
    ref.cast i31ref
    i31.get_u
  )
)  