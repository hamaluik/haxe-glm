# Destination Arguments

The bulk of the functions in the vector and matrix classes in this library include a `dest` parameter. This puts the onus on you to decide how instantiation will occur (or not). Instead of automatically creating a new object on every operation, each operation gives you the choice to set the values of a pre-instantiated object instead.

For example, you can create a completely new identity matrix using:

```haxe
var m:Mat4 = Mat4.identity(new Mat4());
```

Alternatively, you can modify an existing matrix to make it an identity matrix using:

```haxe
var somePreexistingUnusedMat:Mat4 = new Mat4(1, 2, 3, 4);

// ...

var m:Mat4 = Mat4.identity(somePreexistingUnusedMat);

m == somePreexistingUnusedMat; // true!
```
