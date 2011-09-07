package com.arc.lumberjack.entity {
	import com.arc.lumberjack.registry.Resource;
	
	import org.flixel.FlxSprite;

	public class Coin extends FlxSprite {
		public function Coin(x:Number, y:Number) {
			super(x, y);
			loadGraphic(Resource.COIN, true, false, 2, 3);
			addAnimation("shine", [0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4], 8);
			play("shine");
			
			offset.x = -1;
		}
	}
}
