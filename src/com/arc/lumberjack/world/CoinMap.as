package com.arc.lumberjack.world {
	import com.arc.lumberjack.entity.Coin;
	import com.arc.lumberjack.registry.Resource;
	
	import flash.display.BitmapData;
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;

	/**
	 * This class holds all the coins on the level, and loads itself from another bitmap. However, because
	 * we aren't creating a FlxTilemap, and we are simply adding a single object, we loop over the image
	 * ourself. Ideally we would load the coins dynamically as we move throughout the world (something that
	 * would be necessary with a big world or a lot of objects), but as we have a small world with only 
	 * a handful of coins we don't bother.
	 *  
	 * @author Arkeus
	 * 
	 */
	public class CoinMap extends FlxGroup {
		public function CoinMap() {
			 build();
		}
		
		/** The color of the coins in our color bitmap, allowing us to expand it later */
		private static const COIN_COLOR:uint = 0xffb400;
		/**
		 * Here we loop over each pixel in the Resource.COIN_MAP file and if a pixel is set to
		 * COIN_COLOR, we add a coin to the world at that tile.
		 */
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
