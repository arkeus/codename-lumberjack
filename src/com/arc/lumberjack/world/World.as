package com.arc.lumberjack.world {
	import com.arc.lumberjack.registry.Resource;
	import com.arc.lumberjack.utility.Util;
	
	import flash.display.BitmapData;
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;

	public class World extends FlxTilemap {
		private var _width:int;
		private var _height:int;
		
		public function World() {
			super();
			loadMap(fromImage(Resource.WORLD), Resource.TILES, Tile.WIDTH, Tile.HEIGHT, OFF, 0, 1, 50); 
		}
		
		/**
		 * Takes in an image of pixels, and maps each pixel to a tile for the world map.
		 */
		private function fromImage(image:Class):String {
			var pixels:BitmapData = new FlxSprite(0, 0, image).pixels;
			_width = pixels.width;
			_height = pixels.height;
			
			var map:Array = new Array;
			for (var r:int = 0; r < _height; r++) {
				var row:Array = new Array;
				for (var c:int = 0; c < _width; c++) {
					var tile:int = translateTile(pixels.getPixel(c, r));
					row.push(tile);
				}
				map.push(row.join(","));
			}
			
			return map.join("\n"); 
		}
		
		private function translateTile(pixel:uint):int {
			switch (pixel) {
				case Tile.GRASS:
					return Util.random(50, 54);
				break;
				case Tile.DIRT:
					return Util.random(60, 64);
				break;
				case Tile.TREE_BOTTOM:
					return 20;
				break;
				case Tile.TREE_TOP:
					return 10;
				break;
				default:
					return 0;
				break;
			}
		}
	}
}
