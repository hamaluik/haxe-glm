# haxe-glm
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/FuzzyWuzzie/haxe-glm/blob/master/LICENSE) [![Build Status](https://img.shields.io/travis/FuzzyWuzzie/haxe-glm.svg?style=flat-square)](https://travis-ci.org/FuzzyWuzzie/haxe-glm) [![Coverage](https://img.shields.io/badge/coverage-98%25-green.svg?style=flat-square)](https://github.com/FuzzyWuzzie/haxe-glm/blob/master/coverage.json)

Native Haxe version of the fantastic GLM library (https://github.com/g-truc/glm). For those unaware of the GLM library, it is basically a toolset for using 2, 3, and 4 dimensional vectors and matrices, as well as quaternions. This tends to be rather useful when working with OpenGL, which is largely all about rasterizing primitives using vectors and matrices.

## Contributing

Issues, forks, and pull requests are gladly welcomed! This library is meant for you, so help make it into what you want it to be!

## Documentation

### API

API documentation is available here: http://hamaluik.com/haxe-glm/

### Samples

```haxe
var translate:glm.Mat4 = GLM.translate(new Vec3(3, 4, -1));
var verts:Array<Vec3> = [
	new Vec3(0, 0, 0),
	new Vec3(1, 0, 0),
	new Vec3(1, 1, 0),
	new Vec3(0, 1, 0)
];

for(i in 0...verts.length) {
	verts[i] = translate * verts[i];
}
```

```haxe
var degToRad:Float = Math.PI / 180.0;
var projection:Mat4 = GLM.perspective(
	60 / 1.78 * degToRad, // field of view y
	1.78 // aspect ratio
	0.1, 1000 // near, far
);
projection = GLM.ortho(-960, 960, -540, 540);
```

### Manual

#### Introduction

This library provides 7 classes (actually, abstracts) which enable vector, matrix, and quaternion mathematical operations (`Vec2`, `Vec3`, `Vec4`, `Mat2`, `Mat3`, `Mat4`, and `Quat`). The vector and quaternion classes are defined as abstracts over arrays of floats, while the matrices are defined as abstracts over arrays of vectors which makes the library work across every target and platform. The library also includes static utiltiies for generating transformation matrices (`GLM`) and projection matrices (`Projection`).

#### Motivation

I decided to create this library for Haxe after seeing project after project write their own code for dealing with vectors, matrices, and quaternions. This has resulted in a lot of duplicated effort by developers who all seem to write their own classes to deal with this.

Hopefully the creation of this [fully cross-target and cross-platform] library, some of this duplicated effort can be minimized in the future.

#### In-Place Modifications

In general, operations on vectors and matrices strive not to allocate new resources. For example, transposing a matrix will modify the matrix in place rather than creating a new one. Similary, one can add a vector to another in place using the `addVecX` functions (where `X  ∈ [2, 3, 4]`). This functionality is utilized when using the overloaded operators, which create a clone instead of modifying an existing entity (for example the addition operator between two `Vec2`s is defined as `a.clone().addVec2(b)`). In the future, the library will likely use object pooling to nearly eliminate unncessary object allocation altogether.

#### Vectors

Vectors behave the same as they would in a GLSL program, and can be of length 2, 3, or 4 (with automatic casting in between dimensions). Similarly to OpenGL, Vectors provide .xyzw, .rgba, and .stpq access to their elements (though not in combination like OpenGL. i.e. `vec.r` is valid while `vec.rgb` is not [currently]).

#### Matrices

In matrices, the data is stored in [Row-major](https://en.wikipedia.org/wiki/Row-major_order) order, although when flattening matrices they can be flattened into row major or column major order using the functions `toArrayRowMajor()` and `toArrayColMajor` respectively.