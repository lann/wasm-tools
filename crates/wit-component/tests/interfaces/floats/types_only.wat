(component
  (type (;0;) (func (param "x" float32)))
  (type (;1;) (func (param "x" float64)))
  (type (;2;) (func (result float32)))
  (type (;3;) (func (result float64)))
  (type (;4;)
    (instance
      (alias outer 1 0 (type (;0;)))
      (export "float32-param" (func (type 0)))
      (alias outer 1 1 (type (;1;)))
      (export "float64-param" (func (type 1)))
      (alias outer 1 2 (type (;2;)))
      (export "float32-result" (func (type 2)))
      (alias outer 1 3 (type (;3;)))
      (export "float64-result" (func (type 3)))
    )
  )
  (import "floats" (instance (;0;) (type 4)))
)