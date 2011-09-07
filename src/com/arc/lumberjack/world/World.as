package com.arc.lumberjack.world {
	import com.arc.lumberjack.entity.Player;
	import com.arc.lumberjack.registry.Resource;
	
	import flash.display.BitmapData;
	
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;

	public class World extends FlxTilemap {
		private var _width:int;
		private var _height:int;
		
		public function World() {
			super();
			
			var pixels:BitmapData = new FlxSprite(0, 0, Resource.WORLD).pixels;
			var worldString:String = FlxTilemap.bitmapToCSV(pixels, false, 1, TILES);
			loadMap(worldString, Resource.TILES, Tile.WIDTH, Tile.HEIGHT, OFF, 0, 1, 25);
			setupLiquids();
		}
		
		private static const LIQUID_TILES:Array = [8, 9, 18, 19];
		private function setupLiquids():void {
			for each(var tileIndex:int in LIQUID_TILES) {
				setTileProperties(tileIndex, NONE, liquidCallback, Player);
			}
		}
		
		/**
		 * This is the function that will be called whenever a Player object collides with a liquid
		 * tile. The objects passed to it are the tile that was collided (water or lava), and the
		 * object that collided with said tile (the player, because above we limited this callback to
		 * only happen when the player touches it).
		 * 
		 * @param tile the tile that was collided with
		 * @param object the object that collide with the tile
		 * 
		 */		
		private function liquidCallback(tile:FlxTile, object:FlxObject):void {
			(object as Player).liquid();
		}
		
		/**
		 * These are the colors for each tile. When reading in the map bitmap (map.png), if (for example) it sees
		 * a pixel with the color 0x1f1400 then it will put tile id "1" there, because that color is at index 1
		 * in this array. Because our tilesheet is 5x10, this array is also 5x10 (but it's actually a 1 dimensional
		 * array, it's just laid out as 5x10 to make it easier to compare this to the tile image as you are
		 * working on it). 
		 */		
		private static const TILES:Array = [
			0x000000, 0x1f1400, 0x222222, 0x0c90ff, 0xe22929,
			0x239e0f, 0x0d8906, 0x100a00, 0x007df8, 0xda1e1e,
			0x1c7c0c, 0x066600, 0xa7f49d, 0x0972ca, 0xb32020,
			0x653e0b, 0x4e2700, 0x313131, 0x0063c4, 0xac1717,
			0x372400, 0x301f00, 0x393939, 0x363636, 0x000000,
			0x2cb21a, 0x4c2f0a, 0x474747, 0x7b5626, 0x5e3e13,
			0x6c491b, 0x000000, 0x6f6f6f, 0x000000, 0x000000,
			0x000000, 0x000000, 0x000000, 0x745020, 0x634217,
			0x000000, 0x000000, 0x000000, 0x7c7c7c, 0x636363,
			0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
		];
	}
}
