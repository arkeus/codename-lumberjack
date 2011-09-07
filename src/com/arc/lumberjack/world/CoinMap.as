package com.arc.lumberjack.world {
	import com.arc.lumberjack.entity.Coin;
	import com.arc.lumberjack.registry.Resource;
	
	import flash.display.BitmapData;
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;

	public class CoinMap extends FlxGroup {
		public function CoinMap() {
			 build();
		}
		
		private static const COIN_COLOR:uint = 0xffb400;
		private function build():void {
			var pixels:BitmapData = new FlxSprite(0, 0, Resource.COIN_MAP).pixels;
			for (var x:int = 0; x < pixels.width; x++) {
				for (var y:int = 0; y < pixels.height; y++) {
					var pixel:uint = pixels.getPixel(x, y);
					if (pixel == COIN_COLOR) {
						this.add(new Coin(x * Tile.WIDTH, y * Tile.HEIGHT));
					}
				}
			}
		}
	}
}
