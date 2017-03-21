# haxe-glm
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/FuzzyWuzzie/haxe-glm/blob/master/LICENSE) [![Build Status](https://img.shields.io/travis/FuzzyWuzzie/haxe-glm.svg?style=flat-square)](https://travis-ci.org/FuzzyWuzzie/haxe-glm) [![Coverage](https://img.shields.io/badge/coverage-100%25-brightgreen.svg?style=flat-square)](https://github.com/FuzzyWuzzie/haxe-glm/blob/master/coverage.json)

Native Haxe version of the fantastic GLM library (https://github.com/g-truc/glm). For those unaware of the GLM library, it is basically a toolset for using 2, 3, and 4 dimensional vectors and matrices, as well as quaternions. This tends to be rather useful when working with OpenGL, which is largely all about rasterizing primitives using vectors and matrices.

## Contributing

Issues, forks, and pull requests are gladly welcomed! This library is meant for you, so help make it into what you want it to be!

## Documentation

### API

API documentation is available here: http://fuzzywuzzie.github.io/haxe-glm/

### Samples

### Manual

#### Introduction

This library provides 7 classes (actually, abstracts) which enable vector, matrix, and quaternion mathematical operations (`Vec2`, `Vec3`, `Vec4`, `Mat2`, `Mat3`, `Mat4`, and `Quat`). The vector and quaternion classes are defined as abstracts over arrays of floats, while the matrices are defined as abstracts over arrays of vectors which makes the library work across every target and platform. The library also includes static utilities for generating transformation matrices (`GLM`) and projection matrices (`Projection`).

#### Motivation

I decided to create this library for Haxe after seeing project after project write their own code for dealing with vectors, matrices, and quaternions. This has resulted in a lot of duplicated effort by developers who all seem to write their own classes to deal with this.

Hopefully the creation of this [fully cross-target and cross-platform] library, some of this duplicated effort can be minimized in the future.
