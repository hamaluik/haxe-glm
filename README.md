# haxe-glm
[![GitHub license](https://img.shields.io/badge/license-Apache%202-blue.svg?style=flat-square)](https://raw.githubusercontent.com/FuzzyWuzzie/haxe-glm/master/LICENSE) [![Build Status](https://img.shields.io/travis/FuzzyWuzzie/haxe-glm.svg?style=flat-square)](https://travis-ci.org/FuzzyWuzzie/haxe-glm)

Native Haxe version of the fantastic GLM library (https://github.com/g-truc/glm). For those unaware of the GLM library, it is basically a toolset for using 2, 3, and 4 dimensional vectors and matrices, as well as quaternions. This tends to be rather useful when working with OpenGL, which is largely all about rasterizing primitives using vectors and matrices.

## Contributing

Issues, forks, and pull requests are gladly welcomed! This library is meant for you, so help make it into what you want it to be!

## Documentation

### Manual

This library provides several classes (actually, abstracts over floating point arrays) which enable vector, matrix, and quaternion mathematical operations (`Vec2`, `Vec3`, `Vec4`, `Mat2`, `Mat4`, and `Quat`). The library also includes static utilities for generating transformation and projection matrices (`GLM`).

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
