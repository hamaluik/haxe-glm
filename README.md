# haxe-glm
[![GitHub license](https://img.shields.io/badge/license-Apache%202-blue.svg?style=flat-square)](https://raw.githubusercontent.com/FuzzyWuzzie/haxe-glm/master/LICENSE) [![Build Status](https://img.shields.io/travis/FuzzyWuzzie/haxe-glm.svg?style=flat-square)](https://travis-ci.org/FuzzyWuzzie/haxe-glm)

Native Haxe version of the fantastic GLM library (https://github.com/g-truc/glm). For those unaware of the GLM library, it is basically a toolset for using 2, 3, and 4 dimensional vectors and matrices, as well as quaternions. This tends to be rather useful when working with OpenGL, which is largely all about rasterizing primitives using vectors and matrices.

## Contributing

Issues, forks, and pull requests are gladly welcomed!

## Documentation

### Manual

This library provides several classes (actually, abstracts over floating point arrays) which enable vector, matrix, and quaternion mathematical operations (`Vec2`, `Vec3`, `Vec4`, `Mat2`, `Mat3`, `Mat4`, and `Quat`). The library also includes static utilities for generating transformation and projection matrices (`GLM`).

The library includes [static extensions](manual/static_extensions.md) and gives you the flexibility to instantiate or reuse objects as desired using [destination arguments](manual/destination_arguments.md).

#### Motivation

I decided to create this library for Haxe after seeing project after project write their own code for dealing with vectors, matrices, and quaternions. This has resulted in a lot of duplicated effort by developers who all seem to write their own classes to deal with this.

Hopefully the creation of this [fully cross-target and cross-platform] library, some of this duplicated effort can be minimized in the future.

### API

API documentation is available here: http://fuzzywuzzie.github.io/haxe-glm/

### Samples

```haxe
// create a new perspective projection matrix
var P:Mat4 = GLM.perspective(
    45 * Math.PI / 180, // field of view (radians)
    640 / 480, // aspect ratio
    0.1, 100, // near, far
    new Mat4() // where to store the result
);
```

```haxe
// transform components
var pos:Vec3 = new Vec3(0, 0, 1.5);
var rot:Quat = Quat.identity(new Quat());
var sca:Vec3 = new Vec3(1, 1, 1);
var modelMatrix:Mat4 = new Mat4();

// ...

// update the model matrix
GLM.transform(pos, rot, sca, modelMatrix);
```

### Underlying Types

This library is written using [abstract types](https://haxe.org/manual/types-abstract.html) over simple base object. When used on its own, the library uses basic classes containing each type's data. For example, Vec4s are implemented as:

```haxe
class Vec4Base {
    function new(){}
    var x:Float;
    var y:Float;
    var z:Float;
    var w:Float;
}

abstract Vec4(Vec4Base) {
    // ...
}
```

Since there are a plethora of libraries out there that each have their own internal format, when the library detects a supported library, it changes to become an abstract over that library's type. For example, if [Kha](https://github.com/Kode/Kha) is detected, `Vec4` becomes an abstract over Kha's `FastVector4` type with implicit casts to and from `FastVector4`s. This enables you to use the functionality in this library without taking performance hits converting to and from the types your library expects.

Implemented underlying types:

- [x] Standalone
- [x] Kha ('Fast' versions—(32-bit floats on cpp, 64-bit doubles everywhere else))
- [ ] Heaps
- [ ] lime
- [ ] OpenFL
- [ ] HaxeFlixel
- [ ] luxe

### Calculations / Features

* :heavy_check_mark:—The calculation is currently available
* :x:—The calculation is planned but not yet available

#### GLM

| Calculation | GLM | API |
|:------------|:---:|:----|
| Lerp scalars | :heavy_check_mark: | `GLM.lerp(a:Float, b:Float, t:Float):Float` |
| Translation matrix | :heavy_check_mark: | `GLM.translate(translation:Vec3, dest:Mat4):Mat4` |
| Rotation matrix | :heavy_check_mark: | `GLM.rotate(rotation:Quat, dest:Mat4):Mat4` |
| Scale matrix | :heavy_check_mark: | `GLM.scale(scale:Quat, dest:Mat4):Mat4` |
| Transformation / model matrix | :heavy_check_mark: | `GLM.transform(translation:Vec3, rotation:Quat, scale:Vec3, dest:Mat4):Mat4` |
| Look-at matrix | :heavy_check_mark: | `GLM.lookAt(eye:Vec3, centre:Vec3, up:Vec3, dest:Mat4):Mat4` |
| Perspective projection matrix | :heavy_check_mark: | `GLM.perspective(fovy:Float, aspectRatio:Float, near:Float, far:Float, dest:Mat4):Mat4` |
| Orthographic projection matrix | :heavy_check_mark: | `GLM.orthographic(left:Float, right:Float, bottom:Float, top:Float, near:Float=-1, far:Float=1, dest:Mat4):Mat4` |
| Frustum projection matrix | :heavy_check_mark: | `GLM.frustum(left:Float, right:Float, bottom:Float, top:Float, near:Float=-1, far:Float=1, dest:Mat4):Mat4` |

#### Vectors

| Calculation | Vec2 | Vec3 | Vec4 | API |
|:------------|:----:|:----:|:----:|:----|
| Add vectors | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `VecX.addVec(a, b, dest)` |
| Add scalars | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `VecX.addScalar(a, s, dest)` |
| Array access | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `vec[index]` |
| Copy | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `VecX.copy(src, dest)` |
| Cross product | :heavy_check_mark: | :heavy_check_mark: |  | `VecX.cross(a, b, dest)` |
| Distance | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `VecX.distance (a, b)` |
| Distance squared | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `VecX.distanceSquared (a, b)` |
| VecX × scalar op | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `v * c` |
| VecX ÷ scalar op | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `v / c` |
| VecX + scalar op | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `v + c` |
| VecX - scalar op | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `v - c` |
| Dot product | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `VecX.dot(a, b)` |
| Equals | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `VecX.equals(a, b)` |
| Length (magnitude) | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `vec.length()` |
| Length squared | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `vec.lengthSquared()` |
| Lerp | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `VecX.lerp(a, b, t, dest)` |
| Normalize | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `VecX.normalize(v, dest)` |
| String representation | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `vec.toString()` |
| To/from float array | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `vec.toFloatArray()`, `VecX.fromFloatArray(arr)` |

#### Quaternions

| Calculation | Quat | API |
|:------------|:----:|:----|
| Axis-angle | :heavy_check_mark: | `Quat.axisAngle(axis, angle, dest)` |
| Copy | :heavy_check_mark: | `Quat.copy(src, dest)` |
| Conjugate | :heavy_check_mark: | `Quat.conjugate(q, dest)` |
| Dot product | :heavy_check_mark: | `Quat.dot(a, b)` |
| From Euler | :heavy_check_mark: | `Quat.fromEuler(x, y, z, dest)` |
| Get axis-angle | :x: |  |
| Dot product | :heavy_check_mark: | `Quat.identity(dest)` |
| Invert | :heavy_check_mark: | `Quat.invert(q, dest)` |
| Length (magnitude) | :heavy_check_mark: | `quat.length()` |
| Length squared | :heavy_check_mark: | `quat.lengthSquared()` |
| Lerp | :heavy_check_mark: | `Quat.lerp(a, b, t, dest)` |
| SLerp | :heavy_check_mark: | `Quat.slerp(a, b, t, dest)` |
| Multiply w/ quats | :heavy_check_mark: | `Quat.multiplyQuats(a, b, dest)` |
| Multiply w/ scalar | :heavy_check_mark: | `Quat.multiplyScalar(a, s, dest)` |
| Quat × quat | :heavy_check_mark: | `a * b` |
| Quat × scalar | :heavy_check_mark: | `a * s` |
| Normalize | :heavy_check_mark: | `Quat.normalize(q, dest)` |
| String representation | :heavy_check_mark: | `quat.toString()` |
| To/from float array | :heavy_check_mark: | `quat.toFloatArray()`, `Quat.fromFloatArray(arr)` |

#### Matrices

| Calculation | Mat2 | Mat3 | Mat4 | API |
|:------------|:----:|:----:|:----:|:----|
| Add matrices | :x: | :x: | :x: |  |
| Add scalars | :x: | :x: | :x: |  |
| Adjugate | :x: | :x: | :x: |  |
| Array access | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `mat[index]` |
| Copy | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `MatX.copy(src, dest)` |
| Determinant | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `MatX.determinant(src)` |
| Equals | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `MatX.equals(a, b)` |
| Identity | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `MatX.identity(dest)` |
| Invert | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `MatX.invert(src, dest)` |
| Multiply w/ matrices | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `MatX.multMat(a, b, dest)` |
| Multiply w/ vectors | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `MatX.multVec(m, v, dest)` |
| Multiply w/ scalars | :x: | :x: | :x: |  |
| String representation | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `mat.toString()` |
| To/from float array | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `mat.toFloatArray()`, `MatX.fromFloatArray(arr)` |
| Transpose | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `MatX.transpose(src, dest)` |
