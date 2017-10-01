
import hxd.App;
import h2d.Bitmap;
import h2d.Tile;
import h3d.Engine;


class Main extends App {

	var ratio : Float;

	var left  : Bitmap;
	var right : Bitmap;

	private override function init() {

		ratio = 0;
		engine.backgroundColor = 0x90A4AE;

		var tile : Tile = Tile.fromColor(0x607D8B,10,10);
		left   = new Bitmap(tile,s2d);
		left.x = s2d.width * 0.5;
		left.y = s2d.height * 0.5;

		right   = new Bitmap(tile,s2d);
		right.x = s2d.width * 0.5;
		right.y = s2d.height * 0.5;


	}

	private override function update(dt:Float) {

		ratio += 0.001;
		if (ratio > 0.2) ratio -= 0.1;

		left.rotation += 0.1 + ratio;
		left.tile.dx = -50;
		left.tile.dy = -50;

		right.rotation += 0.01 + ratio;
		right.tile.dy = -50;

	}

	public static function main() {

		new Main();

	}

}