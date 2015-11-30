import glm.Mat3;
import glm.Mat4;
import glm.GLM;
import glm.Vec3;

import js.Browser;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;

class Sample {
	static public function main() {
		var origin:Vec3 = new Vec3(150, 150);
		var originReset:Mat4 = GLM.translate(-1 * origin);
		var translate:Mat4 = GLM.translate(origin);
		var rotate:Mat4 = Mat3.fromQuat(GLM.axisAngle(new Vec3(0, 0, 1), Math.PI / 4));
		var scale:Mat4 = GLM.scale(new Vec3(0.5, 0.5, 0));

		var originalVerts:Array<Vec3> = [
			new Vec3(100, 100, 0),
			new Vec3(200, 100, 0),
			new Vec3(200, 200, 0),
			new Vec3(100, 200, 0)
		];
		var translatedVerts:Array<Vec3> = new Array<Vec3>();

		for(i in 0...originalVerts.length) {
			// first multiply it by the reset so that all transforms take place
			// around its midpoint
			// then rotate it
			// then scale it
			// then move it back to where it was
			translatedVerts.push(translate * scale * rotate * originReset * originalVerts[i]);
		}

		// now actually display the results!
		var canvas:CanvasElement = cast Browser.document.getElementsByTagName('canvas')[0];
		var ctx:CanvasRenderingContext2D = canvas.getContext2d();
		drawVertsWireframe(originalVerts, ctx, "#0000ff");
		drawVertsWireframe(translatedVerts, ctx, "#ff0000");
	}

	private static function drawVertsWireframe(verts:Array<Vec3>, ctx:CanvasRenderingContext2D, colour:String) {
		ctx.beginPath();
		ctx.strokeStyle = colour;
		ctx.moveTo(verts[0].x, verts[0].y);
		for(i in 1...verts.length) {
			ctx.lineTo(verts[i].x, verts[i].y);
		}
		ctx.lineTo(verts[0].x, verts[0].y);
		ctx.stroke();
		ctx.closePath();
	}
}