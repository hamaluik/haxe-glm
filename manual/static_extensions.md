# Static Extensions

The bulk of the functions in the vector and matrix classes in this library are designed to be used either statically or as [static extensions](https://haxe.org/manual/lf-static-extension.html).

Thus the following are equivalent:

```haxe
var a:Mat4 = new Mat4();
var b:Mat4 = Mat4.copy(a, new Mat4());
```

and:

```haxe
using glm.Mat4;

var a:Mat4 = new Mat4();
var b:Mat4 = a.copy(new Mat4());
```

By including the `using <classpath>;` line at the top of the source file, you can omit the first argument (usually, the source parameter). Although this is slightly inconvenient, it adds some handy flexibility and is a small price to pay for that flexibility.
