(component
  (type (;0;) (tuple string u32 string))
  (type (;1;) (func (param "x" string) (result 0)))
  (type (;2;) (func))
  (type (;3;) (func (result string)))
  (type (;4;) 
    (instance
      (alias outer 1 3 (type (;0;)))
      (export "a" (func (type 0)))
    )
  )
  (import "foo" (instance (;0;) (type 4)))
  (core module (;0;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;2;) (func (param i32 i32) (result i32)))
    (type (;3;) (func))
    (type (;4;) (func (result i32)))
    (import "foo" "a: func() -> string" (func (;0;) (type 0)))
    (func (;1;) (type 1) (param i32 i32 i32 i32) (result i32)
      unreachable
    )
    (func (;2;) (type 2) (param i32 i32) (result i32)
      unreachable
    )
    (func (;3;) (type 3)
      unreachable
    )
    (func (;4;) (type 4) (result i32)
      unreachable
    )
    (memory (;0;) 1)
    (export "memory" (memory 0))
    (export "cabi_realloc" (func 1))
    (export "a: func(x: string) -> tuple<string, u32, string>" (func 2))
    (export "bar#a: func() -> ()" (func 3))
    (export "bar#b: func() -> string" (func 4))
  )
  (core module (;1;)
    (type (;0;) (func (param i32)))
    (func (;0;) (type 0) (param i32)
      local.get 0
      i32.const 0
      call_indirect (type 0)
    )
    (table (;0;) 1 1 funcref)
    (export "0" (func 0))
    (export "$imports" (table 0))
  )
  (core module (;2;)
    (type (;0;) (func (param i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "$imports" (table (;0;) 1 1 funcref))
    (elem (;0;) (i32.const 0) func 0)
  )
  (core instance (;0;) (instantiate 1))
  (alias core export 0 "0" (core func (;0;)))
  (core instance (;1;) 
    (export "a: func() -> string" (func 0))
  )
  (core instance (;2;) (instantiate 0
      (with "foo" (instance 1))
    )
  )
  (alias core export 2 "memory" (core memory (;0;)))
  (alias core export 2 "cabi_realloc" (core func (;1;)))
  (alias core export 0 "$imports" (core table (;0;)))
  (alias export 0 "a" (func (;0;)))
  (core func (;2;) (canon lower (func 0) (memory 0) (realloc 1) string-encoding=utf8))
  (core instance (;3;) 
    (export "$imports" (table 0))
    (export "0" (func 2))
  )
  (core instance (;4;) (instantiate 2
      (with "" (instance 3))
    )
  )
  (alias core export 2 "a: func(x: string) -> tuple<string, u32, string>" (core func (;3;)))
  (func (;1;) (type 1) (canon lift (core func 3) (memory 0) (realloc 1) string-encoding=utf8))
  (alias core export 2 "bar#a: func() -> ()" (core func (;4;)))
  (alias core export 2 "bar#b: func() -> string" (core func (;5;)))
  (func (;2;) (type 2) (canon lift (core func 4)))
  (func (;3;) (type 3) (canon lift (core func 5) (memory 0) (realloc 1) string-encoding=utf8))
  (instance (;1;)
    (export "a" (func 2))
    (export "b" (func 3))
  )
  (export "a" (func 1))
  (export "bar" (instance 1))
)