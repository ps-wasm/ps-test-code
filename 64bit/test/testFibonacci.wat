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
    
    (import "main" "Main.fibonacci" (func $Main.fibonacci (type $runtime.func-param-clos)))

    (elem declare func $Main.fibonacci)

    (func $Test.testFibonacci (export "Test.testFibonacci") (param f64) (result f64)
      ref.func $Main.fibonacci
      array.new_fixed $runtime.closure_arg_array 0
      call $runtime.newClosure
      local.get 0
      struct.new $runtime.boxedf64
      call $runtime.apply
      ref.cast (ref $runtime.boxedf64)
      struct.get $runtime.boxedf64 0
    )
)