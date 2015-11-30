(function (console) { "use strict";
var Sample = function() { };
Sample.main = function() {
	var origin = glm__$Vec3_Vec3_$Impl_$._new(150,150);
	var originReset = glm_GLM.translate(null,glm__$Vec3_Vec3_$Impl_$.multiplyScalar(glm__$Vec3_Vec3_$Impl_$.clone(origin),-1));
	var translate = glm_GLM.translate(null,origin);
	var rotate;
	{
		var v = glm__$Mat3_Mat3_$Impl_$.fromQuat(glm_GLM.axisAngle(glm__$Vec3_Vec3_$Impl_$._new(0,0,1),Math.PI / 4));
		var r = glm__$Mat4_Mat4_$Impl_$.fromRows(glm__$Vec4_Vec4_$Impl_$._new(v[0][0],v[0][1],v[0][2],0),glm__$Vec4_Vec4_$Impl_$._new(v[1][0],v[1][1],v[1][2],0),glm__$Vec4_Vec4_$Impl_$._new(v[2][0],v[2][1],v[2][2],0),glm__$Vec4_Vec4_$Impl_$._new(0,0,0,1));
		rotate = r;
	}
	var scale = glm_GLM.scale(null,glm__$Vec3_Vec3_$Impl_$._new(0.5,0.5,0));
	var originalVerts = [glm__$Vec3_Vec3_$Impl_$._new(100,100,0),glm__$Vec3_Vec3_$Impl_$._new(200,100,0),glm__$Vec3_Vec3_$Impl_$._new(200,200,0),glm__$Vec3_Vec3_$Impl_$._new(100,200,0)];
	var translatedVerts = [];
	var _g1 = 0;
	var _g = originalVerts.length;
	while(_g1 < _g) {
		var i = _g1++;
		translatedVerts.push((function($this) {
			var $r;
			var v1;
			{
				var a;
				var a1;
				var a2;
				var a3 = translate;
				var rows = [(function($this) {
					var $r;
					var a4;
					{
						var a5;
						var a6 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[0]),a3[0][0]);
						var b3 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[1]),a3[0][1]);
						a5 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a6),b3);
						var b2 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[2]),a3[0][2]);
						a4 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a5),b2);
					}
					var b1 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[3]),a3[0][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a4),b1);
					return $r;
				}($this)),(function($this) {
					var $r;
					var a7;
					{
						var a8;
						var a9 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[0]),a3[1][0]);
						var b6 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[1]),a3[1][1]);
						a8 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a9),b6);
						var b5 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[2]),a3[1][2]);
						a7 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a8),b5);
					}
					var b4 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[3]),a3[1][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a7),b4);
					return $r;
				}($this)),(function($this) {
					var $r;
					var a10;
					{
						var a11;
						var a12 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[0]),a3[2][0]);
						var b9 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[1]),a3[2][1]);
						a11 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a12),b9);
						var b8 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[2]),a3[2][2]);
						a10 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a11),b8);
					}
					var b7 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[3]),a3[2][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a10),b7);
					return $r;
				}($this)),(function($this) {
					var $r;
					var a13;
					{
						var a14;
						var a15 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[0]),a3[3][0]);
						var b12 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[1]),a3[3][1]);
						a14 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a15),b12);
						var b11 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[2]),a3[3][2]);
						a13 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a14),b11);
					}
					var b10 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(scale[3]),a3[3][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a13),b10);
					return $r;
				}($this))];
				a3 = rows;
				a2 = a3;
				var rows1 = [(function($this) {
					var $r;
					var a16;
					{
						var a17;
						var a18 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[0]),a2[0][0]);
						var b15 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[1]),a2[0][1]);
						a17 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a18),b15);
						var b14 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[2]),a2[0][2]);
						a16 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a17),b14);
					}
					var b13 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[3]),a2[0][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a16),b13);
					return $r;
				}($this)),(function($this) {
					var $r;
					var a19;
					{
						var a20;
						var a21 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[0]),a2[1][0]);
						var b18 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[1]),a2[1][1]);
						a20 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a21),b18);
						var b17 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[2]),a2[1][2]);
						a19 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a20),b17);
					}
					var b16 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[3]),a2[1][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a19),b16);
					return $r;
				}($this)),(function($this) {
					var $r;
					var a22;
					{
						var a23;
						var a24 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[0]),a2[2][0]);
						var b21 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[1]),a2[2][1]);
						a23 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a24),b21);
						var b20 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[2]),a2[2][2]);
						a22 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a23),b20);
					}
					var b19 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[3]),a2[2][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a22),b19);
					return $r;
				}($this)),(function($this) {
					var $r;
					var a25;
					{
						var a26;
						var a27 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[0]),a2[3][0]);
						var b24 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[1]),a2[3][1]);
						a26 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a27),b24);
						var b23 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[2]),a2[3][2]);
						a25 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a26),b23);
					}
					var b22 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(rotate[3]),a2[3][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a25),b22);
					return $r;
				}($this))];
				a2 = rows1;
				a1 = a2;
				var rows2 = [(function($this) {
					var $r;
					var a28;
					{
						var a29;
						var a30 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[0]),a1[0][0]);
						var b27 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[1]),a1[0][1]);
						a29 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a30),b27);
						var b26 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[2]),a1[0][2]);
						a28 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a29),b26);
					}
					var b25 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[3]),a1[0][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a28),b25);
					return $r;
				}($this)),(function($this) {
					var $r;
					var a31;
					{
						var a32;
						var a33 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[0]),a1[1][0]);
						var b30 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[1]),a1[1][1]);
						a32 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a33),b30);
						var b29 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[2]),a1[1][2]);
						a31 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a32),b29);
					}
					var b28 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[3]),a1[1][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a31),b28);
					return $r;
				}($this)),(function($this) {
					var $r;
					var a34;
					{
						var a35;
						var a36 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[0]),a1[2][0]);
						var b33 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[1]),a1[2][1]);
						a35 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a36),b33);
						var b32 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[2]),a1[2][2]);
						a34 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a35),b32);
					}
					var b31 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[3]),a1[2][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a34),b31);
					return $r;
				}($this)),(function($this) {
					var $r;
					var a37;
					{
						var a38;
						var a39 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[0]),a1[3][0]);
						var b36 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[1]),a1[3][1]);
						a38 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a39),b36);
						var b35 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[2]),a1[3][2]);
						a37 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a38),b35);
					}
					var b34 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(originReset[3]),a1[3][3]);
					$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a37),b34);
					return $r;
				}($this))];
				a1 = rows2;
				a = a1;
				var b;
				{
					var v2 = originalVerts[i];
					b = glm__$Vec4_Vec4_$Impl_$._new(glm__$Vec3_Vec3_$Impl_$.get_x(v2),glm__$Vec3_Vec3_$Impl_$.get_y(v2),glm__$Vec3_Vec3_$Impl_$.get_z(v2),1);
				}
				v1 = glm__$Mat4_Mat4_$Impl_$.multVec4(a,b);
			}
			$r = glm__$Vec3_Vec3_$Impl_$._new(glm__$Vec4_Vec4_$Impl_$.get_x(v1),glm__$Vec4_Vec4_$Impl_$.get_y(v1),glm__$Vec4_Vec4_$Impl_$.get_z(v1));
			return $r;
		}(this)));
	}
	var canvas = window.document.getElementsByTagName("canvas")[0];
	var ctx = canvas.getContext("2d",null);
	Sample.drawVertsWireframe(originalVerts,ctx,"#0000ff");
	Sample.drawVertsWireframe(translatedVerts,ctx,"#ff0000");
};
Sample.drawVertsWireframe = function(verts,ctx,colour) {
	ctx.beginPath();
	ctx.strokeStyle = colour;
	ctx.moveTo(glm__$Vec3_Vec3_$Impl_$.get_x(verts[0]),glm__$Vec3_Vec3_$Impl_$.get_y(verts[0]));
	var _g1 = 1;
	var _g = verts.length;
	while(_g1 < _g) {
		var i = _g1++;
		ctx.lineTo(glm__$Vec3_Vec3_$Impl_$.get_x(verts[i]),glm__$Vec3_Vec3_$Impl_$.get_y(verts[i]));
	}
	ctx.lineTo(glm__$Vec3_Vec3_$Impl_$.get_x(verts[0]),glm__$Vec3_Vec3_$Impl_$.get_y(verts[0]));
	ctx.stroke();
	ctx.closePath();
};
var glm_GLM = function() { };
glm_GLM.translate = function(m,translation) {
	var t = glm__$Mat4_Mat4_$Impl_$._new(1.0);
	var x = glm__$Vec3_Vec3_$Impl_$.get_x(translation);
	t[0][3] = x;
	var x1 = glm__$Vec3_Vec3_$Impl_$.get_y(translation);
	t[1][3] = x1;
	var x2 = glm__$Vec3_Vec3_$Impl_$.get_z(translation);
	t[2][3] = x2;
	if(m == null) return t;
	var a = t;
	var rows = [(function($this) {
		var $r;
		var a1;
		{
			var a2;
			var a3 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[0]),a[0][0]);
			var b2 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[1]),a[0][1]);
			a2 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a3),b2);
			var b1 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[2]),a[0][2]);
			a1 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a2),b1);
		}
		var b = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[3]),a[0][3]);
		$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a1),b);
		return $r;
	}(this)),(function($this) {
		var $r;
		var a4;
		{
			var a5;
			var a6 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[0]),a[1][0]);
			var b5 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[1]),a[1][1]);
			a5 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a6),b5);
			var b4 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[2]),a[1][2]);
			a4 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a5),b4);
		}
		var b3 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[3]),a[1][3]);
		$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a4),b3);
		return $r;
	}(this)),(function($this) {
		var $r;
		var a7;
		{
			var a8;
			var a9 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[0]),a[2][0]);
			var b8 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[1]),a[2][1]);
			a8 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a9),b8);
			var b7 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[2]),a[2][2]);
			a7 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a8),b7);
		}
		var b6 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[3]),a[2][3]);
		$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a7),b6);
		return $r;
	}(this)),(function($this) {
		var $r;
		var a10;
		{
			var a11;
			var a12 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[0]),a[3][0]);
			var b11 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[1]),a[3][1]);
			a11 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a12),b11);
			var b10 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[2]),a[3][2]);
			a10 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a11),b10);
		}
		var b9 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[3]),a[3][3]);
		$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a10),b9);
		return $r;
	}(this))];
	a = rows;
	return a;
};
glm_GLM.scale = function(m,scale) {
	var t = glm__$Mat4_Mat4_$Impl_$._new(1.0);
	var x = glm__$Vec3_Vec3_$Impl_$.get_x(scale);
	t[0][0] = x;
	var x1 = glm__$Vec3_Vec3_$Impl_$.get_y(scale);
	t[1][1] = x1;
	var x2 = glm__$Vec3_Vec3_$Impl_$.get_z(scale);
	t[2][2] = x2;
	if(m == null) return t;
	var a = t;
	var rows = [(function($this) {
		var $r;
		var a1;
		{
			var a2;
			var a3 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[0]),a[0][0]);
			var b2 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[1]),a[0][1]);
			a2 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a3),b2);
			var b1 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[2]),a[0][2]);
			a1 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a2),b1);
		}
		var b = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[3]),a[0][3]);
		$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a1),b);
		return $r;
	}(this)),(function($this) {
		var $r;
		var a4;
		{
			var a5;
			var a6 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[0]),a[1][0]);
			var b5 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[1]),a[1][1]);
			a5 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a6),b5);
			var b4 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[2]),a[1][2]);
			a4 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a5),b4);
		}
		var b3 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[3]),a[1][3]);
		$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a4),b3);
		return $r;
	}(this)),(function($this) {
		var $r;
		var a7;
		{
			var a8;
			var a9 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[0]),a[2][0]);
			var b8 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[1]),a[2][1]);
			a8 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a9),b8);
			var b7 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[2]),a[2][2]);
			a7 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a8),b7);
		}
		var b6 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[3]),a[2][3]);
		$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a7),b6);
		return $r;
	}(this)),(function($this) {
		var $r;
		var a10;
		{
			var a11;
			var a12 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[0]),a[3][0]);
			var b11 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[1]),a[3][1]);
			a11 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a12),b11);
			var b10 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[2]),a[3][2]);
			a10 = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a11),b10);
		}
		var b9 = glm__$Vec4_Vec4_$Impl_$.multiplyScalar(glm__$Vec4_Vec4_$Impl_$.clone(m[3]),a[3][3]);
		$r = glm__$Vec4_Vec4_$Impl_$.addVec4(glm__$Vec4_Vec4_$Impl_$.clone(a10),b9);
		return $r;
	}(this))];
	a = rows;
	return a;
};
glm_GLM.axisAngle = function(axis,angle) {
	angle /= 2;
	var s = Math.sin(angle);
	var q = glm__$Quat_Quat_$Impl_$._new(Math.cos(angle),s * glm__$Vec3_Vec3_$Impl_$.get_x(axis),s * glm__$Vec3_Vec3_$Impl_$.get_y(axis),s * glm__$Vec3_Vec3_$Impl_$.get_z(axis));
	return q;
};
var glm__$Mat3_Mat3_$Impl_$ = {};
glm__$Mat3_Mat3_$Impl_$._new = function(scale) {
	if(scale == null) scale = 0;
	var this1;
	var arr = [glm__$Vec3_Vec3_$Impl_$._new(scale,0,0),glm__$Vec3_Vec3_$Impl_$._new(0,scale,0),glm__$Vec3_Vec3_$Impl_$._new(0,0,scale)];
	this1 = arr;
	return this1;
	return this1;
};
glm__$Mat3_Mat3_$Impl_$.fromRows = function(a,b,c) {
	var m = glm__$Mat3_Mat3_$Impl_$._new();
	m[0] = a;
	m[1] = b;
	m[2] = c;
	return m;
};
glm__$Mat3_Mat3_$Impl_$.fromQuat = function(q) {
	var qx2 = Math.pow(glm__$Quat_Quat_$Impl_$.get_x(q),2);
	var qy2 = Math.pow(glm__$Quat_Quat_$Impl_$.get_y(q),2);
	var qz2 = Math.pow(glm__$Quat_Quat_$Impl_$.get_z(q),2);
	var m = glm__$Mat3_Mat3_$Impl_$.fromRows(glm__$Vec3_Vec3_$Impl_$._new(1 - 2 * qy2 - 2 * qz2,2 * glm__$Quat_Quat_$Impl_$.get_x(q) * glm__$Quat_Quat_$Impl_$.get_y(q) - 2 * glm__$Quat_Quat_$Impl_$.get_z(q) * glm__$Quat_Quat_$Impl_$.get_w(q),2 * glm__$Quat_Quat_$Impl_$.get_x(q) * glm__$Quat_Quat_$Impl_$.get_z(q) + 2 * glm__$Quat_Quat_$Impl_$.get_y(q) * glm__$Quat_Quat_$Impl_$.get_w(q)),glm__$Vec3_Vec3_$Impl_$._new(2 * glm__$Quat_Quat_$Impl_$.get_x(q) * glm__$Quat_Quat_$Impl_$.get_y(q) + 2 * glm__$Quat_Quat_$Impl_$.get_z(q) * glm__$Quat_Quat_$Impl_$.get_w(q),1 - 2 * qx2 - 2 * qz2,2 * glm__$Quat_Quat_$Impl_$.get_y(q) * glm__$Quat_Quat_$Impl_$.get_z(q) - 2 * glm__$Quat_Quat_$Impl_$.get_x(q) * glm__$Quat_Quat_$Impl_$.get_w(q)),glm__$Vec3_Vec3_$Impl_$._new(2 * glm__$Quat_Quat_$Impl_$.get_x(q) * glm__$Quat_Quat_$Impl_$.get_z(q) - 2 * glm__$Quat_Quat_$Impl_$.get_y(q) * glm__$Quat_Quat_$Impl_$.get_w(q),2 * glm__$Quat_Quat_$Impl_$.get_y(q) * glm__$Quat_Quat_$Impl_$.get_z(q) + 2 * glm__$Quat_Quat_$Impl_$.get_x(q) * glm__$Quat_Quat_$Impl_$.get_w(q),1 - 2 * qx2 - 2 * qy2));
	return m;
};
var glm__$Mat4_Mat4_$Impl_$ = {};
glm__$Mat4_Mat4_$Impl_$._new = function(scale) {
	if(scale == null) scale = 0;
	var this1;
	var arr = [glm__$Vec4_Vec4_$Impl_$._new(scale,0,0,0),glm__$Vec4_Vec4_$Impl_$._new(0,scale,0,0),glm__$Vec4_Vec4_$Impl_$._new(0,0,scale,0),glm__$Vec4_Vec4_$Impl_$._new(0,0,0,scale)];
	this1 = arr;
	return this1;
	return this1;
};
glm__$Mat4_Mat4_$Impl_$.fromRows = function(a,b,c,d) {
	var m = glm__$Mat4_Mat4_$Impl_$._new();
	m[0] = a;
	m[1] = b;
	m[2] = c;
	m[3] = d;
	return m;
};
glm__$Mat4_Mat4_$Impl_$.multVec4 = function(this1,b) {
	return glm__$Vec4_Vec4_$Impl_$._new(this1[0][0] * b[0] + this1[0][1] * b[1] + this1[0][2] * b[2] + this1[0][3] * b[3],this1[1][0] * b[0] + this1[1][1] * b[1] + this1[1][2] * b[2] + this1[1][3] * b[3],this1[2][0] * b[0] + this1[2][1] * b[1] + this1[2][2] * b[2] + this1[2][3] * b[3],this1[3][0] * b[0] + this1[3][1] * b[1] + this1[3][2] * b[2] + this1[3][3] * b[3]);
};
var glm__$Quat_Quat_$Impl_$ = {};
glm__$Quat_Quat_$Impl_$.get_w = function(this1) {
	return this1[0];
};
glm__$Quat_Quat_$Impl_$.get_x = function(this1) {
	return this1[1];
};
glm__$Quat_Quat_$Impl_$.get_y = function(this1) {
	return this1[2];
};
glm__$Quat_Quat_$Impl_$.get_z = function(this1) {
	return this1[3];
};
glm__$Quat_Quat_$Impl_$._new = function(w,x,y,z) {
	if(z == null) z = 0;
	if(y == null) y = 0;
	if(x == null) x = 0;
	if(w == null) w = 0;
	var this1;
	var arr = [];
	arr.push(w);
	arr.push(x);
	arr.push(y);
	arr.push(z);
	this1 = arr;
	return this1;
};
var glm__$Vec3_Vec3_$Impl_$ = {};
glm__$Vec3_Vec3_$Impl_$.get_x = function(this1) {
	return this1[0];
};
glm__$Vec3_Vec3_$Impl_$.get_y = function(this1) {
	return this1[1];
};
glm__$Vec3_Vec3_$Impl_$.get_z = function(this1) {
	return this1[2];
};
glm__$Vec3_Vec3_$Impl_$._new = function(x,y,z) {
	if(z == null) z = 0;
	if(y == null) y = 0;
	if(x == null) x = 0;
	var this1;
	var arr = [];
	arr.push(x);
	arr.push(y);
	arr.push(z);
	this1 = arr;
	return this1;
};
glm__$Vec3_Vec3_$Impl_$.clone = function(this1) {
	var copy = glm__$Vec3_Vec3_$Impl_$._new();
	copy[0] = this1[0];
	copy[1] = this1[1];
	copy[2] = this1[2];
	return copy;
};
glm__$Vec3_Vec3_$Impl_$.multiplyScalar = function(this1,b) {
	this1[0] *= b;
	this1[1] *= b;
	this1[2] *= b;
	return this1;
};
var glm__$Vec4_Vec4_$Impl_$ = {};
glm__$Vec4_Vec4_$Impl_$.get_x = function(this1) {
	return this1[0];
};
glm__$Vec4_Vec4_$Impl_$.get_y = function(this1) {
	return this1[1];
};
glm__$Vec4_Vec4_$Impl_$.get_z = function(this1) {
	return this1[2];
};
glm__$Vec4_Vec4_$Impl_$._new = function(x,y,z,w) {
	if(w == null) w = 0;
	if(z == null) z = 0;
	if(y == null) y = 0;
	if(x == null) x = 0;
	var this1;
	var arr = [];
	arr.push(x);
	arr.push(y);
	arr.push(z);
	arr.push(w);
	this1 = arr;
	return this1;
};
glm__$Vec4_Vec4_$Impl_$.clone = function(this1) {
	var copy = glm__$Vec4_Vec4_$Impl_$._new();
	copy[0] = this1[0];
	copy[1] = this1[1];
	copy[2] = this1[2];
	copy[3] = this1[3];
	return copy;
};
glm__$Vec4_Vec4_$Impl_$.addVec4 = function(this1,b) {
	this1[0] += b[0];
	this1[1] += b[1];
	this1[2] += b[2];
	this1[3] += b[3];
	return this1;
};
glm__$Vec4_Vec4_$Impl_$.multiplyScalar = function(this1,b) {
	this1[0] *= b;
	this1[1] *= b;
	this1[2] *= b;
	this1[3] *= b;
	return this1;
};
Sample.main();
})(typeof console != "undefined" ? console : {log:function(){}});
