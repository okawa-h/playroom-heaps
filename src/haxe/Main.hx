
import hxd.App;
import h2d.Bitmap;
import h2d.Tile;
import h2d.Sprite;
import h3d.Engine;


class Main extends App {

	static inline var LENGTH : Int = 16;
	var ratio  : Float;
	var bitmapArr : Array<Bitmap>;

	var sprite : Sprite;
	var left   : Bitmap;
	var right  : Bitmap;

	private override function init() {

		bitmapArr = [];

		sprite   = new Sprite(s2d);
		sprite.x = Std.int(s2d.width * .5);
		sprite.y = Std.int(s2d.height * .5);

		ratio = 0;
		engine.backgroundColor = 0x90A4AE;

		var tile : Tile = Tile.fromColor(0x607D8B,10,10);
		left   = new Bitmap(tile,sprite);
		left.x = 0;
		left.y = 0;

		right   = new Bitmap(tile,sprite);
		right.x = 0;
		right.y = 0;


		for( i in 0...LENGTH ) {

			var bmp : Bitmap = new Bitmap(tile, sprite);
			bmp.x = Math.cos(i * Math.PI / 8) * 100;
			bmp.y = Math.sin(i * Math.PI / 8) * 100;
			bmp.alpha = 0.1;
			bmp.blendMode = Add;
			bitmapArr.push(bmp);

		}


	}

	private override function onResize() {

		if( sprite == null ) return;

		sprite.x = Std.int(s2d.width * .5);
		sprite.y = Std.int(s2d.height * .5);

	}

	private override function update(dt:Float) {

		ratio += 0.001;
		if (ratio > 0.2) ratio -= 0.1;

		left.rotation += 0.1 + ratio;
		left.tile.dx = -50;
		left.tile.dy = -50;

		right.rotation += 0.01 + ratio;
		right.tile.dy = -50;

		// for (i in 0 ... sprite.getSpritesCount()) {

		// 	var child : Sprite = sprite.getChildAt(i);
		// 	child.rotation += 0.01;
			
		// }

		for (i in 0 ... bitmapArr.length) {

			var bmp : Bitmap = bitmapArr[i];
			bmp.rotation += 0.01;
			bmp.tile.dx = -50;
			bmp.tile.dy = -50;
			
		}

	}

	public static function main() {

		new Main();

	}

}